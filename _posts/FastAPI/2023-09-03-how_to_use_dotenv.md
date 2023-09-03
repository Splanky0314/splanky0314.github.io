---
layout: post
title: '[FastAPI 빠르게 알려드림] dotenv 사용 방법'
subheading: 
author: Daeun
categories: FastAPI
banner:
tags: FastAPi python django sqlmodel engine API backend web http pathlib path pymysql mysql SQL

---

## 1. 가상환경에 dotenv 설치하기
    ```
    pip install python-dotenv
    ```

    pipenv를 사용하신다면,

    ```
    pipenv install python-dotenv
    ```

## 2. 원하는 경로에 `.env` 파일 생성

    예시 `.env`

    ```
    BASE_URL = "~"
    MYSQL_USER = "~"
    MYSQL_PASSWORD = "~"
    ```

## 3. `main.py`에 `.env` 연결하기

    ```python
    from dotenv import load_dotenv

    load_dotenv(os.path.join(PROJECT_DIR, '.env'))
    ```

    끝