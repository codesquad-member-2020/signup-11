package com.signup11.be.error;

public class UnauthorizedException extends RuntimeException {

  public UnauthorizedException(String userId) {
    super("UnauthorizedException User: " + userId);
  }
}
