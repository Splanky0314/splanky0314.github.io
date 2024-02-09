---
layout: post
title: '[JavaScript] 자바스크립트 기초😊(자료형, 함수, 객체)'
subheading: 
author: Daeun
categories: JavaScript
banner:
tags: JavaScript JS React 자료형 함수 선언식 표현식 화살표 Arrow_Function Method Object Hoisting this Lexical_Environment Node.js js javascript

---


## React.js 찍먹 하다가...

React 실습 하는 중에 arrow function이 설명 없이 막 나오는데, 음 이게 뭐지......?

js 문법을 잘 모르고 따라만 쓰는 것은 의미가 없다고 생각해서 JavaScript 1시간 30짜리 강의를 보고 왔습니다.

유튜브에서 코딩악마님의 강의입니다.

[자바스크립트 기초 강좌: 100분 완성](https://www.youtube.com/watch?v=KF6t61yuPCY)

이미 아는 부분은 빠르게 스킵하면서 봤습니다.

## 자료형(Data Type)

신기했던 점은 C처럼 숫자가 int, long, float, double 처럼 세부적으로 나뉘지 않는다는 점입니다.

JavaScript에서는 Number 자료형으로 모든 숫자를 표현합니다.

### 자료형 종류

1. Number
2. String
3. Boolean
4. Undefined
5. NULL
6. Object

## 함수(Function)

함수를 정의하는 방법에는 

1. 함수 선언식
2. 함수 표현식

이 있습니다. 

### 함수 선언식- 어디서든 호출 가능

JS의 경우 파일이 실행되면 파일 전체에서 `function ~` 꼴로 선언된 함수들을 JS 데이터 구조 내의 메모리에 저장해 놓습니다.

그 뒤에 맨 윗 줄부터 순차적으로 코드를 실행시키기 때문에 함수 선언문보다 호출문이 위에 있어도 오류 없이 호출이 가능합니다.


```js
// 함수 선언문 - 어디서든 호출 가능
sayHello1() // 에러가 발생하지 않는다!!

function  sayHello1() {
	console.log('HELLO');
}

sayHello1()
```

### 함수 표현식 - 생성 이후에만 호출 가능

반대로 아래 꼴로 function을 선언한 경우 위에서 선언한 경우와 함수의 작동 방식은 동일합니다.

**다만 함수 선언 전에 함수를 호출하는 경우 에러가 발생합니다.**

```js
// 함수 표현식 - 생성 이후에만 호출 가능
sayHello2(); // 에러 발생!!

let  sayHello2  =  function() {
	console.log("HELLO");
}

sayHello2();
```

### 화살표 함수(Arrow Function)

처음 보는 형태의 함수였습니다.

```js
let  add  =  function(num1, num2) {
	return num1+num2;
}

// 화살표 함수

let  arrowAdd  = (num1, num2) => {
	return num1+num2;
}
```

### 심화 -  호이스팅(Hoisting)이란..?

Hoisting은 인터프리터가 코드를 실행하기 전에 함수, 변수,   클래스 또는 import의 선언문을 **해당 범위의 맨 위로 끌어올리는 것처럼 보이는 현상을 말합니다.** 실제로 코드가 끌어 올려지는 것은 아니라는 것에 유의하세요!

JavaScript 엔진은 코드를 실행하기 전에 실행 가능한 코드를 형상화하고 구분하는 과정을 거칩니다. 이 과정에서 모든 선언 문(var, let, const, function, class)을 렉시컬 환경이라 불리는 JS 데이터 구조 내의 메모리에 등록합니다.

\* **렉시컬 환경(Lexical Environment)**: 렉시컬 환경은 block, function, script를 실행하기에 앞서 생성되는 특별한 객체로, 실행할 스코프 범위 안에 있는 변수와 함수를 property로 저장하는 객체입니다. 

**<< JavaScript의 변수 생성 단계 >>**

1. 선언(Declaration): 스코프와 변수 객체가 생성되고, 스코프가 변수 객체를 참조한다. 초기화 전까지는 **일시적 사각지대( Temporal Dead Zone; TDZ)** 상태이다.

2. 초기화(Initialization): 변수 객체 값을 위한 공간을 메모리에 할당한다. 이 때 할당되는 값은 undefined이다.

3. 할당(Assignment): 변수 객체에 값을 할당한다.

var: 선언과 동시에 초기화가 이루어진다.

let, const는 선언만 될 뿐, 초기화가 진행되지 않은 TDZ 상태가 됩니다. 따라서 선언문 이후에 변수나 함수가 호출되었을 때만 정상적으로 실행됩니다.

let으로 선언된 변수를 선언문 이전에 참조하면 Reference Error가 발생하게 됩니다. 

<참고자료>
- [렉시컬 환경](https://developer-alle.tistory.com/407)
- [변수와 함수 호이스팅(Hoisting)에 대해 알아보자](https://velog.io/@1nthek/JavaScript-%EB%B3%80%EC%88%98%EC%99%80-%ED%95%A8%EC%88%98-%ED%98%B8%EC%9D%B4%EC%8A%A4%ED%8C%85Hoisting%EC%97%90-%EB%8C%80%ED%95%B4-%EC%95%8C%EC%95%84%EB%B3%B4%EC%9E%90)

## 객체(Object)

첫인상은 '오 json이랑 굉장히 비슷하게 생겼네?!!' 였습니다. (개인적으로 굉장히 이쁘게 생겼다고 생각합니다 ㅎㅎ)

```js
// Object - key: value
const  student  = {
	name:'Daeun',
	age:'21',
}


// 접근
student.name;
student['age'];
// 존재하지 않는 property에 접근하는 경우 undefined가 리턴된다.

// 추가
student.genter  =  'female';
student['birth'] =  '040314';

// 삭제
delete student.birth;  

// property 존재 여부 확인
'name'  in student // true
'stdid'  in student // false
```

### 예제 - 객체를 반환하는 함수

```js
function makeObj(name, age) {
	return {
		name: name,
		age, // key와 value명이 동일한 경우 이렇게 축약해서 쓸 수 있다.
	};
}

const Daeun = makeObj("Daeun", 21);
console.log(Daeun); // { name: 'Daeun', age: 21 }
```

### 예제 - property와 반복문

```js
const Daeun = {
	name:"Daeun";
	age:21;
};

for( i in Daeun ) {
	console.log(i);
	consolge.log(Daeun[i]);
}

// output
name
Daeun
age
21
```

## 객체 - method

method란 객체 property로 선언되어 있는 함수를 말합니다. 

아래 예시의 4번째 줄이 바로 method입니다.

### method의 선언 방법

```js
const Daeun = {
	name: "Daeun",
	age: 21,
	run: function() {
		console.log("달려갑니다!!")
	}
	walk() { // function 키워드 생략 가능
		console.log("걸어갑니다..")
	}
}
```

### Object와 Method

```js
const Daeun = {
	name: "Daeun",
	age: 21,
	sayHello() {
		// this를 이용해 object의 property에 접근
		console.log(`Hello, I'm ${this.name}!`); 
	}
}
```

this는 런타임에 결정됩니다.

**주의!!!!**

Arrow Function은 일반 함수와 달리 자신만의 this를 가지지 않습니다.

Arrow Function 내에서 this를 사용하면, 그 this는 외부에서 값을 가져오게 됩니다. 이 외부의 값은 전역 객체를 가리키게 되는데, 브라우저 환경에서 전역 객체는 `window`이고, Node.js 환경에서 전역 객체는 `global`입니다.

따라서 method를 선언할 때는 보통 화살표 함수를 사용하지 않습니다.

(JS에서 this는 굉장히 복잡한 친구라고 합니다...)

## 배열(Array) - 순서가 있는 리스트

```js
let arr = ['Daeun', 21, true];

arr.length() // 3

arr.push('Hello') // 맨 마지막에 원소 추가
arr.pop() // 맨 마지막 원소 삭제

arr.unshift("추가1", "추가2") // 맨 앞에 원소 추가
arr.shift() // 맨 앞 원소 삭제
```

### 예제 - 배열과 반복문

```js
// 방법 1
for(let index = 0; index<arr.length; index++) {
	~
}

// 방법 2
// of 대신 in이 있지만 of가 배열에서는 훨씬 효율적이다.
for(let elem of arr) {
	~
}
```