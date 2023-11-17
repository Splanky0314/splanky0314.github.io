---

layout: post
title: '[Git백과사전] 특정 파일, 폴더의 커밋기록 모두 삭제하기(git filter-branch)'
subheading: git gitignore jekyll jekyll-cache cache local server github jekyll_Talk gem 깃 깃허브 github_page
author: Daeun
categories: Git
banner:
tags: Git

---

저의 경우 github에 올라가지 말아야 할 `./jekyll-cache/`가 그동안 commit되었다는 것을 지금 알아챘습니다.

![git 특정 파일, 폴더의 커밋 기록 모두 삭제하기](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-11-17-gitignore_jekyll-cache/1.jpg)

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