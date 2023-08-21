---
layout: post
title: '[Python] FileNotFoundError 원인과 해결 방법'
subheading: 
author: Daeun
categories: FastAPI
banner:
tags: FastAPi python django sqlmodel engine API backend web http pathlib path

---

## FileNotFoundError 발생

분명히 존재하는 파일 경로인데, 경로를 찾을 수 없다며 FileNotFoundError가 발생했다.

## 원인

file path를 전달할 때 파일의 주소를 str로 전달한 경우 주로 발생하는 에러이다.

## 해결방법

```python
from pathlib import Path

전달하려는_파일_주소 = "C:\hello\hi"
path = Path(전달하려는_파일_주소)
```

Path 객체로 바꾸어 준다면 오류를 해결할 수 있다.