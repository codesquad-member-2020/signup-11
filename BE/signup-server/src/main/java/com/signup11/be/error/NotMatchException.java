package com.signup11.be.error;

public class NotMatchException extends RuntimeException {

  public NotMatchException(String errorMessage) {
    super("NotMatchException : " + errorMessage);
  }
}
