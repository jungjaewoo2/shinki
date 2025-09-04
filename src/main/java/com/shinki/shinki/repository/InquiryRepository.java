package com.shinki.shinki.repository;

import com.shinki.shinki.entity.Inquiry;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface InquiryRepository extends JpaRepository<Inquiry, Long> {
    List<Inquiry> findByMemberIdOrderByCreatedAtDesc(Long memberId);
    List<Inquiry> findAllByOrderByCreatedAtDesc();
    void deleteByMemberId(Long memberId);
}
