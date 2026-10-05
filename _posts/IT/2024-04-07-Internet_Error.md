---
layout: post
description: "Windows 11에서 특정 와이파이만 인터넷 연결 안 됨으로 표시되던 개인 사례와 관리자 터미널의 시스템 파일 검사로 해결한 과정을 기록했습니다."
title: "[Windows11] 특정 와이파이 '인터넷 연결 안됨' 문제 해결 방법"
subheading: 
author: Daeun
categories: IT
banner:
tags: 

---

## 문제 상황

다른 와이파이는 인터넷이 정상적으로 연결되지만, 학교 열람실 와이파이만 '인터넷 연결 안됨'이라고 뜬다.

## 해결 방법

1. cmd나 powershell을 관리자 권한으로 연다.
2. `sfc /scannow`를 입력한다.
3. 와이파이 껐다가 켜기

![Windows 시스템 파일 검사 명령 실행 화면](https://cdn.jsdelivr.net/gh/splanky0314/CDN/IT/2024-04-07-Internet_Error/1.png)

## 여담

작년 2학기 즈음부터 갑자기 열람실 와이파이가 '인터넷 연결 안됨' 오류가 났다. 장치관리자랑 powershell로 여러 방법을 시도 했는데도 해결이 안되다가 이 방법으로 드디어 해결했다...!