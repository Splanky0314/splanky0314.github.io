---
layout: post
title: '[React 스터디 Day2🙃] React Element에 대해 알아보자(리엑트 엘리먼트)'
subheading: 
author: Daeun
categories: JavaScript
banner:
tags: JavaScript JS React React.js JSX jsx element component immutable attribute children root 

---

\* 이 글은 소플님의 `처음 만난 리엑트(React) 강의 내용을 정리한 게시물입니다.

[처음 만난 리엑트(React) - 소플](https://www.inflearn.com/course/%EC%B2%98%EC%9D%8C-%EB%A7%8C%EB%82%9C-%EB%A6%AC%EC%95%A1%ED%8A%B8/dashboard)


## Ch04. React Element

the smallest building blocks, 우리 눈에 보이는 것들을 나타낸다.

JS 객체 형태로 존재합니다. 한번 생성되면 바꿀 수 없는 객체입니다. 

**immutable(불변의)**

element 생성 후에는 element의 attribute나 children을 변경할 수 없습니다. 

비유를 사용해보자면, 

- Component(붕어빵 틀)

- Element(붕어빵)

로 나타낼 수 있습니다.

React는 렌더링 속도가 빠릅니다. 화면에 새로운 내용을 보여주기 위해서는 새로운 element를 만들어 기존 element와 교체해 주어야 합니다.

### Element 렌더링하기

```jsx
<div id="root"></div>
```

(여기서부터는 존칭 생략하겠습니다... 타자 속도가 강의를 못따라가네요..)

이 div 태그 안에 리엑트 element들이 렌더링 된다.

### 렌더링 된 Element를 업데이트하기

다시 생성해야 한다!

