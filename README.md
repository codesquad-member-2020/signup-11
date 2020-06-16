# signup-11
회원가입 프로젝트 - 11팀

## 1. 그라운드 룰 

[Github wiki][ground-rule]


## 2. 기능 목록 

* [iOS][iOS-list]
* [FE][FE-list]
* [BE][BE-list]
* [spread-sheet][SPREAD-SHEET]

[ground-rule]: https://github.com/codesquad-memeber-2020/signup-11/wiki/%EA%B7%B8%EB%9D%BC%EC%9A%B4%EB%93%9C-%EB%A3%B0
[iOS-list]: https://github.com/codesquad-memeber-2020/signup-11/wiki/iOS-%EA%B8%B0%EB%8A%A5%EB%AA%A9%EB%A1%9D
[FE-list]: https://github.com/codesquad-memeber-2020/signup-11/wiki/FE-%EA%B8%B0%EB%8A%A5%EB%AA%A9%EB%A1%9D
[spread-sheet]:https://docs.google.com/spreadsheets/d/1TbW89rU3hsL2aIAoNEiQA1i6cu5iaMkXKbpbfciA15E/edit?usp=sharin
[BE-list]:https://github.com/codesquad-memeber-2020/signup-11/wiki/BE-%EA%B8%B0%EB%8A%A5-%EB%AA%A9%EB%A1%9D

## 3. 실행화면 

* 회원가입 화면 

<img width="280" alt="회원가입 화면" src="https://user-images.githubusercontent.com/38216027/84363118-37425a80-ac09-11ea-8860-6948199c7dc5.png">

* 로그인 화면 

<img width="280" alt="로그인 화면" src="https://user-images.githubusercontent.com/38216027/84363204-55a85600-ac09-11ea-96b8-9048b6fd8e2f.png">

## 4. 조건에 따른 상태값 출력

* 텍스트의 길이가 0인 경우

![require](https://user-images.githubusercontent.com/38216027/84371008-00be0d00-ac14-11ea-9328-3ffad6b76326.gif)

* 아이디
  * 아이디의 조건이 맞지 않는 경우 
  * 아이디가 이미 존재하는 경우 
  * 아이디의 조건이 맞는 경우 

![idCorrect](https://user-images.githubusercontent.com/38216027/84474542-fa886900-acc5-11ea-8a4c-884bddb95cc5.gif)

* 비밀번호 
  * 8자 이상, 16자 이하로 적지 않은 경우
  * 영문 대문자 1자 이상 포함하지 않은 경우 
  * 숫자를 1자 이상 포함하지 않은 경우 
  * 특수문자를 최소 1자 이상 포함하지 않은 경우 (!@#$%) 
  * 아이디의 조건이 맞는 경우 

![password](https://user-images.githubusercontent.com/38216027/84370842-c8b6ca00-ac13-11ea-98cb-83e3bd57308e.gif)

* 비밀번호 재확인 
  * 이전 비밀번호가 올바르지 않은 경우 
  * 이전 비밀번호와 일치하지 않은 경우 
  * 비밀번호가 일치하는 경우

![repw](https://user-images.githubusercontent.com/38216027/84371572-d28cfd00-ac14-11ea-8ef1-5b0800c05ba6.gif)

* 이름 
  * 이름에 공백이 있는 경우 
  * 이름의 조건이 경우 

![name](https://user-images.githubusercontent.com/38216027/84371977-6ced4080-ac15-11ea-847d-6e12cf1f68cb.gif)
