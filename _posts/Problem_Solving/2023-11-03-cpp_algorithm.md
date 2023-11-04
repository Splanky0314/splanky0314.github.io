---
layout: post
title: "[C/C++] C++ <algorithm> 유용한 함수 정리"
subheading: 
author: Daeun
categories: Problem_Solving
banner:
tags: C언어 C C++ C99 Baekjoon 알고리즘 binary search algorithm boj codeforce cpp left right mid l r float double 1% boj baekjoon 26258 silver
---

(계속 업데이트 할 예정)

## next_permutation: 순열을 구하는 함수

- 오름차순으로 정렬된 배열에서만 사용 가능
- next_permutation은 오름차순으로 순열을 생성
- 배열에 중복이 존재할 경우, 중복을 제외하고 순열 생성

```cpp
vector<int> v{1,2,3};

do {
    for(int i=v.begin(), i<= v.end(); i++) {
        cout << *i << ' ';
    }
    cout << endl;
} while(next_permutation(v.begin(), v.end()));
```