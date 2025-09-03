package com.shinki.shinki.repository;

import com.shinki.shinki.entity.Request;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface RequestRepository extends JpaRepository<Request, Long> {
    List<Request> findByMemberIdOrderByCreatedAtDesc(Long memberId);
    List<Request> findAllByOrderByCreatedAtDesc();
    List<Request> findByMemberIdAndStatusOrderByCreatedAtDesc(Long memberId, String status);
}
