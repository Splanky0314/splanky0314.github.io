---
layout: post
title: '[Git 지금 비상인 당신에게] Google Cloud Console 프로젝트 삭제 방법(GCP)'
subheading:
author: Daeun
categories: Git
banner:
tags: git github push pull rest forced remote Google Cloud Console GCP 구글_클라우드_플랫폼 클라우드 스프레드시트 구글독스 spreadsheet gitguardian Potentially_compromised_credentials_for_Google_Cloud_Platform Handago 고등학교챗봇 github public private 

---

## 아 또 내가 잘못했네

아니 제 github repository를 오랜만에 구경을 했는데, private이 대부분이더라고요?

그래서 횡~ 한 프로필이나 채울 겸 아무 생각 없이 Handago(고등학교 때 만든 챗봇) Repo를 public으로 전환했는데.....!!

![image](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-08-27-How_to_Delete_Google_Cloud_Console_Project/1.png)

![image](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-08-27-How_to_Delete_Google_Cloud_Console_Project/2.png)

ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ;;;;

과거의 내가 아무 생각 없이 올려버린 ID값을 미처 생각하지 못했다고 한다.........

아니 Hanweb(기숙사 기상송 신청 사이트)도 그래서 ReadME에 **절대, 무슨 일이 있어도 PUBLIC 전환 안됨** 이라고 써놨지만~ 미처 보지 못했다 하하..... Hanweb 먼저 들어가 볼 걸....

## 근데 어짜피 안 쓰는 애라서

근데 뭐 2년 간 숙성만 시키던 애라서,,

이 참에 Google Cloud Console 해지나 해보기로 했습니다.

왜 챗봇에 Google Cloud Console이 필요했냐 하면, google sheet(엑셀)에 내용 작성하고 긁어오는 기능이 필요했기 때문입니다. 다시 말해 제 ID값이 노출되면 해당 google sheet를 모르는 사람이 수정할 수 있게 되는 것이죠.

## Google Cloud Console 프로젝트 해지하기

자자 이제 빠르게 가봅시다.

1. Google Cloud Console 접속하기
   
    [구글 클라우드 콘솔 홈페이지](https://console.cloud.google.com/)

   ![image](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-08-27-How_to_Delete_Google_Cloud_Console_Project/3.png)

2. `빠른 엑세스`의 `IAM 및 관리자` 클릭

   ![image](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-08-27-How_to_Delete_Google_Cloud_Console_Project/3.png)

3. 프로필 옆 목록 버튼 클릭
   
   ![image](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-08-27-How_to_Delete_Google_Cloud_Console_Project/4.png)

4. 상단의 `종료` 클릭

    ![image](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Git/2023-08-27-How_to_Delete_Google_Cloud_Console_Project/5.png)