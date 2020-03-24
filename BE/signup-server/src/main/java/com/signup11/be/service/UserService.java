package com.signup11.be.service;

import com.signup11.be.model.User;
import com.signup11.be.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

  private final UserRepository userRepository;

  public UserService(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  @Transactional
  public User join(String id, String password, String name) {
    User user = new User(id, password, name);
    return save(user);
  }

  private User save(User user) {
    return userRepository.save(user);
  }
}
