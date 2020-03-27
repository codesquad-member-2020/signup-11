## BE

### 개발 환경 설정
- spring boot 2.2.5
- java 1.8
- dependency : web, undertow, jdbc, h2

### DB
- users
  - 회원가입한 유저를 저장할 테이블
  - column 들로는 seq(pk), id(Unique), passwd, name , birth, gender, email ,phone, create_at, last_login_at을 생각
- interests
  - 유저가 설정한 관심사들을 저장할 테이블
  - column을 어떻게 설정해야할지 의논해봐야할듯
