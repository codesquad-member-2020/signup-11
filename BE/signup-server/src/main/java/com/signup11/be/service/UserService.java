package com.signup11.be.service;

import com.google.common.base.Splitter;
import com.signup11.be.error.UserNotFoundException;
import com.signup11.be.model.Interest;
import com.signup11.be.model.User;
import com.signup11.be.repository.InterestRepository;
import com.signup11.be.repository.UserRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

  private Logger logger = LoggerFactory.getLogger(UserService.class);

  private final UserRepository userRepository;
  private final InterestRepository interestRepository;

  public UserService(UserRepository userRepository, InterestRepository interestRepository) {
    this.userRepository = userRepository;
    this.interestRepository = interestRepository;
  }

  @Transactional
  public User login(String userId, String password) {
    User user = findById(userId).orElseThrow(() -> new UserNotFoundException(userId));
    user.login(password);
    return user;
  }

  @Transactional
  public User join(User user, String interests) {
    User saved = save(user);
    List<Interest> interestList = createInterest(saved.getSeq(), interests);
    addInterest(interestList);
    return saved;
  }

  @Transactional
  public void addInterest(List<Interest> interests) {
    for (Interest interest : interests) {
      interestRepository.save(interest);
    }
  }

  @Transactional(readOnly = true)
  public List<Interest> findByUserSeq(Long userSeq) {
    return interestRepository.findByUserSeq(userSeq);
  }

  @Transactional(readOnly = true)
  public Optional<User> findById(String userId) {
    return userRepository.findById(userId);
  }

  @Transactional(readOnly = true)
  public Optional<User> findByEmail(String email) {
    return userRepository.findByEmail(email);
  }

  @Transactional(readOnly = true)
  public Optional<User> findByPhone(String phone) {
    return userRepository.findByPhone(phone);
  }


  private User save(User user) {
    return userRepository.save(user);
  }

  private List<Interest> createInterest(Long userSeq, String interests) {
    List<Interest> list = new ArrayList<>();
    Iterable<String> iterable = Splitter.on(",").trimResults().omitEmptyStrings().split(interests);
    for (String interest : iterable) {
      list.add(new Interest(userSeq, interest));
    }
    return list;
  }
}
