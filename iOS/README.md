# signup-11
회원가입 프로젝트 - 11팀

## 실행화면 

### 회원가입 창

* 텍스트의 길이가 0인 경우

![all_required](https://user-images.githubusercontent.com/38216027/87513127-2925a500-c6b3-11ea-8552-91b7f51aa181.gif)

* 아이디
  * 아이디의 조건이 맞지 않는 경우 
  * 아이디가 이미 존재하는 경우 
  * 아이디의 조건이 맞는 경우 

![id_required](https://user-images.githubusercontent.com/38216027/87512871-ba484c00-c6b2-11ea-8791-8bae2f6d4cdc.gif)

* 비밀번호 
  * 8자 이상, 16자 이하로 적지 않은 경우
  * 영문 대문자 1자 이상 포함하지 않은 경우 
  * 숫자를 1자 이상 포함하지 않은 경우 
  * 특수문자를 최소 1자 이상 포함하지 않은 경우 (!@#$%) 
  * 아이디의 조건이 맞는 경우 

![pw_required](https://user-images.githubusercontent.com/38216027/87514285-f8466f80-c6b4-11ea-930c-e890bd45e4b2.gif)

* 비밀번호 재확인 
  * 이전 비밀번호가 올바르지 않은 경우 
  * 이전 비밀번호와 일치하지 않은 경우 
  * 비밀번호가 일치하는 경우

![repw_required](https://user-images.githubusercontent.com/38216027/87514618-7c98f280-c6b5-11ea-8e09-8493f69fd178.gif)


* 이름 
  * 이름에 공백이 있는 경우 
  * 이름의 조건이 경우 

![name_required](https://user-images.githubusercontent.com/38216027/87514978-15c80900-c6b6-11ea-98a2-6c999c97d76b.gif)

### 로그인 창 

* 잘못된 ID, Password인 경우 

=> 로그인 실패 토스트 메시지 출력

![login_fail](https://user-images.githubusercontent.com/38216027/87515653-1dd47880-c6b7-11ea-987b-311878e80d15.gif)

* 올바른 ID, Password인 경우

=> 로그인 성공 토스트 메시지 출력

![login_success](https://user-images.githubusercontent.com/38216027/87515887-7b68c500-c6b7-11ea-8c19-a2e8be11d76c.gif)