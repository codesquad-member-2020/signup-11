package com.signup11.be.controller;

import com.signup11.be.api.ApiResult;
import com.signup11.be.error.NotMatchException;
import com.signup11.be.error.UserNotFoundException;
import com.signup11.be.error.UnauthorizedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GeneralExceptionHandler {

  private Logger logger = LoggerFactory.getLogger(GeneralExceptionHandler.class);

  private ResponseEntity<ApiResult> newResponse(Throwable throwable, HttpStatus httpStatus) {
    HttpHeaders httpHeaders = new HttpHeaders();
    httpHeaders.add("ContentType", "application/json");
    return new ResponseEntity<>(ApiResult.ERROR(throwable, httpStatus), httpHeaders, httpStatus);
  }

  @ExceptionHandler(UserNotFoundException.class)
  public ResponseEntity<?> NotFound(UserNotFoundException e) {
    logger.debug("NotFoundException, {}", e.getMessage());
    return newResponse(e, HttpStatus.NOT_FOUND);
  }

  @ExceptionHandler(UnauthorizedException.class)
  public ResponseEntity<?> Unauthorized(UnauthorizedException e) {
    logger.debug("UnauthorizedException, {}", e.getMessage());
    return newResponse(e, HttpStatus.UNAUTHORIZED);
  }

  @ExceptionHandler(NotMatchException.class)
  public ResponseEntity<?> NotMatched(NotMatchException e) {
    logger.debug("NotMatchException, {}", e.getMessage());
    return newResponse(e, HttpStatus.UNAUTHORIZED);
  }


}
