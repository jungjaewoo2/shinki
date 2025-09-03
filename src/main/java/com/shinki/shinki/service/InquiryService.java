package com.shinki.shinki.service;

import com.shinki.shinki.entity.Inquiry;
import com.shinki.shinki.entity.Member;
import com.shinki.shinki.repository.InquiryRepository;
import com.shinki.shinki.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Date;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
@Transactional
public class InquiryService {
    
    private static final Logger logger = LoggerFactory.getLogger(InquiryService.class);
    
    @Autowired
    private InquiryRepository inquiryRepository;
    
    @Autowired
    private MemberRepository memberRepository;
    
    public Inquiry createInquiry(Inquiry inquiry, Long memberId) {
        logger.info("=== InquiryService.createInquiry 시작 ===");
        logger.info("memberId: {}", memberId);
        logger.info("inquiry.inquiryType: {}", inquiry.getInquiryType());
        logger.info("inquiry.content: {}", inquiry.getContent());
        
        if (memberId != null) {
            logger.info("회원 조회 시작 - memberId: {}", memberId);
            Member member = memberRepository.findById(memberId)
                    .orElseThrow(() -> new RuntimeException("회원을 찾을 수 없습니다."));
            inquiry.setMember(member);
            logger.info("회원 조회 완료 - member: {}", member.getUsername());
        } else {
            logger.warn("memberId가 null입니다.");
        }
        
        logger.info("Inquiry 저장 시작");
        Inquiry savedInquiry = inquiryRepository.save(inquiry);
        logger.info("Inquiry 저장 완료 - ID: {}", savedInquiry.getId());
        
        return savedInquiry;
    }
    
    public List<Inquiry> getInquiriesByMemberId(Long memberId) {
        logger.info("getInquiriesByMemberId 호출 - memberId: {}", memberId);
        try {
            List<Inquiry> inquiries = inquiryRepository.findByMemberIdOrderByCreatedAtDesc(memberId);
            logger.info("문의 조회 완료 - memberId: {}, 문의 수: {}", memberId, inquiries.size());
            return inquiries;
        } catch (Exception e) {
            logger.error("문의 조회 중 오류 발생 - memberId: {}", memberId, e);
            throw new RuntimeException("문의 내역을 조회하는 중 오류가 발생했습니다.", e);
        }
    }
    
    public List<Inquiry> getAllInquiries() {
        return inquiryRepository.findAllByOrderByCreatedAtDesc();
    }
    
    public Inquiry getInquiryById(Long id) {
        return inquiryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("문의를 찾을 수 없습니다."));
    }
    
    public Inquiry replyToInquiry(Long id, String adminReply) {
        Inquiry inquiry = getInquiryById(id);
        inquiry.setAdminReply(adminReply);
        inquiry.setStatus("완료");
        inquiry.setReplyDate(new Date());
        return inquiryRepository.save(inquiry);
    }
}
