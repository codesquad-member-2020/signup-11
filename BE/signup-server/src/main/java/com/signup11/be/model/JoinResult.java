package com.signup11.be.model;

import java.util.List;

public class JoinResult {

  private final User user;
  private final List<Interest> interests;

  public JoinResult(User user, List<Interest> interests) {
    this.user = user;
    this.interests = interests;
  }

  public User getUser() {
    return user;
  }

  public List<Interest> getInterests() {
    return interests;
  }
}
