#!/usr/bin/env bash

set -Eeuo pipefail

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly LOG_FILE="$SCRIPT_DIR/push.log"
readonly COMMIT_MESSAGE="${*:-$(LC_TIME=C date '+%Y-%m-%d %H:%M:%S %z') commit}"

cd -- "$SCRIPT_DIR"

# Start a fresh log for each run and mirror all output to the terminal.
: >"$LOG_FILE"
exec > >(tee -a "$LOG_FILE") 2>&1

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Error: $SCRIPT_DIR is not inside a Git repository." >&2
  exit 1
fi

echo "== Git status =="
git status --short

if git diff --cached --quiet; then
  echo "No staged changes to commit. Pushing the current branch."
else
  echo "== Commit =="
  git commit -m "$COMMIT_MESSAGE"
fi

echo "== Push =="
git push origin HEAD

echo "Push completed successfully."
