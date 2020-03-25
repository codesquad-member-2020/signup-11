package com.signup11.be.controller;

import com.signup11.be.model.JoinRequest;
import com.signup11.be.model.User;
import com.signup11.be.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api")
public class UserRestController {

  private final UserService userService;

  private Logger logger = LoggerFactory.getLogger(UserRestController.class);

  public UserRestController(UserService userService) {
    this.userService = userService;
  }

  @PostMapping(path = "users")
  public void join(@RequestBody JoinRequest joinRequest) {
    logger.debug("joinRequest mapping {}", joinRequest);
    User user = userService.join(
        joinRequest.getUserId(),
        joinRequest.getPassword(),
        joinRequest.getName(),
        joinRequest.getBirth(),
        joinRequest.getGender(),
        joinRequest.getEmail(),
        joinRequest.getPhone(),
        joinRequest.getInterests()
    );
    logger.debug("saved User {},", user);
  }
}
