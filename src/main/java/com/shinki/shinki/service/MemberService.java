package com.shinki.shinki.service;

import com.shinki.shinki.entity.Member;
import com.shinki.shinki.repository.MemberRepository;
import com.shinki.shinki.repository.RequestRepository;
import com.shinki.shinki.repository.InquiryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class MemberService {
    
    @Autowired
    private MemberRepository memberRepository;
    
    @Autowired
    private RequestRepository requestRepository;
    
    @Autowired
    private InquiryRepository inquiryRepository;
    
    public Member registerMember(Member member) {
        if (memberRepository.existsByUsername(member.getUsername())) {
            throw new RuntimeException("이미 존재하는 아이디입니다.");
        }
        return memberRepository.save(member);
    }
    
    public Member updateMember(Member member) {
        return memberRepository.save(member);
    }
    
    public void deleteMember(Long memberId) {
        // 회원의 의뢰내역 삭제
        requestRepository.deleteByMemberId(memberId);
        
        // 회원의 문의사항 삭제
        inquiryRepository.deleteByMemberId(memberId);
        
        // 회원 삭제
        memberRepository.deleteById(memberId);
    }
    
    public Member findByUsername(String username) {
        return memberRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("회원을 찾을 수 없습니다."));
    }
    
    public Member findByNameAndEmail(String name, String email) {
        return memberRepository.findByNameAndEmail(name, email)
                .orElse(null);
    }
    
    public boolean existsByUsername(String username) {
        return memberRepository.existsByUsername(username);
    }
    
    public Long getFirstMemberId() {
        List<Member> members = memberRepository.findAll();
        if (members.isEmpty()) {
            // throw new RuntimeException("등록된 회원이 없습니다."); // 실제 배포 시에는 로그인된 회원 ID를 사용해야 합니다.
            return 1L; // 개발/테스트를 위한 임시 기본값
        }
        return members.get(0).getId();
    }
}
