package com.signup11.be.controller;

import com.signup11.be.api.ApiResult;
import com.signup11.be.error.UnauthorizedException;
import com.signup11.be.error.UserNotFoundException;
import com.signup11.be.model.AuthenticationRequest;
import com.signup11.be.model.Interest;
import com.signup11.be.model.JoinRequest;
import com.signup11.be.model.JoinResult;
import com.signup11.be.model.User;
import com.signup11.be.service.UserService;
import java.util.List;
import java.util.Optional;
import javax.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

  @PostMapping(path = "login")
  public ApiResult<Boolean> login(@RequestBody AuthenticationRequest request, HttpSession session) {
    String userId = request.getUserId();
    String password = request.getPassword();
    User user = userService.login(userId, password);
    session.setAttribute(user.getId(), user);
    return ApiResult.OK(true);
  }

  @GetMapping(path = "/{userId}")
  public ApiResult<User> get(@PathVariable(value = "userId") String id, HttpSession httpSession) {
    User sessionUser = (User) Optional.ofNullable(httpSession.getAttribute(id)).
        orElseThrow(() -> new UnauthorizedException(id));
    User user = userService.findById(id).orElseThrow(() -> new UserNotFoundException(id));

    if (!sessionUser.equals(user)) {
      return ApiResult.ERROR("잘못된 접근입니다", HttpStatus.UNAUTHORIZED);
    }
    return ApiResult.OK(user);
  }
}
