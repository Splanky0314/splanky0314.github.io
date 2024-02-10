---
layout: post
title: '[React 스터디 Day1🙃] JavaScript 기초 & React의 장단점 & JSX이란?'
subheading: 
author: Daeun
categories: JavaScript
banner:
tags: JavaScript JS React React.js JSX jsx 장단점 JS기초 문법

---

\* 이 글은 소플님의 `처음 만난 리엑트(React) 강의 내용을 정리한 게시물입니다.

[처음 만난 리엑트(React) - 소플](https://www.inflearn.com/course/%EC%B2%98%EC%9D%8C-%EB%A7%8C%EB%82%9C-%EB%A6%AC%EC%95%A1%ED%8A%B8/dashboard)

## 리엑트 찍먹

방학 동안 PS를 열심히 배워볼 생각이었으나,,, PS가 하기 싫어졌다...

예전에 Django 배울 때, React 하시는 분이랑 협업해서 프로젝트를 해본 적이 있었습니다.

사실 제가 제대로 배우고 싶은 부분은 프론트엔드는 절대 아닙니다.

다만 심심하기도 하고, 뭔가 재미있어 보여서 그냥 찍먹해 보도록 하겠습니다~


## Ch 00. JavaScript

스크립트 언어 - 런타임에 코드가 해석되고 실행된다.

### 자료형(Data Type)

**Dynamic Typing(동적 타이핑)**
변수를 선언할 때가 아니라 변수의 데이터가 대입되는 시점에 자료형이 결정된다.

**자료형 종류**
```js
var name1; 
let name2;

// number 타입
let n = 1234;

//string 타입
let s = "Hello!";

// NULL 타입
let a = null;

// 아직 지정되지 않음
let u1 = undefined;

// 배열 타입
// 배열에 다양한 자료형 포함 가능, 인덱스 가짐
let arr = [1,2,3,4, "hi"];

// object 타입
// key값은 무조건 문자열, 나머지는 상관 없음.
let obj = { a: "apple", b:"banana"};

// 등등의 자료형 존재
```

### JavaScript Operator(연산자)

Assignment Operator(대입 연산자): = 
Arithmetic Operators(사칙 연산): + - * / % **
Equal Operators: == !=

**Strict equality operators**: === !==

처음 보는 연산자입니다. Strict equality operator는 `a===b`일 때, a와 b의 값과 자료형이 모두 같아야 참이 됩니다.

## Ch 01, 02. React

### 장점

- 빠른 렌더링 속도(Vertual DOM)
**Component-Based**
:레고 블록 조합하듯 조립하며 개발

- Reusability(재사용성) - 호환성 문제를 낮추고 여러 곳에서 컴포넌트 사용, 모듈 간 의존도가 낮음
--> 유지 보수 용이, 개발 속도 빠름

### 단점

- 방대한 학습량. 기존 방식과 다른 UI 방식
- 높은 상태관리 복잡도(state 관리)

## Ch03. JSX(A syntax extension to JavaScript)

### JSX란?

JS의 확장판. `JS + XML/HTML`

```jsx
const element = <h1>Hello World!</h1>;
```

-> js코드와 html 코드가 복합적으로 사용된 모습을 가지고 있습니다.

### JSX의 역할

JSX은 내부적으로 `HTML/XML`을 JS 코드로 변환하는 과정을 거치게 됩니다. 

이 변환을 시켜주는 것이 React의 createElement 함수입니다. 

JSX를 사용하지 않고 JS 만으로도 동일한 내용을 코딩할 수 있지만 `HTML/XML` 문법을 사용함으로서 **가독성과 개발 속도를 향상**시킬 수 있습니다.

기타 장점으로는

- Injection Attacks 방어

```jsx
function formatName(user) {
	return user.firstName + ' ' + user.lastName;
}

~

const element = (
	// XML/HTML 코드 사이에 중괄호를 사용하여 JS 변수나 함수를 사용한다.
	<h1>Hello, {formatUser(user)}</h1>
)

~
```

** 중괄호를 사용하면 무조건 JS 코드로 들어간다. **