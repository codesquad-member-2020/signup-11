package com.signup11.be.error;

public class UnauthorizedException extends RuntimeException {

  public UnauthorizedException(String errorMessage) {
    super("UnauthorizedException User: " + errorMessage);
  }
}
