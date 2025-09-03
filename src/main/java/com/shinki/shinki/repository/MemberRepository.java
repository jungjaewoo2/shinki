package com.shinki.shinki.repository;

import com.shinki.shinki.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long> {
    Optional<Member> findByUsername(String username);
    Optional<Member> findByNameAndEmail(String name, String email);
    boolean existsByUsername(String username);
}
