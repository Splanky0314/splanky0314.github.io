---
layout: post
title: cryptography is required for sha256_password or caching_sha2_password
subheading: Newstart
author: Daeun
categories: MySQL
banner:
tags: DaeunWorld Mysql cryptography is required for sha256_password or caching_sha2_password user select db fastapi pymysql
---

mysql과 fastapi를 연결하고 실행한 과정에서 `cryptography is required for sha256_password or caching_sha2_password` 오류가 발생했습니다.

오류가 발생한 코드

main.py

```python
db_url = "mysql+pymysql://"+mysql_user+":"+mysql_password+"@"+base_url+":3306/solved_earth"

engine = create_engine(db_url, echo=True)

def create_db_and_tables():
    SQLModel.metadata.create_all(engine)
```

## pipenv를 사용하신다면?

저의 경우 pipenv 가상환경을 사용하고 있기 때문에 아래 명령어를 실행해 주었는데요,

```
pipenv install cryptograpy
```

하지만 여전히 오류가 발생했습니다.............

```
pipenv install pymysql[rsa]
```
도 해보고 stack overflow에 있는 건 다 해봤지만,,, 같은 오류가 계속 발생했습니다.

### 해결 방법

```
pip3 install cryptography
```

ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ

이유는 모르겠으나 pipenv install로 하면 제대로 적용이 안되나 봅니다...;;


pipenv 안쓰는 데도 오류가 나시는 분들을 위한 내용

## 첫 번째 해결 방법

```
pip install cryptography
```

## 두 번째 해결 방법

 mysql과 연결하는 과정에서 db user계정의 아이디나 비밀번호가 틀린 경우에 이러한 에러가 뜨는 경우가 있다고 합니다.

아이디랑 비번 한번 다시 확인해 보시는 것을 추천합니다.

[stack overflow 관련 글](https://stackoverflow.com/questions/54477829/cryptography-is-required-for-sha256-password-or-caching-sha2-password)

### db user계정 확인 방법

```
use mysql;

select user, host from user;
```