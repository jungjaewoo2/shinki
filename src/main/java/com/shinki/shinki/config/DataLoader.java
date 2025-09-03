package com.shinki.shinki.config;

import com.shinki.shinki.entity.Member;
import com.shinki.shinki.entity.Request;
import com.shinki.shinki.repository.MemberRepository;
import com.shinki.shinki.repository.RequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import java.time.LocalDateTime;

@Component
public class DataLoader implements CommandLineRunner {
    
    @Autowired
    private MemberRepository memberRepository;
    
    @Autowired
    private RequestRepository requestRepository;
    
    @Override
    public void run(String... args) throws Exception {
        // 기존 데이터가 없을 때만 테스트용 회원 데이터 생성
        if (memberRepository.count() == 0) {
            Member testMember = new Member();
            testMember.setHospitalName("테스트병원");
            testMember.setDepartment("내과");
            testMember.setName("홍길동");
            testMember.setUsername("test");
            testMember.setPassword("1234");
            testMember.setPhone("010-1234-5678");
            testMember.setEmail("test@example.com");
            
            memberRepository.save(testMember);
            System.out.println("테스트 회원 데이터가 생성되었습니다. (ID: " + testMember.getId() + ")");
            
            // 테스트용 Request 데이터 생성 (reg_condition = 2)
            Request testRequest = new Request();
            testRequest.setMember(testMember);
            testRequest.setPrivacyAgreement("환자 정보 보호 동의서 내용입니다.");
            testRequest.setPrivacyAgreed(true);
            testRequest.setApplicationType("CARDIAC");
            testRequest.setTitle("심장 수술 시뮬레이션 의뢰");
            testRequest.setContent("심장 수술 시뮬레이션을 의뢰합니다. 시뮬레이션은 어떤식으로 진행되나요?");
            testRequest.setStatus("주문 확인중");
            testRequest.setRegCondition(2); // 견적중 단계
            testRequest.setCreatedAt(LocalDateTime.now());
            testRequest.setUpdatedAt(LocalDateTime.now());
            
            requestRepository.save(testRequest);
            System.out.println("테스트 Request 데이터가 생성되었습니다. (ID: " + testRequest.getId() + ", reg_condition: " + testRequest.getRegCondition() + ")");
        } else {
            System.out.println("기존 회원 데이터가 존재합니다. 테스트 데이터를 생성하지 않습니다.");
        }
    }
}
