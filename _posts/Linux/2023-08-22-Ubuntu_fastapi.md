---
layout: post
title: '[Linux] ubuntu FastAPI서버 세팅하기'
subheading: 
author: Daeun
categories: Linux
banner:
tags: 리눅스 Linux ubuntu LTS iwinv cracked 해킹 우분투 가상서버 

---

미리 말씀드립니다.

저는 프론트엔드를 담당하는 친구들이 잠시 Test를 할 수 있도록 하는 것이 목적이라,

개발 서버를 돌리는 방식으로 배포했습니다.(정석적인 배포가 아닙니다. 임시, 테스트로 활용하신다면 이 방법을 사용해 보세요.)

## user 만들기

root는 매우 강력한 권한을 사용하기 때문에 편리합니다. 그러나 권한이 강력한 만큼 잘못된 명령을 내렸을 때 서버에 어마어마한 영향을 줄 수 있습니다.

### adduser / useradd

**useradd**은 사용자 홈dir을 자동으로 생성하지 않는 것이 가장 큰 특징입니다.

반면, **adduser**는 사용자 홈디렉토리를 자동으로 생성하는 것이 가장 큰 특징입니다.

이번 글에서는 홈디렉터리를 사용할 것이기 떄문에 adduser를 사용하겠습니다.

```
sudo adduser (username)
```

### 권한 부여 및 해당 계정으로 로그인
```
usermod -aG sudo (username)

su - (username)
```

이 상태에서 `exit`을 입력하면 이전에 로그인한 계정으로 되돌아갑니다.

## pip3 설치하기

```
sudo apt install python3-pip

// 제대로 설치되었는지 확인
pip3
```

## pipenv를 설치 및 가상환경 만들기

```
// 현재 PATH 변수 내용 확인
echo $PATH

// PATH에 변수 추가하기
PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
PATH="$PATH:$PYTHON_BIN_PATH"

// 변수 추가 확인
echo $PATH
```

경로를 설정했으니, pipenv를 설치해봅시다.

```
pip3 install pipenv

// pipenv 설치 확인
pipenv
```

[Ubuntu PIPENV 설치 참고 자료](https://blog.naver.com/PostView.nhn?blogId=youngsiphone&logNo=221857231923&redirect=Dlog&widgetTypeCall=true&directAccess=false)

### pipenv 가상환경 만들기

```
pipenv install --python 3.11
```

### 가상환경 진입

```
pipenv shell
```

### pipenv package 설치

본인의 프로젝트에 필요한 package를 설치해 줍니다.

```
pipenv install fastapi
pipenv install uvicorn[standard]

// 여기부터는 각자 필요한 module 다운로드
pipenv install sqlmodel
pipenv install opencv-python
pipenv install python-multipart

pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
```

이유는 모르겠지만 pipenv install torch 하면 오류가 납니다.(이것 때문에 몇시간을 해맨건지....)

## ImportError-libGLso1-cannot-open-shared-object-file-No-such-file-or-directory 오류

만약에 ImportError-libGLso1-cannot-open-shared-object-file-No-such-file-or-directory 오류가 발생했다면,

```
sudo apt install libgl1-mesa-glx
```

opencv-python을 설치한 뒤 cv2를 import하려고 할 떄 발생할 수 있는 에러이다. 

이러한 에러가 발생하는 이유는 cv2의 dependency 라이브러리 파일 중 일부의 설치가 이루어지지 않아서 발생한다고 한다.

## FastAPI 실행하기

```
pipenv run uvicorn main:app --reload --hos
t=0.0.0.0
```

--reload는 main.py에 변화가 생겼을 때 자동으로 reload된다는 의미

--host=0.0.0.0은 외부에서 접속할 수 있도록 허용한다는 의미

## 마무리

원래대로라면 github에서 그대로 당겨오면 되는데 프로젝트 폴더 용량이...... 2GB를 넘어서.................. scp로 파일 전송하고 여러가지 추가적인 과정이 좀 있었다.

무엇보다 torch 설치가 계속 오류나서 지금 5시간차에 드디어 성공했다.....

물론 사실 이 방법은 좋은 방법은 아니다. 개발할 때 쓰라고 만든 uvicorn ~ 로 서버를 돌리고 있으니.......... 지금은 테스트를 위해 임시로 만든 거라 요렇게 했다.

[참고 자료](https://wikidocs.net/177245)