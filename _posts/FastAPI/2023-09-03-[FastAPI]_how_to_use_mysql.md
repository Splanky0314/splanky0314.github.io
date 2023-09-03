---
layout: post
title: '[FastAPI] MySQL DB 연결 방법(pymysql)'
subheading: 
author: Daeun
categories: FastAPI
banner:
tags: FastAPi python django sqlmodel engine API backend web http pathlib path pymysql mysql SQL

---

## MySQL 외부 접속 허용은 하셨나요?

물론 내부에서 local host를 사용하실 거라면 pass

만약 외부에서 db에 접속하실 거라면 아래 글을 먼저 보고 오세요~!

## mysql DB 연결하기

`main.py`의 내용입니다.

`db_url`의 변수를 간략히 설명드리자면,

- `solvedearth` = database 이름
- `mysql_user` = mysql 계정 이름
- `mysql_password` = mysql 계정 비밀번호

dotenv는 중요한 변수를 가져와주는 라이브러리 입니다.

```python
from dotenv import load_dotenv

load_dotenv(os.path.join(PROJECT_DIR, '.env'))
mysql_user = os.getenv("MYSQL_USER")
mysql_password = os.getenv("MYSQL_PASSWORD")
base_url = os.getenv("BASE_URL")

db_url = "mysql+pymysql://"+mysql_user+":"+mysql_password+"@"+base_url+":3306/solved_earth"

engine = create_engine(db_url, echo=True)

def create_db_and_tables():
    SQLModel.metadata.create_all(engine)

app = FastAPI()

@app.on_event("startup")
def on_startup():
    create_db_and_tables()

~
```