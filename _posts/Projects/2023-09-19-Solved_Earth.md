---
layout: post
title: "[공개SW개발자대회] Solved.Earth 프로젝트 후기"
subheading: 
author: Daeun
categories: Projects
banner:
tags: Solved_Earth Hanmin Solved.ac Linux ubuntu fastapi OpenCV firebase flutter Environment application Mobile App Project SW개발자대회 Yolov5 Computer_Vision CSE 2023 수고했다
---

## Solved Earth

고등학교 친구들 넷이서 프로젝트를 진행했습니다. 'SW공개 개발자 대회'라는 대회에 출전하기로 했습니다.

최종 프로젝트의 이름은 **Solved Earth** 입니다. 이 주제를 선택하기까지 정말 많은 이슈가 있었지만, 이건 다른 글에서 다루겠습니다....(분량이 많은 지라..)

**Solved.Earth_FastAPI (Support Mobile App to provide strong motivation for environmental protection)**
[(https://github.com/solved-earth/solved_earth_fastapi#solvedearth_fastapi-support-mobile-app-to-provide-strong-motivation-for-environmental-protection)](https://github.com/solved-earth/solved_earth_fastapi#solvedearth_fastapi-support-mobile-app-to-provide-strong-motivation-for-environmental-protection)

**Solved.Earth**는 사용자의 환경 보호 행동을 유도하는 앱입니다. Solved.ac에서 영감을 받은 프로젝트인데요. 

Solved.ac는 코딩 대회에 참가하거나 BOJ에서 문제를 풀고 특정 도전 과제를 완료하면 뱃지나 자신의 프로필을 꾸밀 수 있는 치장품을 줍니다. Solved.ac는 수집욕을 불러일으키는 아이템을 통해 많은 사람들이 코딩 문제를 풀도록 긍정적 유인을 제공했고, 개발자들의 큰 호응을 얻었습니다. 저희는 이 '퀘스트-보상' 방식에서 아이디어를 얻었습니다. 

Solved.Earth의 핵심 메커니즘은 아래와 같습니다.
1. 일회용 컵 대신 머그컵을 사용하거나, 분리수거를 하는 등 환경보호를 위한 challenge를 사용자가 수행하고 사진을 찍습니다.
2. AI 이미지 인식 기술을 이용해 challenge 성공 여부를 판단합니다.
3. 성공했다면, 앱 메인 화면의 나무를 성장시키거나, 나무 치장품을 얻을 수 있습니다. 

자세한 내용은 위에 github 링크의 Readme.md에 다 나와 있으니 생략하겠습니다! 이 글에는 제 느낀점과 소감을 위주로 기록하려고 합니다.

## 1차 통과

프로젝트 기획안이 통과되었습니다. 이때부터 본격적을 프로젝트를 시작했습니다.

### 역할 분담
- 2명: Flutter와 Firebase를 이용한 앱 개발
- 1명: OpenCV(Yolov5)를 이용해 challenge 인식 AI 학습
- 1명(나): FastAPI, Linux ubuntu를 이용해 challenge 검증 API 서버 구축

Backend에 관심이 있고 fastAPI나 Linux를 공부해본 적이 있어서 API 구축 역할을 맡았습니다. Flutter는 이미 대회 전부터 넷 다같이 강의 듣고 공부하고 있기는 했었는데, 저는 흥미가 안 생기더라고요...... 

## Solved.Earth 전체 구조

구체적인 정보와 시연 영상은 해당 Github의 ReadMe에 있습니다. 

<img width="881" alt="image" src="https://cdn.jsdelivr.net/gh/splanky0314/CDN/Projects/2023-09-19-Solved_Earth/mov.jpg">

### 1. Solved.Earth System Structure (Solved.Earth 시스템 구조)

<img width="881" alt="image" src="https://cdn.jsdelivr.net/gh/splanky0314/CDN/Projects/2023-09-19-Solved_Earth/1.jpg">

### 2. Solved.Earth App Client Application Structure (Solved.Earth 앱 클라이언트 어플리케이션 구조)

<img width="881" alt="image" src="https://cdn.jsdelivr.net/gh/splanky0314/CDN/Projects/2023-09-19-Solved_Earth/2.jpg">

### 3. Data Refining & Model Training Detail View (데이터 전처리 & 모델 트레이닝 상세 구조)
<img width="881" alt="image" src="https://cdn.jsdelivr.net/gh/splanky0314/CDN/Projects/2023-09-19-Solved_Earth/4.jpg">

<img width="881" alt="image" src="https://cdn.jsdelivr.net/gh/splanky0314/CDN/Projects/2023-09-19-Solved_Earth/opencv.jpg">

### 4. API Detail View (API 상세 구조)
<img width="881" alt="image" src="https://cdn.jsdelivr.net/gh/splanky0314/CDN/Projects/2023-09-19-Solved_Earth/3.jpg">

## Solved.Earth API 서버 구축

### Flutter 앱에서 이미지 파일을 받아오기

### OpenCV로 이미지 분석하기

### 성공여부 Flutter 앱에 반환


## 2차 탈락

재작년에 CPS(한민고 컴퓨터 동아리)에서 한 팀이 이 대회를 나가서 수상한 경험이 있어서, 이번에도 가능성이 좀 있지 않을까 했지만... 역시 학생 버프 떨어지니까 힘드네요.

아무래도 아이디어 자체가 획기적이지 못했고, 아직은 코드 짜는 것도 서툴렀기 때문에 어쩔 수 없는 결과였습니다.

하지만. 이번 대회 진행하면서 진짜 많이 배웠습니다. 

API 서버 구축에 좀 더 욕심을 내서 **Docker와 Github Actions**를 사용했는데, 아직 배울 점이 많다는 것을 느꼈습니다. 학기 초에 CNU(서강대 웹개발 학회)에서 한번 배포에 사용했어서 `에이 할 수 있겠지~`하고 시작했는데...  배울게 생각보다 많았습니다. 당장 급하니까 찍먹 수준으로 필요한 부분만 구글링하면서 공부했습니다. 부분부분만 공부하다 보니까 에러가 나도 원인을 찾기가 힘들고, 작동이 잘 되더라도 의문을 갖게 되는 정말 난감한 상황이 많이 나왔습니다. 벡엔드를 제대로 하려면 Docker를 제대로 알아야 될 것 같아서 중고 책을 시켜놨습니다. 중간고사 끝나고 열심히 읽어볼 생각입니다.

Linux는 확실히 한번 Linux 서버 해킹당하고 열심히 삽질을 다양하게 많이 했더니 지식이 좀 쌓인 것 같습니다. 뜨는 에러가 다 전에 봤던 애들이라 ㅋㅋㅋㅋ.... 역시 삽질하면서 쌓이는 지식이 오래가고, 나중에 도움도 많이 되는 것 같습니다.

## 얘들아 수고했다!

특히 각자 사는 곳이 멀어서 비대면 100%로 진행을 해야 해서 처음엔 걱정이 많았습니다. 하지만 괜한 걱정이었습니다. 얘네들(고등학교 친구들)이 아무래도 3년 동안 기숙사에서 맨날 보면서 지냈기 때문에, 각자 성향이나 관심 분야, 실력을 잘 알아서 프로젝트 진행이 원활하지 않았나 생각됩니다.  빨리 대학교에서도 이런 친구들을 찾고 싶은데... 쉽지 않네요......

이렇게 2023.01.15부터 2023.09.19까지의 대장정이 마무리되었습니다. 

지금은 할 것도 없고 같이 디스코드에 옹기종기 모여서 백준 풀고 있는데 ㅋㅋㅋㅋㅋㅋ 

나중에 실력 좀 더 키워서 프로젝트 한번 더 같이하자!! 다들 진짜 수고했어~