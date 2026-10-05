---
layout: post
description: "GitHub Actions 배포 중 리눅스 서버의 용량이 부족했던 원인을 살펴보고, 쌓인 Docker 이미지와 불필요한 파일을 정리한 과정을 기록했습니다."
title: '[Linux] 리눅스 용량 부족 해결 방법(docker 필요없는 파일 삭제)'
subheading: 
author: Daeun
image:
  path: "https://cdn.jsdelivr.net/gh/splanky0314/CDN@3e5253a4bbb7218a6a8c747afbcd60d0de3b323d/Linux/2023-09-03-how_to_delete_unnecessary_files_in_linux/3.png"
  width: 529
  height: 871
  alt: "Docker 배포 중 서버 용량 부족을 확인한 화면"
categories: Linux
banner:
tags: 리눅스 Linux ubuntu LTS iwinv 우분투 가상서버 docker container 

---

## 아니 용량이 부족하다고??

github actions가 실패했길래 로그를 봤더니, no disk ~~ (용량이 부족하다)라는 메세지가 떠있었습니다.

실제로 확인을 해보니 디스크의 86%가 사용중이라고 뜨더군요.

별로 한 것도 없는데 왜 나한테 돈을 더 달라는 건지....(서버 사양 업그레이드)

## 해결을 해보자.

여러가지 방법들이 존재하던데, 제 경우에는 docker 관련 불필요한 파일이 많은 것이 문제였습니다.

## 문제가 발생한 이유....

![github actions 에러 해결 방법](https://cdn.jsdelivr.net/gh/splanky0314/CDN@3e5253a4bbb7218a6a8c747afbcd60d0de3b323d/Linux/2023-09-03-how_to_delete_unnecessary_files_in_linux/3.png){: class="post-image" width="529" height="871" loading="eager" decoding="async" }

docker랑 github actions를 혼자 해보는 건 처음이라 그냥 계속 돌렸더니... ㅋㅋㅋㅋㅋㅋㅋㅋ 

이 사단이 나고 만 것이죠.

## docker 관련 불필요한 파일 삭제하기

```
docker system prune -a -f
```

![github actions 에러 해결 방법](https://cdn.jsdelivr.net/gh/splanky0314/CDN@3e5253a4bbb7218a6a8c747afbcd60d0de3b323d/Linux/2023-09-03-how_to_delete_unnecessary_files_in_linux/1.png){: class="post-image" width="649" height="310" loading="lazy" decoding="async" }

![github actions 에러 해결 방법](https://cdn.jsdelivr.net/gh/splanky0314/CDN@3e5253a4bbb7218a6a8c747afbcd60d0de3b323d/Linux/2023-09-03-how_to_delete_unnecessary_files_in_linux/2.png){: class="post-image" width="643" height="436" loading="lazy" decoding="async" }

ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 11.77GB ㅋㅋㅋㅋㅋㅋㅋㅋㅋ

총 디스크가 25GB 였는데 ㅋㅋㅋㅋㅋㅋㅋ

무튼 해결했습니다.