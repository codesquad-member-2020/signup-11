package com.signup11.be.service;

import static org.assertj.core.api.Assertions.assertThat;

import com.signup11.be.model.User;
import org.junit.jupiter.api.BeforeEach;
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
  private User user;

  @BeforeEach
  public void 생성() {
    user = new User.Builder()
        .id("test1234--!!")
        .password("12345")
        .name("테스터")
        .birth("2020-03-24")
        .gender("male")
        .email("test@gmail.com")
        .phone("010-1233-4567")
        .build();
  }

  @Test
  public void 가입() {
    String interests = "영화감상, 자전거";
    User saved = userService.join(user, interests);
    assertThat(saved).isNotNull();
    assertThat(saved.getName()).isEqualTo(user.getName());
  }
}
