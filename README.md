# Daeun World

개발, IT 문제 해결, 제품 리뷰와 기록을 다루는 개인 Jekyll 블로그입니다.

- 운영 주소: <http://daeunworld.xyz>
- 저장소: <https://github.com/Splanky0314/splanky0314.github.io>
- 기반 테마: [jekyll-theme-yat](https://github.com/jeffreytse/jekyll-theme-yat)

## 로컬 실행

Ruby 버전은 `.ruby-version`을 따릅니다.

```bash
bundle install
bundle exec jekyll serve
```

로컬 주소는 <http://localhost:4000>입니다. `_config.yml`을 변경한 경우 서버를 다시 시작해야 합니다.

## 게시물 작성

게시물은 `_posts/<category>/YYYY-MM-DD-title.md`에 저장합니다.

```yaml
---
layout: post
title: "글 제목"
subheading: "선택 사항"
author: Daeun
categories: CategoryName
banner: "https://example.com/banner.jpg"
tags: tag1 tag2
---
```

게시 전 다음 명령으로 결과물을 확인합니다.

```bash
bundle exec jekyll build
```

`main` 브랜치에 push하면 GitHub Pages가 사이트를 빌드하고 배포합니다.

## 유지보수

배포 전에는 생성된 HTML의 이미지·내부 링크·검색 메타데이터를 검사합니다.
외부 이미지 검사는 네트워크 연결이 필요하며 HTTP 오류와 이미지가 아닌 응답도 확인합니다.

```bash
bundle exec jekyll build --destination /tmp/daeunworld-build
python3 scripts/audit_site.py /tmp/daeunworld-build --check-remote --output /tmp/daeunworld-seo.json
```

2026-07-11 변경에서 삭제되거나 이름이 바뀐 예전 글의 이미지는 변경 전 커밋
`3e5253a4bbb7218a6a8c747afbcd60d0de3b323d`의 고정 URL로 복구했습니다.
이 이미지들의 `CDN@<commit>/...` 주소에서 커밋을 제거하면 다시 404가 발생합니다.
CDN 파일을 정리할 때는 공개 글의 참조와 과거 버전 URL의 접근 가능 여부를 먼저 확인합니다.

외부 링크 검사는 GitHub Actions의 `External link report` 워크플로가 매주 실행합니다. 결과는 워크플로 실행 요약과 artifact에서 확인할 수 있습니다. 수동 실행도 가능합니다.

`_posts/hidden/`은 Git에서 제외된 로컬 보관 영역입니다. Jekyll 로컬 빌드에는 포함되므로 외부 공유용 빌드 결과를 배포할 때 주의해야 합니다.

## 라이선스

테마 원본은 MIT License를 따릅니다. 자세한 내용은 `LICENSE.txt`를 참고하세요.
