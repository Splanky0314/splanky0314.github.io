---
layout: post
title: '[Network] IP와 TCP,UDP'
subheading: 
author: Daeun
categories: Network
banner:
tags: 

---

## IP: Internet Protocol
![image](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/8744955c-8882-4f23-85a9-008d3d6b36fe)
- 지정된 IP Address에 데이터를 전달한다.
- 패킷의 통신 단위로 데이터를 전달한다.

> 패킷 Packet이란?: 컴퓨터 네트워크에서 Data를 주고받을 때 정해 놓은 규칙이다.
![image](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/ee1bfa89-6608-45e3-8fb2-04d126b925b4)
IP패킷에는 해당 패킷의 출발지 IP주소와 목적지 IP주소 등의 정보가 포함되어 있다.

그러나 IP 프로토콜은 아래와 같은 문제점이 있다.
1. 패킷의 도착지가 사라졌거나 응답 불가 상태이더라도 패킷이 전송된다. (비연결성)
2. 전달 도중 패킷이 사라질 수도 있다. (비신뢰성)
3. 패킷 여러개를 전송했을 때, 패킷이 순서대로 도착하지 않을 수 있다. (비신뢰성)
4. 하나의 컴퓨터에서 음악을 듣거나 게임을 하는 등 한 IP에서 통신하는 Application이 여러개일 수 있다. (프로그램 구분 문제)

## TCP: Transmission Control Protocol(전송 제어 규약)
TCP는 위에서 언급한 IP 프로토콜의 문제를 보안해준다.

### TCP/IP 4계층
송신자가 Data를 전송하기 위해서는 4계층부터 1계층까지의 단계를 거치며 Data를 캡슐화해야 한다.

4계층: 응용계층(Application)                            - Http, Ftp

3계층: 전송계층(Transport)                              - TCP(출발지 PORT, 목적지 PORT, 순서, 검증정보 등을 추가), UDP

2계층: 인터넷 계층(Internet)                            - IP(출발지 IP, 목적지 IP등을 정보에 추가)

1계층: 네트워크 인터페이스 계층(Network Interface)      - LAN 장비 

수신자는 송신자로부터 정보를 넘겨받아 정보가 1계층부터 4계층까지의 단계를 거치도록 하여 정보를 역캡슐화한다.

### TCP 특징
1. 3 way handshake
    ![image](https://github.com/Splanky0314/splanky0314.github.io/assets/79370538/e8daaabc-6e1c-4d5b-973f-488f0abe8967)

   클라이언트가 서버에게: 접속 요청 전송
   서버가 클라이언트에게: 접속 요청 + 요청 수락 전송
   클라이언트가 서버에게: 요청 수락 전송

3. 데이터 전달 보증
   송신자가 Data를 전송한 뒤, 수신자가 Data를 받았다는 신호를 보낸다.

4. 순서 보장
   중간에 패킷의 순서가 잘못된 경우, 수신자에게 잘못된 패킷부터 다시 패킷의 전송을 요청한다.

5. 결국 TCP는 서비스를 신뢰할 수 있도록 하며, 현재 대부분의 인터넷 서비스에서 TCP가 사용된다.

## UDP: User Datagram Protocol(사용자 데이터그램 규약)
TCP의 경우 3 way handshake 등 송수신자가 서로 주고받아야 하는 정보가 있기 때문에 전달되는 Data의 양이 늘어나고, 속도가 떨어진다. 그러나 TCP의 경우 이미 많은 서비스에서 사용하고 있기 때문에 직접적으로 TCP에 변화를 주는 것은 어렵다. 이때 UDP를 이용하여 애플리케이션의 수준에서 전송 데이터양과 속도를 최적화를 시킬 수 있다.

## 참고자료
- 인프런 `모든 개발자를 위한 HTTP 웹 기본 지식`, 김영한
- 해로 블로그 (https://velog.io/@haero_kim/%EB%AC%BC-%ED%9D%90%EB%A5%B4%EB%93%AF-%EC%9D%BD%EC%96%B4%EB%B3%B4%EB%8A%94-TCPIP)
- 패킷 사진자료 (https://networkencyclopedia.com/network-packet/)
- 3 way handshake 사진자료 (https://www.scaler.com/topics/computer-network/tcp-3-way-handshake/)