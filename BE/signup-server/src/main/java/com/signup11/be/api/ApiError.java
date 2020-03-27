package com.signup11.be.api;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.http.HttpStatus;

public class ApiError {

  private final String message;

  private final int httpStatus;

  public ApiError(Throwable throwable, HttpStatus httpStatus) {
    this.message = throwable.getMessage();
    this.httpStatus = httpStatus.value();
  }


  public ApiError(String message, HttpStatus httpStatus) {
    this.message = message;
    this.httpStatus = httpStatus.value();
  }

  public String getMessage() {
    return message;
  }

  public int getHttpStatus() {
    return httpStatus;
  }

  @Override
  public String toString() {
    return new ToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE)
        .append("message", message)
        .append("httpStatus", httpStatus)
        .toString();
  }
}
