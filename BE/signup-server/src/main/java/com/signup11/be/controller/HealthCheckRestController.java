package com.signup11.be.controller;

import com.signup11.be.api.ApiResult;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/_hcheck")
@Api(tags = "헬스체크 API")
public class HealthCheckRestController {

  @GetMapping
  public ApiResult<Long> healthCheck() {
    return ApiResult.OK(System.currentTimeMillis());
  }
}
