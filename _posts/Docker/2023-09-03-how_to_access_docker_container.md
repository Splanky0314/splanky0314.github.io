---
layout: post
title: '[Docker 지침서] Docker Container 접속 방법'
subheading: 
author: Daeun
categories: Docker
banner:
tags: docker docker_container github actions yml release.yml /bin/bash 

---

## Docker Container 접속 방법

1. docker container id 찾기

	```
	docker ps
	```
	위 명령어를 통해 현재 실행 중인 container를 찾을 수 있습니다.

2. container 접속하기

	```
	# 접속 방법
	docker exec -it [CONTAINER ID] /bin/bash

	# 탈출 방법
	exit 
	```

	내부에서 당연히 `ls`로 파일 구조도 확인 가능합니다.

## 여담

아니 `release.yml`한테 .env 파일 좀 만들어 달라고 부탁했는데,

왜 안만들어줌??;; 억울하네 내가 잘 해줬는데....