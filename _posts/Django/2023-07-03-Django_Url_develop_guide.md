---
layout: post
title: '[Django] 백엔드 url, request.method 가이드'
subheading: 
author: Daeun
categories: Django
banner:
tags: Django django-admin REST API DRF urls.py request.method method post, get
---

## 예시
- 도서 전체 목록 가져오기
  
  GET - `/books/` 

- 도서 1권 정보 등록하기
  
  POST - `/books/`

- 도서 1권 정보 가져오기
  
  GET - `/book/1/`

- 도서 1권 정보 수정하기
  
  PUT - `/book/1/`

- 도서 1권 정보 삭제하기
  
  DELETE - `/book/1/`