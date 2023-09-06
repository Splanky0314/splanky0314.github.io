---
layout: post
title: '[당신을 위한 DB] DBMS와 database system'
subheading: 
author: Daeun
categories: MySQL
banner:
tags: DaeunWorld Mysql database oracle easy code metadatadata models daya system DBMS DB conceptual physical
---


## 출처

쉬운코드 님의 DB 강의를 요약해 놓은 게시물입니다.

[https://www.youtube.com/watch?v=aL0XXc1yGPs](https://www.youtube.com/watch?v=aL0XXc1yGPs)

## DBMS (DataBase Management System)

ex) Mysql

### metadata

db를 정의하거나 기술하는 data

어떤 데이터를 부가 설명하는 data

### database system

= database + DBMS + 연관된 applications

### data models

DB의 구조를 기술하는데 사용될 수 있는 개념들의 집합

- conceptual data models
	: 일반 사용자들이 쉽게 이해할 수 있도록 만들어진 모델(높은 수준의 추상화)
	
- logical data models
	: 이해하기 어렵지 않으면서도 디테일하게 DB를 구조화할 수 있는 개념 제공
	data가 컴퓨터에 저장될 때의 구조와 크게 다르지 않게 DB 구조화를 가능하게 함 
	- relational data model(가장 많이 사용) (Mysql, oracle)
	- object data model
	- object-relational data model(postgresql)

- physical data models
	: 컴퓨터에 데이터가 어떻게 파일형태로 저장되는지 기술할 수 있음
