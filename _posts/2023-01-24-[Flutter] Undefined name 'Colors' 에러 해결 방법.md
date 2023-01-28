---
layout: post
title: [Flutter] Undefined name 'Colors' 에러 해결 방법
subheading: Flutter에서 Undefined name 'Colors' 에러 해결하기
author: Daeun
categories: Flutter
banner:
tags: flutter colors에러 에러해결방법 
sidebar: []
---

# [Flutter] Undefined name 'Colors' 에러 해결 방법

## 에러 현상 & 에러 메세지
flutter로 main.dart파일이 아니라 새로운 위젯을 다른 dart 파일로 저장하려 했더니 발생했다.

``` 
Undefined name 'Colors'.
Try correcting the name to one that is defined, or defining the name.
```

## 해결방법

새로운 파일 상단에 아래 코드를 추가한다.
```dart
import 'package:flutter/material.dart';
```

