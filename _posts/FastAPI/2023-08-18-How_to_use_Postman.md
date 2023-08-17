---
layout: post
title: 'Thunder Client 오류 발생, 대신 Postman으로 form-data POST 요청하기'
subheading: 
author: Daeun
categories: FastAPI
banner:
tags: FastAPi python django sqlmodel engine API backend web http

---

## Thunder Client 오류

Thunder Client는 VScode의 Extension으로 http request를 쉽게 보내도록 도와주는 도구입니다. 

그런데 정확한 이유는 모르겠지만 이미지나 텍스트 파일을 POST 요청으로 보내면 오류가 납니다....(제가 문제일 수도)

## PostMan 사용하기

PostMan에서 `multipart/form-data`를 보내 봅시다.

1. 설치 후, 로그인 또는 회원가입
    
    구글계정으로 간단하게 회원가입이 가능합니다.

2. Collection 생성하기

    <img width="881" alt="image" src="https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/f3f78cc4-5762-44ca-b954-1b35aa66025e">

3. Request 생성하기
   
    <img width="877" alt="image" src="https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/145e9e55-2a2e-44a9-8926-c1eb3e144101">

4. POST로 설정해주기

    <img width="923" alt="image" src="https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/b545cb2b-a54d-4aee-bedc-4f1e8c425ab5">

5. KEY값 옆에 보면 `TEXT` 또는 `FILE`로 선택할 수 있게 되어 있습니다. 이것을 FILE로 변경합니다. 그리고 Content Type를 명시해 줍니다.
    <img width="929" alt="image" src="https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/b72b5f95-6c52-4790-b382-f4ec37c6acc3">

6. 성공!
   ![image](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/7b7138c6-6974-4127-b1ac-ce8159995fbf)
