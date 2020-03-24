package com.signup11.be.model;

import static org.assertj.core.api.Assertions.assertThat;

import java.time.LocalDateTime;
import java.util.Optional;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class UserRepositoryTest {

  @Autowired
  private UserRepository userRepository;

  private Logger logger = LoggerFactory.getLogger(UserRepositoryTest.class);


  @Test
  public void 유저가입() {
    User user = new User();
    user.id = "han123";
    user.password = "1234";
    user.name = "한";
    user.createdDate = LocalDateTime.now();

    logger.debug("User before save {}", user);

    User saved = userRepository.save(user);
    assertThat(saved.id).isNotNull();

    logger.debug("User after save {}", saved);

    saved.name = "변경했음!";

    userRepository.save(saved);

    Optional<User> reloaded = userRepository.findById(saved.seq);

    assertThat(reloaded).isNotEmpty();

    assertThat(reloaded.get().name).isEqualTo(saved.name);

    logger.debug("User after update {}", reloaded.get());
  }

}
