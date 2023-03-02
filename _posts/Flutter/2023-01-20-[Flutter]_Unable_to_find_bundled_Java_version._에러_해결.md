---
layout: post
title: '[Flutter] Unable to find bundled Java version. 에러 해결 방법'
subheading: 플러터 Unable to find bundled Java version. 에러 해결 방법
author: Daeun
categories: Flutter
banner:
tags: flutter JAVA에러 에러해결방법 

---

## 에러메세지
윈도우 환경에서 `flutter doctor` 실행 시
```✗ Unable to find bundled Java version.```
이라고 에러가 났다.

## 해결방법
1. 파일 탐색기로 `C:\Program Files\Android\Android Studio`로 이동한다.
2. jre폴더 안의 파일을 모두 삭제한다.
3. jbr폴더 안의 모든 내용물을 복사한 후 jre폴더에 붙여 넣는다.
4. 터미널을 재시작한 뒤 `flutter doctor`을 실행해보자.

출처: [https://github.com/flutter/flutter/issues/118502](https://github.com/flutter/flutter/issues/118502)
