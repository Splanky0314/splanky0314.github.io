---
layout: post
title: '[Github-Actions] ssh를 이용해 Linux 서버에 deloy하기'
subheading: 
author: Daeun
categories: Git
banner:
tags: Git git github actions linux ubuntu deloy ssh ssh-keygen rsa id_rsa id_rsa.pub public key secrets pub
---

## Linux 서버에서

### 1. 인증 키 생성

```
ssh-keygen 
```

위 명령어 입력 후 나타나는 모든 질문에는 Enter를 눌러줍니다. (그러면 자동으로 기본 값으로 세팅됩니다.)

### 2. 인증 키 등록

```
cd ~/.ssh
cat id_rsa
# 이후 나오는 키를 모두 복사

# 복사한 키를 따옴표로 둘러싸고 아래와 같이 입력
echo “복사한 키” >> ~/.ssh/authorized_keys
```

### 3. github-secrets에 pub 키 등록

```
cd ~/.ssh
cat id_rsa.pub
# 이후 나오는 키를 모두 복사
```

## Github에서

1. github repository에서 `settings-Secrets and Gvariables-Actions`로 이동합니다.

2. `New repository secret`을 클릭합니다.

3. 원하는 변수명(필자의 경우 KEY)을 작성하고 Secret란에 복사한 키를 모두 붙여넣습니다.

4. release.yml을 수정해 줍시다.