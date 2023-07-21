---
layout: post
title: '마인크래프트 엄청 쉽게 Spigot 서버 만들기(ubuntu)'
subheading: 
author: Daeun
categories: Game
banner:
tags: 마인크래프트 minecraft 야생서버 마인크래프트장거리멀티 이보다_더_쉬울_수는_없다.

---

## ubuntu 서버 만들기

곧 자세한 설명을 담은 글이 따로 업로드 될 예정입니다.

[iwinv](https://www.iwinv.kr/)


## ubuntu 서버에 접속하기

```
ssh root@<ip>
```
이후 비밀번호 입력

## Spigot 다운로드
```
wget https://download.getbukkit.org/spigot/spigot-1.20.1.jar
```
(위 링크의 버전은 자기가 필요한 데로 수정하시면 됩니다.)

## java 다운로드

아래 명령어를 순차적으로 입력해주세요.

```
sudo apt update
sudo apt install git build-essential
sudo apt install openjdk-17-jdk
```

잘 설치되었는지 확인해 봅시다.
```
java -version
```

## 마인크래프트 서버 실행시켜 보기

지금까지의 과정이 정상적으로 이루어졌는지 확인해 봅시다. 

맨 처음 다운받은 spigot-1.20.1.jar 가 있는 경로에서 다음 명령을 실행합니다.
```
java -Xmx1024M -ms1024M -jar spigot-1.20.1.jar nogui
```

-  Xmx는 최대 RAM 사용량을 의미하고 1024M은 1024MB를 할당함을 뜻합니다. (1G로 표현할 수도 있습니다.)
-  ms는 최소 RAM 사용량을 의미합니다. 
- nogui는 서버가 굴러가는 모습을 시각화해서 표현하는 GUI를 보지 않겠다는 것입니다. 우리는 우분투를 사용하기 때문에 GUI를 보는 의미가 없으니 nogui로 설정합니다.

## elua.txt 수정하기

서버가 정상적으로 실행되었다면 elua.txt를 수정하라는 메세지와 함께 서버가 종료될 것입니다.

루트 디렉터리에서 `ls -al`을 치면 elua.txt를 확인하실 수 있을 겁니다.

elua.txt는 일종의 사용 약관입니다. false를 true로 바꾸어 약관에 동의함으로 수정합시다.

```
vim elua.txt										// vim 편집기로 elua.txt를 열기
i누르고 false를 true로 수정하기 		// i는 파일을 수정하겠다는 것을 의미합니다.
ESC누르기
:wq 치고 Enter									// 저장하고 빠져나오기
```

## 마인크래프트 서버 실행하기

아까와 똑같이 아래 명령을 실행시켜 줍니다.

```
java -Xmx1024M -ms1024M -jar spigot-1.20.1.jar nogui
```
Done!가 뜨고 정상적으로 서버에 접속이 된다면 성공!

서버 도메인은 공인IP주소에 포트 25565를 붙인 꼴 입니다. 이 포트는 server.properties에서 수정 가능합니다.

예시) 11.111.11.111:25565

### 참고 - 발생할 수 있는 오류들

1. 서버가 막 시작되다가 갑자기 콘솔에 `Killed`가 쳐지면서 서버가 종료됨.

	아래 명령어를 통해 RAM 크기를 할당할 때,
		
	```
	java -Xmx1024M -ms1024M -jar spigot-1.20.1.jar nogui
	```

	RAM을 너무 많이 할당하면 실행 과정에서 killed 오류가 날 수 있습니다. 이 경우에는 할당한 RAM을 줄이면 됩니다.
		
	[참고 자료](https://www.spigotmc.org/threads/servern-crashing-ubuntu-with-killed-error.106488/)

## 추가 설정1 - 백그라운드에서 서버 실행

위의 방법은 여러분의 컴퓨터의 콘솔을 닫는다면 우분투 서버가 꺼진다는 단점을 가지고 있습니다. 이 문제를 해결하기 위해서는 콘솔이 닫히더라도 우분투 서버 혼자 돌아가도록 해야 합니다. 이때 screen을 사용합니다.

## Screen 설치하기

```
apt update
apt install screen
```

```
vim run.sh
i누르고 screen -d -m java -Xmx1G -Xms1G -jar spigot-1.20.1.jar 작성하기			
ESC누르기
:wq 치고 Enter	
	
chmod u+r+x run.sh		// 권한 부여	
```

## 백그라운드에서 마인크래프트 서버 실행하기

아래 명령어를 입력합니다. 

```
./run.sh
```

그러면 여러분의 콘솔 창에는 아무것도 뜨지 않지만, 새로운 screen 하나가 생성되어 그 screen에서 마인크래프트 서버가 실행됩니다.

## Screen 명령어들

### screen -r : 생성된 screen 콘솔 보기

만들어진 screen을 봅니다.

### ctrl + a + d

screen을 보다가 메인 콘솔로 돌아가고 싶을 때 누르는 키 입니다.

### sudo screen -list : 현재 실행 중인 screen을 확인합니다.

### 그 외

screen에는 아주 많은 명령어가 있습니다. 그 중 중요한 것을 정리한 다른 분의 글이 있으니 아래 글을 참고하시면 되겠습니다.

[screen 명령어 정리](https://velog.io/@hanakim120/Screen-%EC%82%AC%EC%9A%A9%EB%B2%95)

## 추가 설정2 - 기존 맵 가져오기

뭐 ubuntu로 파일을 넘기는 방법에는 여러가지가 있습니다. 저는 익숙한 github를 이용해 맵 파일을 넘겼습니다.

## Step1. 기존 맵 Github에 업로드하기

본인의 github에 맵 파일을 업로드 합니다. 이때 repository는 public으로 해두는 것이 편합니다. 왜냐하면 ubuntu 서버에는 당신의 github ID로 로그인이 되어 있지 않을 거거든요!

## Step2. ubuntu 서버에 있는 맵 삭제하기

맵 디렉터리로 이동합시다. 

```
cd world
```

원래 있던 맵을 삭제합시다. 파일 다 삭제되니 cd를 잘 사용하여 올바른 경로로 갈 것!!!!!

```
rm *
```

## Step3. ubuntu 서버에서 맵 다운로드하기

맵을 다운로드할 디렉터리에서 아래 명령어를 입력합니다. **마지막에 점**을 꼭 입력하셔야 됩니다. 안그러면 repository 이름으로 된 폴더가 생겨버립니다!!!!

```
git clone https://github.com/~ .
```

성공적으로 clone이 되었다면 끝!

## 마무리

고등학교 때 동아리 면접 보거나 하면 마인크래프트 하다가 프로그래머의 꿈을 가지게 되었다는 친구들이 종종 있더라고요. 오늘 서버 만들어보면서 그 말이 한번에 이해됐습니다. 게임 자체가 자유도가 높고 여러가지 설정이 가능해서 파면 팔수록 뭐가 엄청나게 쏟아지네요.

전에 글에서 저희 집 데스크탑으로 RAM을 할당하고 spigot 플러그인으로 인터넷에 연결해서 마인크래프트 서버를 만든느 방법을 소개했습니다. 그런데 이게 RAM을 16GB나 할당을 해 봤자, spigot plugin이 느려서(무료 버전이라면) 랙이 걸리더라고요. 그래서 그냥 돈 좀 내고 서버를 산 겁니다.

주변에 마인크래프트 하는 모든 친구를 모은 디스코드 방이 있습니다. 친구가 또 친구를 데려오고 해서 지금은 6명 정도가 있네요. 요 친구들이랑 같이 게임이나 하려고 만들었어요. 

여튼, 제가 오늘 소개한 방법은 매우 쉬운 편이라고 생각합니다. 친구들이랑 서버 만들어서 즐거운 게임 하시기 바래요~