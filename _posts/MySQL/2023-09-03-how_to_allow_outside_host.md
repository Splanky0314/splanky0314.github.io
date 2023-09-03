---
layout: post
title: '[당신을 위한 MySQL] mysql db 외부 접속 허용 방법'
subheading: Newstart
author: Daeun
categories: MySQL
banner:
tags: DaeunWorld Mysql cryptography is required for sha256_password or caching_sha2_password user select db fastapi pymysql
---

저는 mysql, ubuntu LTS 22.04 환경에서 진행했습니다.

## 1. mysql 사용자 계정 만들기

```
create user '유저이름'@'%' identified by '비밀번호';
grant all privileges on *.* to '유저이름'@'%' with grant option
```

%는 모든 ip에 대해 접속을 허용한다는 의미입니다. 특정 ip에게만 허용하고 싶다면, %부분에 허용할 ip주소를 적어주시면 됩니다.

## 2. mysqld.cnf 파일 수정

```
cd /etc/mysql/mysql.config.d
vim mysqld.cnf
```

아마 아래와 같은 내용이 있을 겁니다. 

```
# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
bind-address          = 127.0.0.1
mysqlx-bind-address     = 127.0.0.1
```

위 파일에서 `bind-address`를 수정해줍니다.

```
# bind-address          = 127.0.0.1
bind-address = 0.0.0.0
```

## 3. mysql 포트 개방(3306)

```
# mysql 접속
mysql

# 포트 개방
ufw allow out 3306/tcp
ufw allow in 3306/tcp

service mysql restart
```

끝~