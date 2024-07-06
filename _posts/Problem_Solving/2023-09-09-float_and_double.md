---
layout: post
title: "[C/C++] [BOJ 26258] float의 불편한 진실(백준 1% 틀렸습니다)"
subheading: 
author: Daeun
categories: Problem_Solving
banner:
tags: C언어 C C++ C99 Baekjoon 알고리즘 binary search algorithm boj codeforce cpp left right mid l r float double 1% boj baekjoon 26258 silver
---

## 아니 씹

아니 ICPC 스터디 연습 문제를 푸는데 

![float는 뭐가 문제일까](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Problem_Solving/2023-09-09-float_and_double/0.png)

[백준 26258 다중 일차 함수](https://www.acmicpc.net/problem/26258)

아니 분명 맞는 코드인데 계속 틀리는 겁니다.............????!!

뭐가 틀렸나 해서 막 int도 long long으로 바꿔보고...

vector를 참조자로 함수에 넘기는 대신 전역변수로 선언해보고.......

로직도 조금조금 바꿔보고.........

2시간 동안 열심히 고쳤습니다. 고생의 흔적.

![float는 뭐가 문제일까](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Problem_Solving/2023-09-09-float_and_double/1.png)

## 장난하냐🤬

float를 double로 바꾸는 순간.

![float는 뭐가 문제일까](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Problem_Solving/2023-09-09-float_and_double/2.png)

바로 초록 딱지;;; 장난하니 나랑

분명 C++ 자료형 이미지에서 10^(-38)^부터 10^38^까지 float가 표현할 수 있다고 했는데🤬

2시간 동안 뻘짓을 열심히 했습니다.

## float 이거 안되겠네

float가 원래는 10^(-38)^부터 10^38^까지 담을 수 있다고 C++ 자료형을 보면 나와 있습니다. 하지만,,,,, float가 4byte 변수이기는 하지만 **소수**를 저장하는 친구이기 때문에 그 정도까지 제대로 담지 못하고 **오차**가 생기는 경우가 있다고 합니다......

(난 왜 이걸 몰랐지.....)

## 애초에 1%에서 틀림으로 뜬다는 것은

자료형이 맞지 않든, 입출력이 잘못되었든. 요런 기초적인 문제일 가능성이 큽니다....

근데 보통은 segment fault나 type error같이 에러가 뜨기 때문에 그 생각을 못해버린 ~~내 머리의 문제~~

## 즐거운 PS 되세요

괜히 허비한 2시간이 아깝지만..... 새롭고, 사소하지만 매우매우 중요한 사실을 오늘도 알아갑니다~ 미래의 내가 오늘을 감사히 여길 것이다................