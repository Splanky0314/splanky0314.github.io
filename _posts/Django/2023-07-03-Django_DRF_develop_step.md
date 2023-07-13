---
layout: post
title: '[Django] Django Rest Framework 개발 순서'
subheading: 
author: Daeun
categories: Django
banner:
tags: Django django-admin REST API DRF 
---

django에는 하나의 웹Application 안에 models.py, urls.py, views.py 등 여러개의 파일이 존재한다. 이들 중 어떤 것을 먼저 건드리는 것이 효율적일까?

## 정답은 없지만 권장 사항은 존재한다.

당연히 여러가지 순서가 있을 수 있다. 그러나 통상적으로 아래의 순서를 따른다.
1. Models.py
2. Serializers.py
3. Views.py
4. Urls.py

**Model --> Serializers -> Views --> Urls**