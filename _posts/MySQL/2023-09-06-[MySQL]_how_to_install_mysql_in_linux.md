---
layout: post
title: '[당신을 위한 MySQL] linux에서 MySQL 설치하기, Docker 설치하기'
subheading: 
author: Daeun
categories: MySQL
banner:
tags: DaeunWorld Mysql docker linux ubuntu sudo mysql-server docker.io systemctl mysql SQL database container compose docker-compose
---

## Linux에서 MySQL 설치 및 세팅

```
sudo apt-get update
sudo apt-get install mysql-server
sudo ufw allow mysql
sudo systemctl start mysql

# 서버가 시작 될 때마다 자동으로 MySQL 실행
sudo systemctl enable mysql
```

**참고** 

외부에서 db에 접속할 수 있게 하려면 몇 가지 설정이 더 필요합니다. 아래 게시물을 확인해주세요!

[[당신을 위한 MySQL] mysql db 외부 접속 허용 방법](https://daeunworld.kr/mysql/2023/09/03/how_to_allow_outside_host.html)

### db 접속

```
mysql
```

### db 탈출

```
exit
```

## docker 설치

```
apt-get install docker.io
```

## 기타 mysql 명령어

```
# 버전 확인
show variables like "%version%";

CREATE DATABASE 만들이름;
```