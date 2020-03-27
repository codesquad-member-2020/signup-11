package com.signup11.be.error;

public class UserNotFoundException extends RuntimeException {

  public UserNotFoundException(String  userId) {
    super("User Not Found: " + userId);
  }
}
