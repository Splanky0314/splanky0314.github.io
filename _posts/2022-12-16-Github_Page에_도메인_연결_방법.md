---
layout: post
title: Github Page에 도메인 연결 방법
subheading: 도메인 구매 방법 + Github Page와 도메인 연결 방법 
author: Daeun
categories: Github_Page
banner:
tags: git github_page 도메인구매 가비아 호스팅케이알 호스팅.kr 도메인구매방법 깃헙페이지

---

## Step1. 도메인 구매 방법(예시. 호스팅kr)
### 도메인 찾기
연결할 도메인을 구매해보자. 여러가지 판매 사이트가 존재한다. 사고 싶은 도메인을 정하고 여러 사이트를 뒤지면서 가장 싼 도메인을 파는 사이트에서 구매하자.(물론 각 사이트 별로 호스팅이나 네임서버 운영 퀄리티에 차이가 있기는 하다.)

![도메인 구매 방법-가비아](https://user-images.githubusercontent.com/79370538/208103266-79423052-1319-4e34-a169-c9a813b66827.png)
![도메인 구매 방법-호스팅 케이알](https://user-images.githubusercontent.com/79370538/208103395-ce234c49-60cb-4353-9aaf-92bc03bc52d5.png)
호스팅 케이알이 가장 싸서 호스팅kr로 결정했다.

---
### 도메인 구매 절차 밟기
사용할 기간(필자는 3년 선택)을 설정하고 결제 절차를 따라간다.
![Github Page에 도메인 연결](https://user-images.githubusercontent.com/79370538/208103949-116790d3-c174-414d-a1a0-d5cfb629328a.png)

등록 정보 아래에 보면 네임서버 정보가 있는데,

**네임서버(DNS)란?** 
Domain Name Server로 IP주소와 도메인 주소를 연결하는 역할을 해준다고 한다. 기본값으로 두고 결제를 진행하자.
![Github Page에 도메인 연결](https://user-images.githubusercontent.com/79370538/208104162-aed432e2-3a84-4113-9d24-7022d7d353e3.png)

---
### 구매 완료 화면 
![Github Page에 도메인 연결](https://user-images.githubusercontent.com/79370538/208105222-1ae50ab5-20cf-43af-951b-b6b555ef0bbe.png)


## Step2. Github Page와 도메인 연결 방법
### DNS 설정하기
호스팅kr(등 자기가 도메인 구매한 사이트)의 `도메인 관리-나의 도메인`으로 이동한다.
![Github Page에 도메인 연결](https://user-images.githubusercontent.com/79370538/208109460-f49c4bc7-1247-42d5-a818-1d12d4963bd6.png)

`DNS 레코드 관리`에 아래 5개를 추가해 준다.
![Github Page에 도메인 연결](https://user-images.githubusercontent.com/79370538/208109605-93e4af65-8ccd-4572-93cb-7bb35a78b20d.png)

DNS 설정은 끝났다.

---
### Github Page 설정하기

github page repository에서 `Settings - Pages`로 이동한다.
![Github Page에 도메인 연결](https://user-images.githubusercontent.com/79370538/208109744-e51f1d0d-08fe-4d9e-983e-51297bf808b7.png)

구매한 도메인을 입력하고 `Save`를 누르면 아래의 화면처럼 나온다.
그 뒤 `Enforce HTTPS`를 체크해주자. https는 http보다 보안성이 뛰어난 친구인데, 체크 후 적용되는 데에 몇십분 걸린다.
![Github Page에 도메인 연결](https://user-images.githubusercontent.com/79370538/208109842-4aef24b7-1977-41ef-a3e9-17604c318b21.png)

## 여담
내 도메인을 가져보는 것이 꿈이었다. 고등학교 졸업 기념으로 대학생 동안 열심히 글을 올리려고 3년치를 결제했다.(결제하고 보니 대학교는 4년이라는 사실이 생각났다 ㅋㅋㅋㅋ) 

나도 이제 내 도메인 있지롱~~~~~~~~~~~~