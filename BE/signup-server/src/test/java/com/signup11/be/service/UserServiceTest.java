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
    String id = "test1234";
    String password = "1234";
    String name = "테스터";
    User saved = userService.join(id, password, name);
    assertThat(saved).isNotNull();
    assertThat(saved.name).isEqualTo(name);
  }
}
