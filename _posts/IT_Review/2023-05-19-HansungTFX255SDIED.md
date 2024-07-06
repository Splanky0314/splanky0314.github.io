---
layout: post
title: 한성노트북 오류, 바이오스 무한, 바이오스 탈출 불가 원인
subheading: 
author: Daeun
categories: IT
banner:
tags: hansung 한성컴퓨터 한성컴퓨터_올데이롱 TFX255S 블루투스드라이버 드라이버오류 님은 가셨습니다.

---

드디어 올게 오고야 말았다..
왜 하필 지금 과제 풍년 시즌에...;;;

## 한성컴퓨터 TFX255S 사망 일기
ㅋㅋㅋㅋㅋㅋ 망했습니다.................
아침까지 방에서는 잘 작동하던 한성이가 학교에서 실습하려고 컴퓨터를 켰더니 바이오스 지옥에 갖혔습니다....

![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/19165867-ddef-41d5-bbcb-13e0d43b2b8c)

사실 이렇게 갑자기 바이오스로 들어와진 적은 전에도 많았어서 '이번에도 또 오류났나'하고 걍 단순하게 생각했는데..... 는 개뿔 이번엔 진짜였습니다.... save & exit를 눌러도 해결이 안됬어요.. Booting option을 바꿔도 탈출이 안돼.......


![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/09fcf245-160d-4416-8129-a153375148c4)
뭔 인텔 booting? 옵션도 있길래 해봤는데 당연히 안먹혔다고 합니다...

워낙에 전에도 이런 현상이 많았던 우리 한성이라서 그냥 또 소프트웨어적인 문제겠지 싶었습니다...

좀 진정하고 bios에 표시된 정보를 봤는데, 
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/19165867-ddef-41d5-bbcb-13e0d43b2b8c)
자세히 보시면  `UEFI NVME`에 SSD가 인식되면 옆에 모델명이 같이 뜹니다. 그런데 아무것도 안떠있죠. SSD를 컴퓨터가 인식하지 못하고 있다는 뜻입니다.

일단 자취방에서 해결이 안될 문제라는게 확인되었으니 집으로 바로 출발했습니다.

## 한성노트북 TFX255S AS문의

일단 학교에서 강의 들으면서 구글링으로 온갖 것들을 다 시도해봤는데 실패.....
집가는 길에 한성AS센터 전화해봤는데, 대략 통화 내용은 아래와 같습니다.
- 상담사님이 Windows 이미지가 깨진 것 같다고 Windows 다시 깔으라고 조언하심
- 그러나 다시 깔면 SSD 데이터는 당연히 날라간다고 덛붙이심
- '전에도 이렇게 바이오스 탈출불가 현상이 있었는데 컴퓨터 자체 결함일 가능성이 있나요?'라고 질문
- 전에도 자주 이랬으면 그럴 가능성도 있다고 하심
- Q: 데이터 복원할 수 있는 방법이 있을까요?
- A: 무상 AS기간은 일단 지났고, 사설 업체 가면 가능할수도
- Q: TFX255S모델 바이오스 업데이트 버전이 올라왔던데 이거 다시 깔면 해결될 수 있을까요?
- A: 바이오스 안건드리시는게 나을겁니다.

결론 --> 어떤 경우에도 SSD 데이터 복구 불가 / ;;;;;;;;;;;


## 한성노트북 TFX255S 분해 일지
제가 하도 씨름하는데 안되니까 아빠가 아무래도 SSD가 나간 것 같다고 하셨습니다. 내가 본 글 중에서도 TFX255S모델 SSD가 나가서 업체가서 교체하니까 정상작동했다는 사례가 있었습니다.

일단 뜯었습니다.(모아니면 도 느낌) 당장 노트북 쓸일이 많아서 그냥 도박을 해보기로 했어요.
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/d9ccf5c4-a33d-446d-8643-ff517cff6d3e)

장착된 SSD 친구입니다.
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/ae56675e-c46c-40cb-9584-dbd5e739f2df)
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/cfdaf274-782f-4a75-8be8-538de2e48b1d)

일단 당장 노트북 쓸일이 많아서 당근으로 중고 SSD를 구입했습니다... 
512GB를 49000으로 구매했습니다.... 시세를 따져봤을 때 좋은 가격은 아니였는데,, 일단 당장 급하니......

이 친구가 사망하신 SSD이구요.
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/4439a295-fbb3-4ddc-ab5e-7ebcc327b1ac)

요게 새로 산 SSD입니다. 삼성 꺼네요. 기존 SSD보다 좋은 친구입니다.
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/f2cb2535-5065-4372-b193-5297fb5cd452)
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/74dbe139-74b6-41d8-a12e-b937013ce405)
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/0be1fc03-f1ca-47ca-80ce-82b58850a286)

자 이제 집에 도착해서, SSD를 장착해줍시다. 저렇게 끼우고 오른쪽 홈에 나사를 조여주면 됩니다.
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/1cbd2068-665c-4082-8aca-567f02da494f)

SSD가 인식되었습니다~~ 
저기 NvMe Controller에 `SAMSUNG ~~`가 나온것을 알 수 있죠! 원래는 저게 Empty로 인식되었거든요.
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/76a660b9-0379-403d-93b4-e546f95cdadc)
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/1184f409-5134-4a70-8aea-a3579e2134a7)

이제 윈도우를 다시 깔아봅시다. SSD가 제대로 동작되는지 볼려고 하판 열어둔 상태로 진행했어요.
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/d74fff44-2b67-4e40-80f6-debfc9840e0d)
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/97630890-08af-4b4c-8517-943e7896dadd)

아직 드라이버들을 깔지 않았기 때문에 인식되지 않은 장치들이 많은 모습입니다.
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/4300874a-a7b1-4717-a238-29ac923639c4)
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/0b04715f-ed43-46d6-b91f-f97f5de7380e)
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/be00d70e-0312-45aa-9db7-182c2cc397d1)
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/f5dc0f34-05e0-483e-af0a-2aa2ef61514c)

근데 이후에도 wifi, bluetooth 드라이버를 제대로 설치해도 동작이 안됩니다;;;;;; 인터넷도 안되고 블루투스 안되고 이 때 인내심의 끝자락까지 다녀왔어요^^

그래서 다시 구글링해보니깐 이 모델이 win10 19H2까지만 정상작동 확인되었다고 합니다^^^^^^ 하하하하하. 이제 신제품 나왔으니 구제품은 더이상 드라이버 업데이트를 안시켜주겠다 뭐 이런 심보인가요? 하하하.
결국 윈도우 다시깔았습니다^^ 아니 심지어 윈도우10 최신버적 이외에는 공식 사이트에서 다운도 안되서 뭔 이상한 사이트 뒤져가고 윈도우 파일을 인코딩? 해서 겨우겨우 성공했습니다. 오늘 하루~다음날 새벽은 이 친구에게 헌납해버렸습니다.

대략 윈도우 3번째로 깔았더니 그제야 준---성공했네요..
와이파이 드라이버 설치에 성공한 모습입니다.
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/df208022-0861-4cb6-945e-d8059230626b)

그런데,, 인터넷은 되는데 bluetooth씨가 작동을 안하십니다.;;
전에도 블루투스랑 인터넷 드라이버가 나갔던 적이 많았어서(블로그에 요 내용도 남겨놨었어요.) 블루투스 모듈이 고장난건지 한성이 소프트웨어를 개판으로 만든건지 걍 지쳐서 이대로 마무리했어요. ~~블루투스 꺼져~~

저기 하단에 `알 수 없는 USB 장치`가 있죠. 저게 아마 블루투스 모듈인 것 같습니다. 블루투스는 뭘 어떻게 해도 인식이 안되더라고요 ㅠㅠㅠㅠㅠ 결국 포기. 마우스는 동글이를 연결해서 쓰는 걸로 하기로 했습니다.
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/9b5deb65-f326-4bab-90d7-d3df3386d434)
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/c8919c23-1ece-47bc-b468-3acb43e65761)
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/d3174bd1-8270-40f0-a3e7-2fd27f0a5b5b)
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/43107287-3af9-46e1-908a-0cc933842c7d)
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/764eb875-838a-486f-a1ab-c3062e28f2b8)

![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/6681f812-c575-41af-baf2-946f025cf55f)
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/f8cfb19d-ad9f-4db0-a979-ac4093dc15c2)

그 뒤로 워드랑 엑셀 깔아서 급히 일반물리실험 레포트를 밤새 썼다는 마음아픈 사실....

## 당장 필요해서 결국은 중고로 질렀다고 한다.
한성이는 윈도우 노트북으로 서브로 사용하고 원래 맥북 15인치 나오면 살라고했는데,,,
처참하게 망해버렸습니다.

어짜피 맥북 나중에 쓰더라도 학교 수업 들을라면 아직은 Windows 노트북이 필요해서 결국 하나 사기로 했습니다. 무엇보다 당장 과제가 산더미인데 노트북 없으면 아무것도 할 수 없어서요... (안그래도 SSD 데이터 다날라가서 과제도 다날라갔는데,,,;;)
![한성노트북 무한부팅, SSD 고장](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/fd22ee18-499f-437a-8894-ab068f8cb71c)
이건 다음 글에서.....

## 결론
한성컴퓨터 평이 대부분 "한성은 뽑기운이다"입니다. 가격 대비 성능이야 개꿀이지만 마감이 부실하고 잘못 뽑으면 저같은 오류 뭉탱이 컴퓨터가 됩니다ㅋㅋㅋㅋ

동생껀 고장도 안나고 잘 작동하던데... 왜 내꺼만....;;;

여러분 싼건 이유가 있답니다...... 그래도 이친구 오류가 아주 다양하게 나는 덕분에 (드라이버 오류, 블루스크린, bios 탈출불가, 무한부팅 등등등등) 컴퓨터 지식이 엄청나게 늘은 것은 사실(물론 내 시간도 녹아내린건 사실)

앞으로는 걍 보조모니터로 연결해서 쓸 생각입니다. 어디다 중고로 내다 팔수도 없어서;;
하여튼 한성이 그동안 고마웠어