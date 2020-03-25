package com.signup11.be.repository;

import com.signup11.be.model.User;
import java.util.Optional;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends CrudRepository<User, Long> {

  @Query("SELECT * FROM users u WHERE u.id = :userId")
  Optional<User> findById(@Param(value = "userId") String userId);
}
