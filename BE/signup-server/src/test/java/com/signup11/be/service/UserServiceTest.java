package com.signup11.be.service;

import static org.assertj.core.api.Assertions.assertThat;

import com.signup11.be.model.User;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class UserServiceTest {

  @Autowired
  private UserService userService;

  private Logger logger = LoggerFactory.getLogger(UserServiceTest.class);

  @Test
  public void 유저가입() {
    String userId = "postManUser";
    String password = "1234";
    String name = "테스터";
    String birth = "2020-03-24";
    String gender = "남자";
    String email = "test@gmail.com";
    String phone = "010-1234-5678";
    String interests = "영화감상, 자전거";
    User saved = userService.join(userId, password, name, birth, gender, email, phone, interests);
    assertThat(saved).isNotNull();
    assertThat(saved.getName()).isEqualTo(name);
  }
}
