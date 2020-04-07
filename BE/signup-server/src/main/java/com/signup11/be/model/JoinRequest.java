package com.signup11.be.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class JoinRequest {

  private String userId;
  private String password;
  private String name;
  private String birth;
  private String gender;
  private String email;
  private String phone;
  private String interests;

  protected JoinRequest() {
  }

  public String getUserId() {
    return userId;
  }

  public String getPassword() {
    return password;
  }

  public String getName() {
    return name;
  }

  public String getBirth() {
    return birth;
  }

  public String getGender() {
    return gender;
  }

  public String getEmail() {
    return email;
  }

  public String getPhone() {
    return phone;
  }

  public String getInterests() {
    return interests;
  }

  @Override
  public String toString() {
    return new ToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE)
        .append("userId", userId)
        .append("password", password)
        .append("name", name)
        .append("birth", birth)
        .append("gender", gender)
        .append("email", email)
        .append("phone", phone)
        .append("interests", interests)
        .toString();
  }
}
