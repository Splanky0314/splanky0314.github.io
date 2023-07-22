---
layout: post
title: 셸 스크립트란? (.sh, Shell Script)
subheading: 
author: Daeun
categories: Linux
banner:
tags: 리눅스 Linux Shell Script sh .sh 셸 스크립트 VScode 주석 입출력 실행방법 

---

## Shell Script

.sh로 끝나는 파일을 의미합니다.

Unix 명령어를 미리 적어 놓고 실행하는 것입니다. 

## .sh 작성하기

Shell Script는 맨 처음의 행에 다음 한 줄을 작성합니다.

```
#!/bin/sh
```

지금부터 셸 스크립트를 작성한다고 알리는 의미라고 하네요.

### 주석

`#` 입니다. 파이썬과 동일하죠?

### 입출력

`echo`: 출력

`read`: 입력

예시)
```shell
# !/bin/sh

read DATE
echo "HELLO WORLD! | $DATE"
```

## .sh 실행하기

```
# 권한 부여
chmod 755 run.sh

# .sh 실행
./run.sh
```

권한 부여는 처음에 한번만 해주시면 됩니다. powershell에서는 위 명령어가 안 먹을 텐데, git bash를 이용하면 되겠습니다.

## 더 많은 정보는

다른 블로거 님에게 토스 ㅎㅎ

[shell script 정리](https://engineer-mole.tistory.com/200)