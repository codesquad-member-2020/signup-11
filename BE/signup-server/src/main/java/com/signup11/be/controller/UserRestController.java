package com.signup11.be.controller;

import com.signup11.be.api.ApiResult;
import com.signup11.be.model.Interest;
import com.signup11.be.model.JoinRequest;
import com.signup11.be.model.JoinResult;
import com.signup11.be.model.User;
import com.signup11.be.service.UserService;
import java.util.List;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("users")
public class UserRestController {

  private final UserService userService;

  public UserRestController(UserService userService) {
    this.userService = userService;
  }

  @PostMapping(path = "")
  public ApiResult<JoinResult> join(@RequestBody JoinRequest joinRequest) {
    User user = new User.Builder()
        .id(joinRequest.getUserId())
        .password(joinRequest.getPassword())
        .name(joinRequest.getName())
        .birth(joinRequest.getBirth())
        .gender(joinRequest.getGender())
        .email(joinRequest.getEmail())
        .phone(joinRequest.getPhone())
        .build();
    String interests = joinRequest.getInterests();
    User saved = userService.join(user, interests);
    List<Interest> interestList = userService.findByUserSeq(saved.getSeq());

    return ApiResult.OK(new JoinResult(saved, interestList));
  }
}
