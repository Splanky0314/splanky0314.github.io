---
layout: post
title: '[Django] Migration이란? makemigrations, migrate'
subheading: 
author: Daeun
categories: Django migrate migration makemigrations django-admin REST API
banner:
tags: 

---

## Migration
쉽게 말해 **모델을 데이터베이스에 적용시키는 과정**입니다.


모델을 만들거나 수정, 삭제하는 등 models.py에 변화가 생겼을 때 migration을 통해 장고 프로젝트에 모델의 변경 사항을 반영시킬 수 있습니다.

migration 과정을 세부적으로 분석하면 다음과 같습니다.

## makemigrations
```
django manage.py makemigrations
```
model을 변경한 내용을 기록하여 파일로 만들어주는 과정입니다. djago app마다 migrations 폴더가 있는데 이 폴더 안의 파일이 이 과정을 통해 만들어집니다.


## migrate
```
django manage.py migrate
```
makemigrations로 만들어진 파일을 실제 실행시켜서 데이터베이스에 변경사항을 저장하는 과정입니다.

>> 출처: 백엔드를 위한 Django REST Framework(권태형)