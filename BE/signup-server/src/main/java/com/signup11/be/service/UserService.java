package com.signup11.be.service;

import com.google.common.base.Splitter;
import com.signup11.be.model.Interest;
import com.signup11.be.model.User;
import com.signup11.be.repository.InterestRepository;
import com.signup11.be.repository.UserRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

  private final UserRepository userRepository;
  private final InterestRepository interestRepository;

  public UserService(UserRepository userRepository, InterestRepository interestRepository) {
    this.userRepository = userRepository;
    this.interestRepository = interestRepository;
  }


  @Transactional
  public User join(User user, String interests) {
    User saved = save(user);
    List<Interest> interestList = createInterest(saved.getSeq(), interests);
    addInterest(interestList);
    return saved;
  }

  @Transactional(readOnly = true)
  public List<Interest> findByUserSeq(Long userSeq) {
    return interestRepository.findByUserSeq(userSeq);
  }

  @Transactional
  public void addInterest(List<Interest> interests) {
    for (Interest interest : interests) {
      interestRepository.save(interest);
    }
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
