package com.signup11.be.model;

import com.google.common.base.Objects;
import java.time.LocalDateTime;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Table(value = "interests")
public class Interest {

  @Id
  private Long seq;

  @Column(value = "user_seq")
  private Long userSeq;

  private String content;

  @Column(value = "create_at")
  public LocalDateTime createdDate;

  public Interest(Long userSeq, String content) {
    this.userSeq = userSeq;
    this.content = content;
    this.createdDate = LocalDateTime.now();
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Interest interest = (Interest) o;
    return Objects.equal(userSeq, interest.userSeq) &&
        Objects.equal(content, interest.content);
  }

  @Override
  public int hashCode() {
    return Objects.hashCode(seq);
  }

  @Override
  public String toString() {
    return new ToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE)
        .append("seq", seq)
        .append("userSeq", userSeq)
        .append("content", content)
        .append("createdDate", createdDate)
        .toString();
  }
}
