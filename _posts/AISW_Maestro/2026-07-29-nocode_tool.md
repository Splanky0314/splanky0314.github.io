---
layout: post
title: '[MAKE] Firestore로 신규 수집된 데이터를 slack 메세지로 전송'
subheading: 
author: Daeun
categories: AISW_Maestro
banner: https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/AISW_Maestro_background.png
tags: AISW마에스트로 17기 2026년 서울센터 버디버드 다희혁
---

`버디버드`라는 앵무새에게 말을 가르치는 서비스를 개발중입니다.
아래는 그 과정에 대한 기록입니다.

## 피드백을 더 빠르게 확인하기 위하여

![버디버드 지표](https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/2026-07-29-make-log/1.jpeg)

버디버드 앱에는 `프로필` 탭에 피드백 창구가 존재합니다. 현재(26.07.29)까지 2명의 앵집사께서 이 창구로 피드백을 남겨주셨습니다.

### 피드백은 Firebase - Firestore에 기록된다. 

![버디버드 지표](https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/2026-07-29-make-log/2.jpeg)

사이트에 들어가서 확인해야 하므로, 즉각즉각 확인이 힘든 문제가 있습니다.

## 어떤 방법이 효율적일까?

### 1. 피드백이 들어오면 Jira 티켓 자동 발행

- 각 피드백에 대한 토의를 바로 티켓 댓글에서 진행하면 됨.

- BUT`ㅇㅇ, ㄴㄴ 등`고려할 필요가 없는 피드백이 무분별하게 티켓으로 발행될 가능성

-> 기각. 

### 2. 피드백이 들어오면 팀 Slack에 자동 알림, 검토 후 수동으로 Jira 티켓 생성

채택 !



## 고려한 구현 방안

### 1. Firebase의 `Cloud Function` 사용 -> 기각.

firebase 자체에 cloud function을 선언.
사용자 피드백이 들어온 즉시, 팀 Slack에 알림을 보내도록 한다.  

cloud function을 사용하려면 firebase 요금제 업그레이드 필요.
사용량이 적어 무료 크레딧(300$) 범위에서 사용 가능하지만,
무조건 40,000원이 빠져나가고, 나중에 payment를 해지해야 이 40,000이 환불됩니다.

그 사이에 무료 크레딧을 초과하면 40,000은 돌려받지 못합니다.

무서워서 기각.

### 2. Make.com : 코딩 없이 다양한 앱과 서비스를 연결 -> 채택

코딩 없이 다양한 앱과 서비스를 연결하여 반복적인 업무를 자동화할 수 있는 노코드(No-code) 플랫폼

![버디버드 지표](https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/2026-07-29-make-log/3.jpeg)

Google Cloud Platform에서 여러 API 권한 세팅을 진행해야 한다. 조금 귀찮음이 있습니다. 대략 10분 소요. 

아래와 같이 알림을 보내줍니다.

![버디버드 지표](https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/2026-07-29-make-log/4.jpeg)


