package com.signup11.be.model;

import java.time.LocalDateTime;
import java.util.Objects;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Table(value = "users")
public class User {

  @Id
  public Long seq;

  public String id;

  public String password;

  public String name;
//
//  public String birth;
//
//  public String gender;
//
//  public String email;
//
//  public String phone;

  @Column(value = "create_at")
  public LocalDateTime createdDate;

  public User() {
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj) {
      return true;
    }
    if (obj == null || getClass() != obj.getClass()) {
      return false;
    }
    User user = (User) obj;
    return Objects.equals(seq, user.seq);
  }

  @Override
  public int hashCode() {
    return Objects.hashCode(seq);
  }

  @Override
  public String toString() {
    return "User{" +
        "seq=" + seq +
        ", id='" + id + '\'' +
        ", password='" + password + '\'' +
        ", name='" + name + '\'' +
        ", createdDate=" + createdDate +
        '}';
  }
}
