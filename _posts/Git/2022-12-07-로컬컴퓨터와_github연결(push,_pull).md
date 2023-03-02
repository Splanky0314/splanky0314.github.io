---
layout: post
title: 로컬컴퓨터와 github연결(push, pull)
subheading: git 초기 설정
author: Daeun
categories: Git
banner:
tags: git github push pull

---

## 로컬 컴퓨터 폴더에 github 연결 & pull
1. 원하는 로컬 위치에 폴더 생성 & 폴더 git bash로 열기
![로컬컴퓨터와 github연결](https://user-images.githubusercontent.com/79370538/206041403-f7009ce0-9c1d-49d6-a67d-8b3068ba60f1.png)

2. pull할 github repository 주소 복사하기
![로컬컴퓨터와 github연결](https://user-images.githubusercontent.com/79370538/206042376-78d1690e-ad68-4517-8bd2-56d66eec11f1.png)

3. 아래 명령어 순서대로 입력
```
git init
git remote add origin (github repository 주소)
git pull origin main
```
![로컬컴퓨터와 github연결](https://user-images.githubusercontent.com/79370538/206041590-7d1bf74f-2f08-4ebd-949a-1f674ff3a707.png)

4. 완료된 모습
![로컬컴퓨터와 github연결](https://user-images.githubusercontent.com/79370538/206042477-78cc9101-1b14-4bc3-92a9-3aca1333ad0a.png)

## 로컬 컴퓨터에서 github로 push

```
git add .
git commit -am "(커밋 이름)"
git push origin main
```