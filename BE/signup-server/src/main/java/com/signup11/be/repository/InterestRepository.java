package com.signup11.be.repository;

import com.signup11.be.model.Interest;
import java.util.List;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

public interface InterestRepository extends CrudRepository<Interest, Long> {

  @Query("SELECT * FROM interests i WHERE i.user_seq = :userSeq")
  List<Interest> findByUserSeq(Long userSeq);
}
