---
layout: post
title: "[Flutter] Error: Unable to find git in your PATH. 에러 해결 방법"
subheading: 
author: Daeun
categories: Flutter
banner:
tags: flutter ERROR unable PATH git 에러해결방법 

---

## 문제 상황
chocolity로 flutter를 다운받고 관리자 권한이 할당되지 않은 powershell에서 아래와 같은 오류가 발생했다.
```
PS C:\Users\splan> flutter
Error: Unable to find git in your PATH.
```

## 해결 방법
1. git 설치

2. 그러나 git이 설치되어 있더라도 오류가 발생할 수 있다. 이 경우 환경변수 PATH에 `c:\Program files\git\cmd`를 추가해 주면 된다.

## flutter 정상 작동 확인하기
```
flutter --version
```
위 명령어를 실행했을 때 오류가 일어나지 않고 잘 작동하는지 확인한다.

## 추가
그런데 굳이 안해도 되는듯
그래서 자료만 찾아보고 사실 안함....ㅎ