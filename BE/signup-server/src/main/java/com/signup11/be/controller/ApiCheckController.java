package com.signup11.be.controller;

import com.signup11.be.api.ApiResult;
import com.signup11.be.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api")
@Api(tags = "사용자 API")
public class ApiCheckController {

  private final UserService userService;

  public ApiCheckController(UserService userService) {
    this.userService = userService;
  }

  @GetMapping(path = "userId/{userId}")
  @ApiOperation(value = "아이디 중복 확인")
  public ApiResult<Boolean> checkId(
      @PathVariable @ApiParam(value = "example: {\"id\": \"test\"}") String userId) {
    if (userService.findById(userId).isPresent()) {
      return ApiResult.OK(true);
    }
    return ApiResult.ERROR("존재하지 않는 유저입니다", HttpStatus.NOT_FOUND);
  }

  @GetMapping(path = "email/{email}")
  @ApiOperation(value = "이메일 중복 확인")
  public ApiResult<Boolean> checkEmail(
      @PathVariable @ApiParam(value = "example: {\"email\": \"test@gmail.com\"}") String email) {
    if (userService.findByEmail(email).isPresent()) {
      return ApiResult.OK(true);
    }
    return ApiResult.ERROR("존재하지 않는 유저입니다", HttpStatus.NOT_FOUND);
  }

  @GetMapping(path = "phone/{phone}")
  @ApiOperation(value = "핸드폰 중복 확인")
  public ApiResult<Boolean> checkPhone(
      @PathVariable @ApiParam(value = "example: {\"phone\": \"010-1234-5678\"}") String phone) {
    if (userService.findByPhone(phone).isPresent()) {
      return ApiResult.OK(true);
    }
    return ApiResult.ERROR("존재하지 않는 유저입니다", HttpStatus.NOT_FOUND);
  }

}
