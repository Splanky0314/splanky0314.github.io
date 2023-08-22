---
layout: post
title: '[Github Page] jekyll 블로그 code formatting(코드 테마) 변경 방법'
subheading: 
author: Daeun
categories: Github_Page
banner:
tags: 깃헙페이지 github_page gem ruby gem버전 code highlight.js atom one dark darkmode jekyll github블로그 블로그코드 코드테마 코드 formatting YAT 테마 변경 programing

---

코드 테마는 프로그래밍 블로그에서 매우 중요합니다. 코드 가독성에 엄청난 영향을 미치기 때문이죠.

이번 글에서는 highlight.js를 이용하는 jekyll theme에서 어떻게 코드 테마를 변경하는지 알아볼 겁니다.

## 원하는 코드 테마 찾기

아래 링크에서 취향에 맞는 코드 테마를 찾는다.

[Highlight.js 코드 DEMO](https://highlightjs.org/demo)

## 코드 테마 변경 방법

`/includes/extensions/code-highlight.html`

원래 상태

두번째 줄에 link가 `~/default.min.css`로 되어 있는 것을 확인할 수 있다.
```html
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/styles/default.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/highlight.min.js"></script>
<!-- and it's easy to individually load additional languages -->
<script charset="UTF-8"
        src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/go.min.js"
        async></script>

```

## 코드 테마 변경해주기

해당 link의 뒷부분을 본인이 원하는 테마의 이름으로 바꿔줍니다.

저의 경우 "one-dark-theme"를 적용할 것이므로 `~/one-dark-theme`로 수정해 주겠습니다.

```
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/styles/atom-one-dark.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/highlight.min.js"></script>
<!-- and it's easy to individually load additional languages -->
<script charset="UTF-8"
        src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/go.min.js"
        async></script>
```

## 또다른 방법

사용하고 있는 jekyll theme이 처음에 highlight.js를 사용하지 않았다면 `Rouge`를 사용하는 것이 더 편할 수도 있습니다. 

잘 설명되어 있는 블로그가 있길래 링크를 걸어둡니다.

[jekyll Rouge theme DEMO](https://spsarolkar.github.io/rouge-theme-preview/)

[Add syntax highlighting to your Jekyll site with Rouge](https://bnhr.xyz/2017/03/25/add-syntax-highlighting-to-your-jekyll-site-with-rouge.html)