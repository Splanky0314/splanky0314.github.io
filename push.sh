#!/usr/bin/env bash

set -Eeuo pipefail

# 게시 흐름:
# 1. stage된 블로그 글만 확인한다.
# 2. 글 안의 로컬 이미지를 CDN 저장소로 옮기고 이미지 링크를 CDN URL로 바꾼다.
# 3. CDN 변경을 먼저 commit/push한 뒤, 이 블로그 저장소를 commit/push한다.
# 이 스크립트를 직접 실행하는 것은 두 저장소 push를 승인한 것으로 간주한다.
readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly LOG_FILE="$SCRIPT_DIR/push.log"
readonly COMMIT_MESSAGE="${*:-$(LC_TIME=C date '+%Y-%m-%d %H:%M:%S %z') commit}"
readonly CDN_DIR="${DAEUNWORLD_CDN_DIR:-/Users/daeunkim/Dev/DaeunWorld-CDN}"
readonly CDN_HELPER="$SCRIPT_DIR/scripts/cdnize_post_images.rb"

cd -- "$SCRIPT_DIR"

# 실행할 때마다 로그를 새로 만들고, 터미널 출력도 같은 내용으로 남긴다.
: >"$LOG_FILE"
exec > >(tee -a "$LOG_FILE") 2>&1

TMP_FILES=()

# helper와 git 명령은 임시 파일로 경로 목록을 주고받는다.
# 공백, 한글, 괄호가 들어간 파일명을 안전하게 처리하기 위해서다.
cleanup() {
  local file

  for file in "${TMP_FILES[@]+"${TMP_FILES[@]}"}"; do
    rm -f -- "$file"
  done
}

trap cleanup EXIT

# 임시 파일 경로를 호출자에게 넘기기 전에 정리 목록에 등록한다.
new_temp_file() {
  local file

  file="$(mktemp "${TMPDIR:-/tmp}/daeunworld-push.XXXXXX")"
  TMP_FILES+=("$file")
  printf '%s\n' "$file"
}

require_command() {
  local command_name="$1"

  if ! command -v "$command_name" >/dev/null 2>&1; then
    echo "Error: required command not found: $command_name" >&2
    exit 1
  fi
}

# CDN 쓰기는 예상한 저장소, 브랜치, 깨끗한 stage 상태에서만 허용한다.
# 잘못된 저장소에 이미지가 올라가는 실수를 막기 위한 확인이다.
ensure_cdn_repo() {
  local remote_url
  local branch

  if ! git -C "$CDN_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Error: CDN repository not found at $CDN_DIR" >&2
    exit 1
  fi

  remote_url="$(git -C "$CDN_DIR" remote get-url origin)"
  case "$remote_url" in
    *github.com/Splanky0314/CDN.git|*github.com/splanky0314/CDN.git|*github.com:Splanky0314/CDN.git|*github.com:splanky0314/CDN.git)
      ;;
    *)
      echo "Error: unexpected CDN origin remote: $remote_url" >&2
      exit 1
      ;;
  esac

  branch="$(git -C "$CDN_DIR" branch --show-current)"
  if [[ "$branch" != "main" ]]; then
    echo "Error: CDN repository must be on main, currently on $branch" >&2
    exit 1
  fi

  if ! git -C "$CDN_DIR" diff --cached --quiet; then
    echo "Error: CDN repository already has staged changes. Commit or unstage them before running push.sh." >&2
    exit 1
  fi
}

# 자동 CDN 변환 대상은 stage된 글 파일로 제한한다.
# untracked이거나 수정만 된 글은 작성자가 명시적으로 stage하기 전까지 건드리지 않는다.
collect_staged_posts() {
  local output_file="$1"
  local all_staged_file
  local path

  all_staged_file="$(new_temp_file)"
  git diff --cached --name-only -z --diff-filter=AM -- _posts >"$all_staged_file"
  : >"$output_file"

  while IFS= read -r -d '' path; do
    case "$path" in
      _posts/*.md)
        printf '%s\0' "$path" >>"$output_file"
        ;;
    esac
  done <"$all_staged_file"
}

# 같은 글 안에 staged/unstaged 변경이 섞여 있으면 링크 치환 전에 중단한다.
# 공개하려던 변경이 아닌 로컬 초안까지 함께 stage되는 일을 막기 위해서다.
ensure_no_unstaged_post_changes() {
  local posts_file="$1"
  local path
  local failed=0

  while IFS= read -r -d '' path; do
    if ! git diff --quiet -- "$path"; then
      echo "Error: staged post also has unstaged changes: $path" >&2
      failed=1
    fi
  done <"$posts_file"

  if [[ "$failed" -ne 0 ]]; then
    echo "Stage or stash the unstaged post edits before running push.sh." >&2
    exit 1
  fi
}

# Ruby helper가 반환한 정확한 경로만 stage한다.
# manifest는 공백과 비ASCII 파일명을 지원하기 위해 NUL 문자로 구분한다.
stage_nul_paths() {
  local repo_dir="$1"
  local paths_file="$2"
  local path

  [[ -s "$paths_file" ]] || return 0

  while IFS= read -r -d '' path; do
    [[ -n "$path" ]] || continue
    git -C "$repo_dir" add -- "$path"
  done <"$paths_file"
}

# CDN 이미지 commit이 어느 글에서 생겼는지 추적할 수 있게 메시지를 만든다.
cdn_commit_message() {
  local posts_file="$1"
  local count=0
  local first_post=""
  local path
  local slug

  while IFS= read -r -d '' path; do
    count=$((count + 1))
    [[ -n "$first_post" ]] || first_post="$path"
  done <"$posts_file"

  if [[ "$count" -eq 1 ]]; then
    slug="${first_post##*/}"
    slug="${slug%.md}"
    printf 'assets: add images for %s\n' "$slug"
  else
    printf 'assets: add DaeunWorld post images\n'
  fi
}

# CDN 변환은 두 번 나누어 실행한다.
# 첫 번째 dry-run에서 로컬 이미지가 있는지 먼저 확인한다.
# 변환할 링크가 있을 때만 CDN 저장소를 확인하고 실제 치환을 수행한다.
cdnize_staged_post_images() {
  local staged_posts_file
  local cdn_paths_file
  local changed_posts_file
  local message

  staged_posts_file="$(new_temp_file)"
  cdn_paths_file="$(new_temp_file)"
  changed_posts_file="$(new_temp_file)"

  collect_staged_posts "$staged_posts_file"
  [[ -s "$staged_posts_file" ]] || return 0

  require_command ruby
  ensure_no_unstaged_post_changes "$staged_posts_file"

  echo "== Check local post images =="
  ruby "$CDN_HELPER" \
    --repo-root "$SCRIPT_DIR" \
    --cdn-root "$CDN_DIR" \
    --paths-from "$staged_posts_file" \
    --cdn-paths-out "$cdn_paths_file" \
    --post-paths-out "$changed_posts_file" \
    --dry-run

  [[ -s "$changed_posts_file" ]] || return 0

  # 새 이미지가 필요할 때만, 가능한 늦은 시점에 CDN 저장소를 동기화한다.
  ensure_cdn_repo

  echo "== Sync CDN repository =="
  git -C "$CDN_DIR" pull --rebase --autostash origin main

  : >"$cdn_paths_file"
  : >"$changed_posts_file"

  echo "== Convert local post images to CDN =="
  ruby "$CDN_HELPER" \
    --repo-root "$SCRIPT_DIR" \
    --cdn-root "$CDN_DIR" \
    --paths-from "$staged_posts_file" \
    --cdn-paths-out "$cdn_paths_file" \
    --post-paths-out "$changed_posts_file"

  stage_nul_paths "$SCRIPT_DIR" "$changed_posts_file"
  stage_nul_paths "$CDN_DIR" "$cdn_paths_file"

  # 블로그 글은 CDN URL을 참조하므로, 글을 push하기 전에 이미지를 먼저 게시한다.
  if ! git -C "$CDN_DIR" diff --cached --quiet; then
    message="$(cdn_commit_message "$changed_posts_file")"
    echo "== CDN commit =="
    git -C "$CDN_DIR" commit -m "$message"

    echo "== CDN push =="
    git -C "$CDN_DIR" push origin main
  fi
}

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Error: $SCRIPT_DIR is not inside a Git repository." >&2
  exit 1
fi

if [[ ! -x "$CDN_HELPER" ]]; then
  echo "Error: CDN helper is missing or not executable: $CDN_HELPER" >&2
  exit 1
fi

require_command git

echo "== Git status =="
git status --short

# 아래 블로그 commit 전에 CDN 파일을 추가하고, 치환된 글을 다시 stage할 수 있다.
cdnize_staged_post_images

if git diff --cached --quiet; then
  echo "No staged changes to commit. Pushing the current branch."
else
  echo "== Commit =="
  git commit -m "$COMMIT_MESSAGE"
fi

echo "== Push =="
git push origin HEAD

echo "Push completed successfully."
