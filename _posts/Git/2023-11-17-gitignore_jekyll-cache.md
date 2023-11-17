---

layout: post
title: '[Git백과사전] .jekyll-cache를 gitignore에 추가해야 할까?'
subheading: git gitignore jekyll jekyll-cache cache local server github jekyll_Talk gem 깃 깃허브 github_page
author: Daeun
categories: Git
banner:
tags: Git
  
---

github page의 yml을 수정하고 푸쉬하려고 보니 `./jekyll-cache/` 경로에 복잡하게 생긴 파일이 추가되어 있었습니다.

![git 특정 파일, 폴더의 커밋 기록 모두 삭제하기](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-11-17-gitignore_jekyll-cache/1.jpg)

## 뭔가... github에 올라가면 안될 것 같은 느낌

직관적으로 `.gitignore`에 있어야 할 친구 같은 느낌이었습니다. 파일앞에 `.`도 붙어있고요. 

![git 특정 파일, 폴더의 커밋 기록 모두 삭제하기](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-11-17-gitignore_jekyll-cache/2.png)


그리고 파일을 열어봤더니.....?!

![git 특정 파일, 폴더의 커밋 기록 모두 삭제하기](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-11-17-gitignore_jekyll-cache/3.jpg)

왜 gitignore에 있는데 커밋에 반영된거지....??

### 아마 추측하기에,,,,,,

git의 경우 한번 add & commit이 되면 그 뒤에 gitignore에 등록이 되더라도 계속 tracking이 됩니다. gitignore에 올라갔다고 해서 자동으로 untrack이 되지 않는 것이죠. 

제가 올해 초에 githubpage 테마를 다시 pull해 왔는데, 이때 gitignore이 추가된 거여서 테마를 업그레이드 하기 전에 커밋이 올라가 버린 `.jekyll-cache`가 계속 tracking되고 있었던 것 같습니다.

github을 보시면 gitignore에도 불구하고 파일이 업로드된 모습을 볼 수 있습니다.

![git 특정 파일, 폴더의 커밋 기록 모두 삭제하기](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-11-17-gitignore_jekyll-cache/4.png)

## 그래서 `.jekyll-cache`는 깃헙에 올라가도 되는 건가요?

정답은 아니요.

[jekyll Talk 질의응답 자료: Should I add .jekyll-cache changes in my commits?](https://talk.jekyllrb.com/t/should-i-add-jekyll-cache-changes-in-my-commits/4464)

이유는 요약하자면 크게  2가지 입니다.

1. 배포 시 컴퓨터 환경이 로컬과 달라지기 때문에 cache로 인해 불필요한 충돌이 발생할 수 있습니다.
2. 굳이 배포에 필요없는 cache를 업로드 하여 업로드 시간이나, 속도에 악영향을 줄 필요는 없습니다.

위 글에 따르면, github page의 경우 로컬 환경에서 개발이 이루어지지만, 웹사이트로 배포가 이루어질 때는 서버 컴퓨터에서 실행되게 됩니다. **따라서 컴퓨터 환경이 달라지기 때문에 cache로 인해 불필요한 충돌이 발생할 수 있습니다.**

그 외에도 굳이 배포에 필요하지 않은 cache를 업로드하여 **업로드 시간이나, 속도에 악영향을 줄 필요는 없으므로** 깃헙에 올리지 않는 것이 좋다고 하네요.

무엇보다 에러 방지를 위해 불필요한 파일 업로드는 피하는 게 상책^^^

## 문제 해결: 특정 파일, 폴더의 커밋 기록 모두 삭제하기

이게 `.jekyll-cache` 폴더가 담긴 모든 commit에서 `.jekyll-cache`의 기록만 삭제할 것입니다.

다행히도 커밋 자체는 그대로 남이 있고, `.jekyll-cache` 폴더의 흔적만 사라지는 것이니 안심하셔도 됩니다.

이제 아래 명령어를 입력합시다. 저는 해당 폴더에 속한 모든 파일을 지울 거라 `.jekyll-cache/`이라고 작성했습니다.
```
git filter-branch -f --index-filter "git rm -r --cached --ignore-unmatch .jekyll-cache/" --prune-empty -- --all
```

### 명령어 실행 모습

처음에 경고가 뜨고 좀 기다리면 아래처럼 제거가 됩니다. 저는 몇 분 걸렸습니다.

![git 특정 파일, 폴더의 커밋 기록 모두 삭제하기](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-11-17-gitignore_jekyll-cache/5.png)

![git 특정 파일, 폴더의 커밋 기록 모두 삭제하기](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-11-17-gitignore_jekyll-cache/6.png)

명령어 실행이 끝났습니다.

### github에 반영하기(forced push)

이미 push되어 있던 커밋을 변경했기 때문에 forced push를 해주어야 합니다. 혹시 조금 무섭다면 복사본을 만들어 놓으세요.(저는 쫄보라 복사본 만들어 놓았음.)

```
git push --force --all
```

![git 특정 파일, 폴더의 커밋 기록 모두 삭제하기](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-11-17-gitignore_jekyll-cache/7.png)
  
역시 변경사항이 많아서 push도 오래 걸립니다.
 
 ## 해결 완료
 ![git 특정 파일, 폴더의 커밋 기록 모두 삭제하기](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-11-17-gitignore_jekyll-cache/8.png)


jekyll-cache 파일이 사라진 모습을 볼 수 있습니다!
