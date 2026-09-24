---
layout: post
title: "[후보 방법론 2] mimic vs non_speech를 판별하는 선형 probe"
subheading: "Perch, ContentVec, HuBERT 인코더 비교"
author: Daeun
categories: AISW_Maestro
date: 2026-09-24 00:00:00 +0900
description: "앵무새 mimic과 non_speech를 선형 probe로 분리하는 목표에서 Perch 2.0, ContentVec, HuBERT 세 인코더를 같은 데이터와 방법으로 비교한 기록입니다. 화자 정보를 제거한 ContentVec만 계정 내 분리도가 뚜렷이 높았고, 최고 인코더도 상한 0.65 수준임을 확인했습니다."
banner: "https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/AISW_Maestro_background.png"
image:
  path: "https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/2026-09-24-mimic-nonspeech-encoders/fig_headline_macro_auc.png"
  alt: "인코더별 계정 내 분리도, ContentVec만 약 0.10 더 높다"
tags: AISW마에스트로 17기 2026년 서울센터 버디버드 다희혁 앵무새 mimic non_speech 인코더 Perch ContentVec HuBERT 선형probe 화자disentanglement account-macro
---

## 0. 용어 정리

- mimic: 앵무새가 사람 단어를 흉내 낸 클립. 사람이 듣기에 일상 발성과 다른 느낌을 준다
- non_speech: 앵무새의 일상 발성 클립. 일반적인 짹짹 소리.
- 계정: 서비스에 등록된 한 가정. 대체로 한 마리 앵무와 보호자
- 선형 probe: 임베딩을 입력으로 사용하는 로지스틱 회귀 분류기
- AUC: 두 클래스를 구분하는 정도. 0.5는 무작위, 1.0은 완전 구분
- account-macro: 계정마다 따로 AUC를 재서 평균한 값. 녹음 출처 구성 효과를 배제한다



---



## 1. 목표

> mimic과 non_speech를 구분하는 선형 probe를 학습 및 테스트한다. 



non speech는 앵무새의 일상적인 짹짹 음이지만, mimic은 인간의 발화를 모사한 것으로, 인간이 듣기에 소리에 차이가 확인된다. 



&nbsp;

이 접근을 고른 이유는 두 가지다.

- 데이터 확보: non_speech는 공개 데이터에서 비교적 쉽게 수집 가능하다. 
- 비교 구도: `후보 방법론 1`과 다르게, 보호자 reference 음성과 앵무 음성을 비교하지 않고(사람 vs 앵무), 앵무 mimic과 앵무 non_speech를 비교한다. 같은 종 안에서 비교하므로 정확도가 더 높을 수 있다.



&nbsp;

## 2. 시도한 인코더 조합

```
오디오 클립 -> (인코더) -> 벡터값 -> (선형 probe) -> 유사도 점수
```



여기에서 '인코더'가 중요하다. 오디오의 특징을 잘 벡터화하는 인코더를 골라야 선형 probe의 성능이 보장된다. 이 테스트에서는 총 3가지의 인코더를 검토하였다. 



1. Perch 2.0
  - 생물종 구분을 목적으로 설계된 생물 음향 인코더. 
  - 종 판별에 최적화되어, 같은 종 안 개체의 소리 차이는 약하게 벡터화되는 경향이 있는 것으로 추정된다.
2. ContentVec
  - HuBERT에서 화자 정보를 제거하도록 다시 학습한 사람 음성 인코더. 
  - 음소와 발화 내용은 보존하고 화자 정체성은 지운다.
3. HuBERT
  - 사람 음성을 자기지도로 학습한 음성 표현 인코더(SSL). 
  - 음소와 화자 정보를 함께 담는다. ContentVec이 변형하기 전의 원본이다.

---



## 3. 데이터셋

- 대상: 소형조와 중형조 앵무. 대형조는 제외했다.
- 규모: mimic 1,123개, non_speech 32,901개. 합계 34,024개.
- 출처: 실제 앱서비스에서 수집된 데이터와 공개 오디오 수집된 데이터로 구성. non_speech는 공개 데이터로 대량 확보가 쉬워, 두 클래스의 수가 크게 차이난다.




| 클래스        | 클립 수   | 비고                          |
| ---------- | ------ | --------------------------- |
| mimic      | 1,123  | 사람이 단어를 가르친 소수 사례라 희소       |
| non_speech | 32,901 | 공개 데이터로 대량 확보, mimic의 약 29배 |


#### 데이터 분할과 평가

- 계정 단위로 학습과 평가를 나눴다. 같은 계정의 클립은 train 또는 test 한쪽에만 속한다.
- 학습은 dev 계정(mimic 95개)의 데이터와 추가 수집한 비발화로 진행했다.
- 성능은 fixed_legacy 회귀셋(mimic 1,028개, non_speech 4,991개)에서 계정 내(account-macro)로 측정했다.

  
- 사람이 직접 라벨링한 한계로, non_speech 데이터에는, mimic과 유사한 오디오 클립이 섞여있을 수 있다. 
- 따라서 mimic 라벨의 오디오 클립이 probe에서 어떻게 분류되었는지가 더 중요한 지표로 보아야 한다.



---



## 4. 테스트 결과

> 아래 confusion matrix는 예시다. 이 실험은 임계값을 정하지 않는 threshold-free 분석이라, 여기서는 fixed_legacy에서 Youden's J로 임계값을 잡아 그렸다. 

### 4-1. Perch 2.0

Perch 2.0은 생물 음향 인코더로, 생물 음향에 특화되어 있다. 

Perch 2.0인코더로 1536차원 임베딩을 산출하고, 임베딩 벡터가 선형 probe(표준화와 L2 로지스틱 회귀)를 거쳐 유사도 점수가 산출되도록 설계했다, 



AUC가 0.55 안팎으로, 사실상 무작위에 가깝다.


| 지표  | 값     |
| --- | ----- |
| AUC | 0.553 |


![Perch 2.0 점수 분포](https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/2026-09-24-mimic-nonspeech-encoders/fig_dist_perch.png)

![Perch 2.0 confusion matrix](https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/2026-09-24-mimic-nonspeech-encoders/fig_cm_perch.png)



&nbsp;

### 4-2. ContentVec 시도

#### 배경

Perch는 오디오를 분석하여 생물종을 맞히도록 학습된 모델이다. 그리고 종 분류를 목적으로 하므로, 같은 종 안에서 개체가 내는 소리 차이는 오히려 반영하지 않는 편이 유리하다. 

> 그러나 본 과제는 '조류'라는 소수의 생물종 안에서, 단어를 조음했는지 여부이다.

그래서 사람 음소 내용은 포함하되 화자 정체성은 제거한 표현을 시도했다. 

ContentVec은 HuBERT에서 화자 정보를 제거하도록 다시 학습한 변형이다. 



#### 결과


| 지표  | 값     |
| --- | ----- |
| AUC | 0.652 |


ContentVec은 Perch보다 분리도가 높다. `AUC가 0.652`로 약 0.10 상승했다.

다만 절대 수준은 여전히 낮다. 상한 0.65는 운용 가능한 수준과 거리가 멀다.



![ContentVec 점수 분포](https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/2026-09-24-mimic-nonspeech-encoders/fig_dist_contentvec.png)

![ContentVec confusion matrix](https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/2026-09-24-mimic-nonspeech-encoders/fig_cm_contentvec.png)



### 4-3. HuBERT 시도

ContentVec의 상승이 사람 음성 SSL 자체 덕분인지 화자 제거 덕분인지 구분하기 위해, HuBERT를 시도했다. HuBERT는 ContentVec이 변형하기 전의 원본이다.



&nbsp;


| 지표  | 값     |
| --- | ----- |
| AUC | 0.537 |


AUC가 0.55 안팎으로 Perch와 비슷하다. 



![HuBERT 점수 분포](https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/2026-09-24-mimic-nonspeech-encoders/fig_dist_hubert.png)

![HuBERT confusion matrix](https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/2026-09-24-mimic-nonspeech-encoders/fig_cm_hubert.png)



## 5. 종합 결과

![인코더별 계정 내 분리도](https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/2026-09-24-mimic-nonspeech-encoders/fig_headline_macro_auc.png)


| 인코더                   | account-macro AUC |
| --------------------- | ----------------- |
| Perch(조류 전용)          | 0.553             |
| ContentVec(L9, 화자 제거) | 0.652             |
| HuBERT(L10, 음성 SSL)   | 0.537             |




레이어를 변경하며 확인해도 결론은 같다. ContentVec 곡선만 Perch와 HuBERT보다 위에 있다.

![레이어별 분리도](https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/2026-09-24-mimic-nonspeech-encoders/fig_layer_sweep.png)



![세 인코더가 보존하거나 제거하는 정보](https://cdn.jsdelivr.net/gh/splanky0314/CDN/AISW_Maestro/2026-09-24-mimic-nonspeech-encoders/fig_mechanism.png)
