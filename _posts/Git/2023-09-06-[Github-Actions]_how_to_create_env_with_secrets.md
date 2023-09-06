---
layout: post
title: '[Github-Actions] github secrets를 이용해 docker container에 .env 생성하기(fastapi)'
subheading: 
author: Daeun
categories: Git
banner:
tags: DaeunWorld Mysql database oracle easy code metadatadata models daya system DBMS DB conceptual physical
---


## github secrets 생성

variable name: ENV_FILE
value: 

BASE_URL = "11.111~~"\nMYSQL_USER = "user~~"\nMYSQL_PASSWORD =  "~~~~"

**주의** 
 
ENV_FILE의 value에 작은 따옴표가 포함되면 안됩니다.

개행문자(\n)는 .env 파일을 생성할 때 줄바꿈으로 처리됩니다.

(아래 release.yml에서 echo를 할 때 작은 따옴표로 둘러 쌌기 때문입니다.)

## release.yml에 create .env 과정 추가
```
name: Release

on:
  push:
    branches: ["main"]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3
		
		~
		~
		~

      - name: Create env File
        run: |
          echo -e '${{ secrets.ENV_FILE }}' > .env
```

-e: 이스케이프 문자를 반영해주는 옵션