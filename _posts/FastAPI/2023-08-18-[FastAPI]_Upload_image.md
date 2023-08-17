---
layout: post
title: '[FastAPI] 이미지 업로드 구현(이미지 http 통신으로 받아오기)'
subheading: 
author: Daeun
categories: FastAPI
banner:
tags: FastAPi python django sqlmodel engine API backend web http

---

## multipart/form-data

FastAPI로 POST 요청을 보낼 때, 이미지 파일은 `multipart/form-data`의 content type을 가지도록 코딩했습니다.

## 이미지를 저장할 경로 설정

`main.py`가 있는 폴더에서 static/image/ 폴더를 만들어 저장했습니다.

## FastAPI 이미지 업로드 구현 코드

```python
from typing import Optional, Annotated
from fastapi import FastAPI, File, UploadFile, Body
from sqlmodel import Field, Session, SQLModel, create_engine, select
from pathlib import Path
import datetime
import os, sys

sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from yolov5 import detect

from models import User, Photo, UserPhotoLink, Challenge

PROJECT_DIR = Path(__file__).resolve().parent.parent
BASE_DIR = Path(__file__).resolve().parent
STATIC_DIR = os.path.join(BASE_DIR,'static/')
IMG_DIR = os.path.join(STATIC_DIR,'images/')
SERVER_IMG_DIR = os.path.join('http://localhost:8000/','static/','images/')

sqlite_file_name = "database.db"
sqlite_url = f"sqlite:///{sqlite_file_name}"

connect_args = {"check_same_thread": False}
engine = create_engine(sqlite_url, echo=True, connect_args=connect_args)

def create_db_and_tables():
    SQLModel.metadata.create_all(engine)

def create_folder(root) -> None:
    try:
        if not os.path.exists(root):
            os.makedirs(root)
    except OSError:
        print("ERROR: Create Folder Failed :"+root)

app = FastAPI()

@app.post('/upload-images')
async def upload_board(username:Annotated[str, Body(embed=True, alias="username")], challenge:Annotated[str, Body(embed=True, alias="challenge")], file:UploadFile):
    root = os.path.join(IMG_DIR, username, challenge)
    create_folder(root)
    
    """ 
    Save Image 
    """
    saved_file_name = datetime.datetime.now().strftime("%Y%m%d%H%M%S")+".png"
    file_location = os.path.join(root, saved_file_name)

    with open(file_location, "wb+") as file_object:
        file_object.write(file.file.read())

    result={
        "success": True,
        "message": {
            
        }
    }
    return result

```