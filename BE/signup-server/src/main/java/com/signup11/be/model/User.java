package com.signup11.be.model;

import com.google.common.base.Objects;
import java.time.LocalDateTime;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Table(value = "users")
public class User {

  @Id
  private Long seq;

  private String id;

  private String password;

  private String name;

  public String birth;

  public String gender;

  public String email;

  public String phone;

  @Column(value = "create_at")
  public LocalDateTime createdDate;

  public User(String id, String password, String name, String birth, String gender,
      String email, String phone) {
    this.id = id;
    this.password = password;
    this.name = name;
    this.birth = birth;
    this.gender = gender;
    this.email = email;
    this.phone = phone;
    this.createdDate = LocalDateTime.now();
  }

  public Long getSeq() {
    return seq;
  }

  public String getId() {
    return id;
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

  public LocalDateTime getCreatedDate() {
    return createdDate;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    User user = (User) o;
    return Objects.equal(id, user.id);
  }

  @Override
  public int hashCode() {
    return Objects.hashCode(seq);
  }

  @Override
  public String toString() {
    return new ToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE)
        .append("seq", seq)
        .append("id", id)
        .append("password", password)
        .append("name", name)
        .append("createdDate", createdDate)
        .toString();
  }
}
