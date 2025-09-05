package com.shinki.shinki.repository;

import com.shinki.shinki.entity.Request;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface RequestRepository extends JpaRepository<Request, Long> {
    List<Request> findByMemberIdOrderByCreatedAtDesc(Long memberId);
    List<Request> findAllByOrderByCreatedAtDesc();
    List<Request> findByMemberIdAndStatusOrderByCreatedAtDesc(Long memberId, String status);
    List<Request> findByMemberIdAndStatusInOrderByCreatedAtDesc(Long memberId, List<String> statuses);
    void deleteByMemberId(Long memberId);
    
    @Query("SELECT r FROM Request r WHERE r.member.id = :memberId AND DATE(r.createdAt) = :searchDate ORDER BY r.createdAt DESC")
    List<Request> findByMemberIdAndCreatedAtDateOrderByCreatedAtDesc(@Param("memberId") Long memberId, @Param("searchDate") String searchDate);
}
