---
layout: post
title: '[Django] django 개발환경 초기 세팅'
subheading: 
author: Daeun
categories: Django
banner:
tags: 

---

1. 파이썬 가상환경 만들기
```
# venv라는 이름의 파이썬 가상환경을 생성한다.
python -m venv venv

# 가상환경 진입
.\venv\scripts\activate
```

2. 장고 프로젝트 시작
```
# .은 현재 디텍터리를 프로젝트 디렉터리로 만든다는 의미
django-admin startproject config .
```

3. 장고 앱 만들기
```
django-admin startapp 앱이름
```