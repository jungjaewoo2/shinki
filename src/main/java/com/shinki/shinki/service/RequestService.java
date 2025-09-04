package com.shinki.shinki.service;

import com.shinki.shinki.entity.Request;
import com.shinki.shinki.entity.Member;
import com.shinki.shinki.repository.RequestRepository;
import com.shinki.shinki.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
public class RequestService {
    
    @Autowired
    private RequestRepository requestRepository;
    
    @Autowired
    private MemberRepository memberRepository;
    
    public Request createRequest(Request request, Long memberId) {
        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new RuntimeException("회원을 찾을 수 없습니다."));
        request.setMember(member);
        return requestRepository.save(request);
    }
    
    public List<Request> getRequestsByMemberId(Long memberId) {
        return requestRepository.findByMemberIdOrderByCreatedAtDesc(memberId);
    }
    
    public List<Request> getAllRequests() {
        return requestRepository.findAllByOrderByCreatedAtDesc();
    }
    
    public Request getRequestById(Long id) {
        return requestRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("의뢰를 찾을 수 없습니다."));
    }
    
    public Request updateRequestStatus(Long id, String status) {
        Request request = getRequestById(id);
        request.setStatus(status);
        return requestRepository.save(request);
    }

    public List<Request> getCancelledRequestsByMemberId(Long memberId) {
        return requestRepository.findByMemberIdAndStatusInOrderByCreatedAtDesc(memberId, List.of("취소 진행중", "취소 완료"));
    }

    public Request updateRequest(Request updatedRequest, MultipartFile file, String existingFilePath, boolean shouldRemoveExistingFile) throws IOException {
        Request existingRequest = getRequestById(updatedRequest.getId());

        existingRequest.setPrivacyAgreement(updatedRequest.getPrivacyAgreement());
        existingRequest.setPrivacyAgreed(updatedRequest.getPrivacyAgreed());
        existingRequest.setApplicationType(updatedRequest.getApplicationType());
        existingRequest.setTitle(updatedRequest.getTitle());
        existingRequest.setContent(updatedRequest.getContent());

        // 기존 파일 삭제 플래그가 true인 경우
        if (shouldRemoveExistingFile) {
            if (existingRequest.getFilePath() != null && !existingRequest.getFilePath().isEmpty()) {
                Path oldFilePath = Paths.get("src/main/webapp/uploads/request/" + existingRequest.getFilePath());
                try {
                    Files.deleteIfExists(oldFilePath);
                } catch (IOException e) {
                    System.err.println("기존 파일 삭제 실패: " + oldFilePath + " - " + e.getMessage());
                }
            }
            existingRequest.setFilePath(null);
        }
        // 새 파일이 업로드된 경우
        else if (file != null && !file.isEmpty()) {
            // 기존 파일 삭제 (만약 존재한다면)
            if (existingRequest.getFilePath() != null && !existingRequest.getFilePath().isEmpty()) {
                Path oldFilePath = Paths.get("src/main/webapp/uploads/request/" + existingRequest.getFilePath());
                try {
                    Files.deleteIfExists(oldFilePath);
                } catch (IOException e) {
                    System.err.println("기존 파일 삭제 실패: " + oldFilePath + " - " + e.getMessage());
                }
            }
            
            String uploadDir = "src/main/webapp/uploads/request/";
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            String originalFilename = file.getOriginalFilename();
            String fileName = System.currentTimeMillis() + "_" + originalFilename;
            Path filePath = Paths.get(uploadDir + fileName);
            Files.write(filePath, file.getBytes());

            // 파일명만 저장 (경로 제외)
            existingRequest.setFilePath(fileName);
        }
        // 새 파일이 없고 기존 파일 삭제 플래그도 false인 경우 기존 파일 유지
        else if (existingFilePath != null && !existingFilePath.isEmpty()) {
            existingRequest.setFilePath(existingFilePath);
        }

        return requestRepository.save(existingRequest);
    }
}
