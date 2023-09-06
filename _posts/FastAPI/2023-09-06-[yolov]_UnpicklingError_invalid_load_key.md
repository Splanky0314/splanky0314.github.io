---
layout: post
title: "[YOLOV] UnpicklingError: invalid load key, 'v'. 에러 해결 방법"
subheading: 
author: Daeun
categories: FastAPI
banner:
tags: FastAPi python django sqlmodel engine API backend web http pathlib path pymysql mysql SQL

---

## 에러 내용

개인 ip는 가렸습니다.

```
INFO:     <~도메인~> - "POST /upload-image?username=user1&challenge_id=1 HTTP/1.1" 500 Internal Server Error
ERROR:    Exception in ASGI application
Traceback (most recent call last):
  File "/usr/local/lib/python3.11/site-packages/uvicorn/protocols/http/httptools_impl.py", line 426, in run_asgi
    result = await app(  # type: ignore[func-returns-value]
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/site-packages/uvicorn/middleware/proxy_headers.py", line 84, in __call__
    return await self.app(scope, receive, send)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/site-packages/fastapi/applications.py", line 292, in __call__
    await super().__call__(scope, receive, send)
  File "/usr/local/lib/python3.11/site-packages/starlette/applications.py", line 122, in __call__
    await self.middleware_stack(scope, receive, send)
  File "/usr/local/lib/python3.11/site-packages/starlette/middleware/errors.py", line 184, in __call__
    raise exc
  File "/usr/local/lib/python3.11/site-packages/starlette/middleware/errors.py", line 162, in __call__
    await self.app(scope, receive, _send)
  File "/usr/local/lib/python3.11/site-packages/starlette/middleware/exceptions.py", line 79, in __call__
    raise exc
  File "/usr/local/lib/python3.11/site-packages/starlette/middleware/exceptions.py", line 68, in __call__
    await self.app(scope, receive, sender)
  File "/usr/local/lib/python3.11/site-packages/fastapi/middleware/asyncexitstack.py", line 20, in __call__
    raise e
  File "/usr/local/lib/python3.11/site-packages/fastapi/middleware/asyncexitstack.py", line 17, in __call__
    await self.app(scope, receive, send)
  File "/usr/local/lib/python3.11/site-packages/starlette/routing.py", line 718, in __call__
    await route.handle(scope, receive, send)
  File "/usr/local/lib/python3.11/site-packages/starlette/routing.py", line 276, in handle
    await self.app(scope, receive, send)
  File "/usr/local/lib/python3.11/site-packages/starlette/routing.py", line 66, in app
    response = await func(request)
               ^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/site-packages/fastapi/routing.py", line 273, in app
    raw_response = await run_endpoint_function(
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/site-packages/fastapi/routing.py", line 190, in run_endpoint_function
    return await dependant.call(**values)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/FastAPI/main.py", line 165, in upload_image
    result=check_challenge(photo_url, challenge)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/FastAPI/main.py", line 94, in check_challenge
    objects:set = detect.run(
                  ^^^^^^^^^^^
  File "/usr/local/lib/python3.11/site-packages/torch/utils/_contextlib.py", line 115, in decorate_context
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/app/yolov5/detect.py", line 100, in run
    model = DetectMultiBackend(weights, device=device, dnn=dnn, data=data, fp16=half)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/yolov5/models/common.py", line 356, in __init__
    model = attempt_load(weights if isinstance(weights, list) else w, device=device, inplace=True, fuse=fuse)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/yolov5/models/experimental.py", line 79, in attempt_load
    ckpt = torch.load(attempt_download(w), map_location='cpu')  # load
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/site-packages/torch/serialization.py", line 815, in load
    return _legacy_load(opened_file, map_location, pickle_module, **pickle_load_args)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/site-packages/torch/serialization.py", line 1033, in _legacy_load
    magic_number = pickle_module.load(f, **pickle_load_args)
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
_pickle.UnpicklingError: invalid load key, 'v'.
```

어제까지만 해도 잘 작동하던  yolov5가 에러를 뱉었습니다.

`_pickle.UnpicklingError: invalid load key, 'v'.` 를 검색했더니, 캐시 파일이 커지면 문제가 생길 수 있다는 내용도 있고, git-lfs가 linux에 설치되지 않아 발생하는 에러라는 내용도 있더군요.

다른 사람들은 성공했다는 여러가지 방법을 다 시도해 보았습니다. 여러분들도 1번부터 성공할 때까지 쭉~ 시도해 보시면 될듯합니다. (제가 성공한 사례는 맨 마지막에 있습니다.)

## 시도1. git-lfs 설치

linux에 git-lfs가 설치되어 있지 않은 것이 원인일 수 있습니다.

### git-lfs 설치하기
```
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs
apt-get install git-lfs
```

### 참고한 게시물

[https://velog.io/@ailab/%EB%AA%A8%EB%8D%B8-%ED%8C%8C%EC%9D%BC-%EB%A1%9C%EB%93%9C%EC%8B%9C-%EC%97%90%EB%9F%AC](https://velog.io/@ailab/%EB%AA%A8%EB%8D%B8-%ED%8C%8C%EC%9D%BC-%EB%A1%9C%EB%93%9C%EC%8B%9C-%EC%97%90%EB%9F%AC)

제 경우에는 왜인지 30분을 기다려 보아도 설치가 안되더라고요...;; 서버 사양을 가장 낮은 걸로 해서 그런가........ 뭐지.....

아니면 용량 초과 문제였을 수도 있습니다. 일단 잘 모르겠으니 이 방법은 PASS

## 시도2. git-lfs 삭제, untrack

[git-lfs untrack 방법](https://blog.syki66.com/2021/04/09/git-lfs-untrack/)

처음에는 가중치(weight) 파일이 100MB가 넘어서 git-lfs를 사용했으나, 지금은 3.~MB 짜리를 사용하고 있기 때문에 git-lfs를 사용할 필요가 없었습니다.

그래서 위 블로그의 글을 시도했지만..... 뭐가 뭔지 잘 모르겠......................;;

(이러다가 시도5에서 git-lfs untrack을 하고 성공했습니다.)

## 시도3. docker container, image 삭제하고 다시 올리기

원해 컴퓨터는 껐다가 키면 고쳐집니다. 지금도 github-actions complete 되는 걸 기다리면서 글을 쓰고 있는데요, 과연 성공할 수 있을지.....!

네 똑같은 에러가 떴다고 합니다. 에라이.

심지어 서버까지 바꿔서 했는데 똑같은 에러 나옴...;;

## 시도4. chatGPT에게 물어보기

ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 내가 하도 해매니까 팀원이 GPT한테 SOS를 쳐줬습니다.

GPT 선생님 왈.

```
1.  The error log you've provided indicates that there was a "500 Internal Server Error" when processing a POST request to the "/upload-image" endpoint with certain query parameters (username=user1 and challenge_id=1). The error seems to be occurring within the ASGI application, and it's related to Python code, particularly FastAPI and YOLOv5. Here's a breakdown of the error traceback: The request is being processed by ASGI (Asynchronous Server Gateway Interface). It passes through various middleware components (e.g., proxy_headers, errors, exceptions) in FastAPI and Starlette. Eventually, it reaches the "upload_image" endpoint in your FastAPI application. Within that endpoint, it appears that there's a call to a "check_challenge" function. In the "check_challenge" function, there's a call to a "detect.run" function. Inside "detect.run," there's an attempt to load a YOLOv5 model using the "torch.load" function. The error occurs during the model loading process with the message "_pickle.UnpicklingError: invalid load key, 'v'." The error message suggests that there's an issue with unpickling (loading) a Python object. It seems like the model weights file being loaded may be corrupted or incompatible with the version of PyTorch you are using. Here are some steps you can take to troubleshoot this issue: Check the integrity of the YOLOv5 model weights file to ensure it's not corrupted. Verify that you are using a compatible version of YOLOv5 with the version of PyTorch you have installed. Check if there have been any changes or updates in the YOLOv5 model loading code that may require modifications in your code. If the issue persists, you may need to provide more specific information about your environment, the YOLOv5 version, and how the model weights file was obtained in order to get more targeted assistance in resolving the problem.
```

맨 앞부분은 debug log 해석만 해 놓은 것이고 뒷부분이 꽤 정확해서 놀랐습니다. 하지만 이미 stackoverflow에서 그런 건 알려줬단다^^

## 시도5. git-lfs untrack 재시도

(아래에서 *.pt는 모든 .pt 파일을 가리킵니다. 여러분이 untrack하고 싶은 파일의 확장자 또는 파일명을 적어주시면 됩니다.)

```
git lfs untrack *.pt
git rm --cached *.pt

# git general이 다시 tracking 하도록 설정
git add *.pt
```

<img src="https://cdn.jsdelivr.net/gh/splanky0314/CDN/FastAPI/2023-09-06-[yolov]_UnpicklingError_invalid_load_key/1.png" alt="success" width=70%>