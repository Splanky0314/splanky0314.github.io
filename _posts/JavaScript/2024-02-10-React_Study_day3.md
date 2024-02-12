---
layout: post
title: '[React 스터디 Day3🙃] React Component와 Props & state와 lifecycle에 대해 알아보자!(리엑트 컴포넌트)'
subheading: 
author: Daeun
categories: JavaScript
banner:
tags: JavaScript JS React React.js JSX jsx element component immutable attribute children root read-only

---

\* 이 글은 소플님의 `처음 만난 리엑트(React) 강의 내용을    정리한 게시물입니다.

[처음 만난 리엑트(React) - 소플](https://www.inflearn.com/course/%EC%B2%98%EC%9D%8C-%EB%A7%8C%EB%82%9C-%EB%A6%AC%EC%95%A1%ED%8A%B8/dashboard)

## Ch05. Components

리엑트는 컴포넌트 기반의 구조이다! 컴포넌트들을 레고 블럭을 끼워 넣듯이 구성한다.

### React Component는 무슨 일을 할까?

속성(props)을 받아서 그에 맞는 react element를 반환하는 역할을 한다. (일종의 함수라고 이해하면 편하다.)

'Component(붕어빵 틀) - Elemenet(붕어빵)' 이라고 비유할 수 있다. 객체지향에서 나오는 class와 인스턴스 개념과 비슷하다.

### Props(Properties 속성들)

Component에 전달할 다양한 정보를 담고 있는 자바스크립트 객체이다.

Component를 붕어빵 틀이라고 한다면, props는 붕어빵의 속 재료(슈크림, 팥 등)라고 비유할 수 있다.

### Props의 특징 - Read-Only!

값은 변경할 수 없고 읽을 수만 있다. 값을 변경하고 싶은 경우 새로 만들면 된다.

**모든 react component는 props를 직접 바꿀 수 없고, 같은 Props에 대해서는 항상 같은 결과를 보여주어야 한다!**

### Props 사용법 - component에 props 전달하기

예시)
```jsx
function App(props) {
	return (
		<Profile name="Daeun" introduction="Hello, my name is Daeun" viewCount={1500}/>
	)
}
```

props는 아래와 같은 형태의 JS 객체가 된다.

```json
{
	name: "Daeun",
	introduction: "Hello, my name is Daeun",
	viewCount: 1500
}
```

예시) props의 값으로 컴포넌트를 넣는 것도 가능하다.

```jsx
function App(props) {
	return (
		<Layout width={2560} height={1440} 
			header={<Header title="Daeun's Blog"/>}
			footer={<Footer/>}
		/>
	)
}
```

### React.createElement()

```jsx
React.createElement(type, [props], [...children])
```

사용 예시)

```jsx
React.createElement(
	Profile, // Component 이름
	{ // props
		name: "Daeun",
		introduction: "Hello, my name is Daeun",
		viewCount: 1500
	},
	null // 하위 Component가 없으므로
);
```

## Component

리엑트에서 Component는 크게 `Function Component`와 `Class Component`로 나뉜다.

- **function component:** 코드가 간단한 것이 장점
	```jsx
	function Welcome(props) {
		return <h1>Hello, {props.name}</h1>;
	}
	```
- **class component:** function 컴포넌트에 비해 추가적인 기능을 가진다.
	```jsx
		class Welcome extends React.Component {
			render() {
				return <h1>Hello, {this.props.name}</h1>;
			}
		}
	```
	
	React.Component를 상속해서 구성된다. 

**중요!! - Component 이름은 항상 대문자로 시작해야 한다.** 

소문자로 시작하는 컴포넌트는 DOM 태그로 인식한다고 한다.

예시)

```jsx
// HTML div 태그로 인식
const element = <div />;

// Welcome이라는 React Component로 인식
const element = <Welcome name="Daeun" />;
```

### Component의 렌더링

```jsx
function Welcome(props) {
	return <h1>Hello, {props.name}</h1>;
}

// React Component로 element를 만든 모습
const element = <Welcome name="Daeun" />; // name: "Daeun"이라는 props를 넣어 element 생성

// element를 렌더링(DOM에 업데이트)
ReactDOM.render(
	element,
	document.getElementById('root')
);
```

## Ch06. State and Lifecycle

Class Component와 관련된 내용을 다룬 챕터이다.

## State

state란 리엑트 component의 변경 가능한 데이터를 말한다. state는 개발자가 정의해 사용한다. 

state는 컴포넌트의 렌더링과 관련되어 있다!!

렌더링이나 데이터 흐름에 사용되는 값만 state에 포함시켜야 한다. (state가 변경될 경우 component가 다시 렌더링되기 때문이다. 렌더링이나 데이터 흐름에 관련 없는 것을 state에 포함한 경우 불필요한 경우에 재렌더링이 일어나게 되므로 비효율적이다.)

state는 JS 객체이다!

```jsx
class LikeButton extends React.Component {
	constructor(props) { // 생성자
		super(props),

		this.state = {	// class component의 경우 state를 생성자(constructor)에서 정의한다.
			liked: false
		};
	}
}
```

state는 일반 변수를 다루듯이 직접 수정하면 안된다! (setState라는 함수를 사용!)

## React Component의 Lifecycle(생명 주기)

component의 생성 시점과 사라지는 시점이 정해져 있다.

1. Mounting(출생) - constructor
2. Updating(인생)
3. Unmounting(사망) - 상위 컴포넌트에서 해당 컴포넌트를 더이상 표시하지 않을 때

**Component가 계속 존재하는 것이 아니라, 시간의 흐름에 따라 생성되고 업데이트 되다가 사라진다!**