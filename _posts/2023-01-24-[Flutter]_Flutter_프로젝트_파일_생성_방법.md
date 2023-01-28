---
layout: post
title: '[Flutter] Flutter 프로젝트 파일 생성 방법'
subheading: Flutter 프로젝트 파일 생성 방법을 알아보자
author: Daeun
categories: Flutter
banner:
tags: flutter 프로젝트파일 
sidebar: []
---

1. 프로젝트 폴더를 생성하고 싶은 위치에 진입하여 cmd를 열어줍니다.
2. `flutter create [만들고 싶은 프로젝트 폴더 이름]`을 입력합니다.
3. 아래와 같은 메세지가 나타나며 완료!
```
Creating project [프로젝트 폴더 이름]...
Running "flutter pub get" in [프로젝트 폴더 이름]...                          2,078ms
Wrote 127 files.

All done!
In order to run your application, type:

  $ cd clicker
  $ flutter run

Your application code is in [프로젝트 폴더 이름]\lib\main.dart.
```

## 참고) main.dart 기본 서식
저의 경우 아래의 코드를 기본으로 두고 코딩을 시작합니다.
```dart
import  'package:flutter/material.dart';

void  main() {
	runApp(App());
}

class  App  extends  StatelessWidget {
	@override
	Widget  build(BuildContext context) {
		return  MaterialApp(
			home:  Scaffold(
				backgroundColor:  const  Color(0xFF181818),
				body:  Container(),
			),
		);
	}
}
```
