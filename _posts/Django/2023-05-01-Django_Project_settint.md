---
layout: post
title: '[Django] django 개발환경 초기 세팅(pipenv)'
subheading: 
author: Daeun
categories: Django
banner:
tags: 

---

### pipenv 처음 사용하는 경우
pipenv 먼저 설치
```
pip install pipenv
```

### pipenv 가상환경 만들기
```
pipenv --python 3.x
```

### pipenv 가상환경 진입
```
pipenv shell
```

### pipenv 가상환경 비활성화
```
exit
```

### pipenv 가상환경 제거, 삭제
```
pipenv -rm
```

### Pipfile?
venv의 requirements.txt의 역할을 하는 친구 정도로 생각하면 될듯
가상환경에 설치된 패키지들이 명시되어 있다.

### 가상환경 내 패키지 설치 방법
```
pipenv install 패키지명
```

## **Django 설정**

```
# .은 현재 디렉터리를 프로젝트 폴터로 만들겠다는 의미
django-admin startproject config . 
```