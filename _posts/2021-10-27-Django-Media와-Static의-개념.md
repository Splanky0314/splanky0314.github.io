---
layout: post
title: Django Media와 Static의 개념
subheading: Spreky 웹사이트 Heroku에 배포하기
author: Daeun
categories: Django
banner:
tags: Django Spreky Hanwoolim Media Static
sidebar: []
---

## Static
개발하면서 사용하려고 준비해 놓은 정적 파일들이다.

## Media
Web 이용자들이 업로드하는 파일을 모아둔 것이다.

settings.py
``` python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static/')

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media/')
```

***STATIC_URL***은 웹사이트에서 사용할 정적파일의 최상위 URL을 정해 준 것이다.
***STATIC_ROOT***는 DEBUG=FALSE일 때 django에서 static 정적파일들을 모아둘 장소를 지정하는 것이다.(python manage.py collectstatic 명령시 프로젝트의 모든 static 파일들을 모을 수 있다!)

***MEDIA_URL***은 업로드된 파일의 최상위 URL을 정해준 것이다.
***MEDIA_ROOT***는 마찬가지로 업로드가 끝난 파일을 배치하는 최상위 경로이다.

제대로 static과 media에 접근하기 위해 urls.py에 아래의 코드를 추가하였다. 
``` python
urlpatterns = [
    # url codes~~~~~~

    re_path(r’^media/(?P<path>.*)$’, serve, {‘document_root’ : settings.MEDIA_ROOT}),
    re_path(r’^static/(?P<path>.*)$’, serve, {‘document_root’ : settings.STATIC_ROOT}),
]
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
```

## 여담
Spreky 사이트(한민고 학생들을 위한 서비스를 제공하는 사이트)에서 교내 신문 동아리와 연계하여 온라인에서 신문과 카드뉴스 등을 연재해보려고 하는데 직접 게시판을 django에서 완전 직접 만들어보려고 한다. media도 요 사이트에서 django_summernote를 사용해보려다가 공부하게 되었다. 요즘 갑자기 웹 뽕이 와가지고 온 신경이 여기로와있다. 잘때도 생각난다.... 내 나름대론 엄청난 도전인데 열심히 해보겠다.