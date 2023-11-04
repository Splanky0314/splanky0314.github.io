---
layout: post
title: '[Git 백과사전] 셸 스크립트로 자동 깃헙 푸쉬, 커밋하기'
subheading: 
author: Daeun
categories: Git
banner:
tags: DaeunWorld shell script .sh push github commit add auto_commit audo_push
---


github page로 만든 블로그를 하다 보면, 글 업로드 할 때마다 3가지 명령어를 치게 됩니다.

```
git add .
git commit -m "커밋 이름"
git push
```

이 명령어를 매번 친다는 게 생각보다 쉽지 않다는 것을 아실 겁니다.

## Shell Script(셸 스크립트)로 커밋&푸쉬 자동화하기

### 셸 스크립트가 무엇인가?

이미 전 포스팅에서 설명했으니 링크를 달아 두겠습니다.

[셸 스크립트란? (.sh, Shell Script)](https://daeunworld.kr/linux/2023/07/22/Sheel_Script.html)

### github Token 발급

당연히 github repository에 푸쉬하기 위해서는 인증 절차가 필요합니다.

이 때 사용되는 것이 Personal access token입니다. 발급 방법을 아래 링크를 참고해 주세요. 별로 오래 안 걸립니다.

[github 토큰 발급 방법](https://velog.io/@nara7875/github-%ED%86%A0%ED%81%B0-%EB%B0%9C%EA%B8%89%ED%95%98%EA%B8%B0)

### 소스 코드

프로젝트 폴더 바로 아래에(.git 폴더와 같은 위치) `push.sh` 파일을 만들고 아래와 같이 입력합니다. 

**주의!!!!!**

**push.sh에는 깃헙 토큰 값이 들어 있습니다. 절대로 외부에 노출되어서는 안됩니다! 꼭 .gitignore에 포함시켜주세요! 꼭꼭꼭**

`push.sh`파일의 내용

```shell
#!/bin/bash

export LC_TIME=C
date=`date`
github_id="깃헙 아이디"
github_Token="깃헙 토큰 ex) ghp-~~~"
github_Address="푸쉬할 레포 경로 ex)github.com/Splanky0314/splanky0314.github.io.git"
logFile="./push.log"
SourceDir="./"

cd $SourceDir

echo "git add . ..." && echo "git add . ..." > $logFile 2>&1
echo "`git add .`" >> $logFile 2>&1
echo "" && echo "" >> $logFile 2>&1 && echo "==" >> $logFile 2>&1

echo "git status" && echo "git status" >> $logFile 2>&1
echo "`git status`" >> $logFile 2>&1
echo "" && echo "" >> $logFile 2>&1 && echo "==" >> $logFile 2>&1

echo "git commit -m $date commit" && echo "git commit -m $date commit" >> $logFile 2>&1
echo "`git commit -m "$date commit"`" >> $logFile 2>&1
echo "" && echo "" >> $logFile 2>&1 && echo "==" >> $logFile 2>&1

echo "git push!" && echo "git push!" >> $logFile 2>&1
git push https://$github_id:$github_Token@$github_Address >> $logFile 2>&1

sleep 2

result="`awk '/Everything up-to-date/' $logFile 2>&1`"
echo "$result"


if [ -z "$result" ];then
        echo "git push Success~!" && echo "git push Success~!" >> $logFile 2>&1
else
        echo "!! git push ERROR! please check $logFile !!" && echo "!! git push ERROR! please check $logFile !!" >> $logFile 2>&1
fi

echo "========push.log 파일 내용========"

cat push.log

exit 0
```

커밋 네임은 여러분 하고 싶은데로 변경하셔서 쓰면 됩니다. 저는 푸쉬하는 date가 표현되도록 만들었어요.

## `push.sh` 실행 결과

터미널에서 아래 명령어를 입력합니다. 윈도우의 경우 별도의 설정을 하지 않았다면 git bash로 터미널을 열고 입력해 주세요. (맥과 달리 윈도우는 리눅스 기반이 아니라서 따로 sh 명령어를 사용할 수 있도록 해 주어야 합니다. 하지만 git bash를 사용하면 그냥 됩니다.) 

```
./push.sh
```

### 실행 화면

노랗게 밑줄 친 부분이 커밋의 이름입니다. 

![Git  Push Automation by Shell Script](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-11-04-auto_git_push_by_shell_script/1.jpg)


실행이 완료되고, 프로젝트 폴더를 보시면 push.log 파일이 있는 것을 확인하실 수 있습니다. 이 파일은 gitignore에 추가해 주세요.

![Git  Push Automation by Shell Script](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-11-04-auto_git_push_by_shell_script/2.jpg)


Github에서도 푸쉬가 잘 이루어진 것을 확인할 수 있습니다.

![Git  Push Automation by Shell Script](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-11-04-auto_git_push_by_shell_script/3.jpg)

## 마무리

진작에 쓸 걸 그랬어요 ㅋㅋㅋㅋㅋ

단순히 글 업로드 할 때는 `push.sh`를 사용하고, 따로 웹블로그 커스터마이징 할 때에는 수동으로 `git add&commit&push` 해서 사용하고 있습니다.