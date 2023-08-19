---
layout: post
title: '[누구도 알려주지 않은 VScode 꿀팁] 바탕화면에 특정 레포로 바로가기 만들기'
author: Daeun
categories: VScode
banner:
tags: VScode 비주얼스튜디오 비주얼스튜디오코드 settings windows
---

여러가지 프로젝트를 하게 된다면 VScode를 실행하고 일일이 작업할 폴더로 진입하는 과정이 귀찮아지기 시작합니다.

이때 바탕화면의 바로가기 클릭 한번만으로 내가 원하는 레포의 VScode를 열 수 있습니다.

## 바탕화면에 특정 레포로 바로가기 만들기

1. VScode 바로가기 생성하기
   
    <img width="56" alt="image" src="https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/dabb9285-a953-46fd-91ff-1193f4c16f7c">

2. 해당 바로가기의 속성 창 열기
   
    <img width="301" alt="image" src="https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/e91157ea-4102-40f6-9f82-bda43609cfb3">

3. `대상(T)`를 아래와 같이 수정
   
   원래 있던 값을 그대로 두고 뒤에 `-g (프로젝트 폴더 주소)`를 추가합니다. -g 양옆으로 스페이스가 존재하고 폴더 주소는 ""로 감싸지 않는 것에 주의하세요.

    <img width="297" alt="image" src="https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/fd0634a2-2635-42c4-9f96-d4b3597f5f4b">

4. 바로가기 이름 바꾸기

    해당 프로젝트임을 알 수 있도록 바로가기의 이름을 바꿔줍시다.