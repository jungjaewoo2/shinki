package com.shinki.shinki.controller;

import com.shinki.shinki.entity.Inquiry;
import com.shinki.shinki.entity.Member;
import com.shinki.shinki.service.InquiryService;
import com.shinki.shinki.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import jakarta.validation.Valid;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.io.IOException;

@Controller
@RequestMapping("/mypage")
public class InquiryController {
    
    private static final Logger logger = LoggerFactory.getLogger(InquiryController.class);
    
    @Autowired
    private InquiryService inquiryService;
    
    @Autowired
    private MemberService memberService;
    
    @GetMapping("/inquiry")
    public String inquiryPage(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }
        
        try {
            Member member = memberService.findByUsername(username);
            model.addAttribute("memberId", member.getId());
        } catch (Exception e) {
            logger.error("사용자 정보 조회 실패", e);
            return "redirect:/mypage/login";
        }
        return "mypage/inquiry";
    }
    
    @PostMapping("/inquiry")
    public String createInquiry(@Valid @ModelAttribute Inquiry inquiry,
                               @RequestParam(required = false) MultipartFile file,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        logger.info("=== 문의 등록 시작 ===");
        
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }
        
        try {
            Member member = memberService.findByUsername(username);
            Long memberId = member.getId();
            
            logger.info("inquiryType: {}", inquiry.getInquiryType());
            logger.info("content: {}", inquiry.getContent());
            logger.info("memberId: {}", memberId);
            logger.info("file: {}", file != null ? file.getOriginalFilename() : "null");
            logger.info("file size: {}", file != null ? file.getSize() : 0);
            
            // 파일 업로드 처리
            if (file != null && !file.isEmpty()) {
                logger.info("파일 업로드 조건 만족: 파일 존재 및 비어있지 않음");
                logger.info("파일 업로드 시작: {}", file.getOriginalFilename());
                String uploadDir = "src/main/webapp/uploads/inquiry/";
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                    logger.info("업로드 디렉토리 생성: {}", uploadDir);
                }
                
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                Path filePath = Paths.get(uploadDir + fileName);
                
                try {
                    Files.write(filePath, file.getBytes());
                    inquiry.setFilePath(uploadDir + fileName);
                    logger.info("파일 업로드 완료: {}", filePath);
                } catch (IOException ioException) {
                    logger.error("파일 저장 중 IOException 발생: {}", ioException.getMessage(), ioException);
                    redirectAttributes.addFlashAttribute("error", "파일 저장 중 오류가 발생했습니다: " + ioException.getMessage());
                    return "redirect:/mypage/inquiry";
                }
            } else {
                logger.info("파일 업로드 조건 불만족: 파일이 없거나 비어있음");
            }
            
            logger.info("InquiryService.createInquiry 호출 시작");
            Inquiry savedInquiry = inquiryService.createInquiry(inquiry, memberId);
            logger.info("문의 등록 성공 - ID: {}", savedInquiry.getId());
            
            redirectAttributes.addFlashAttribute("message", "문의가 성공적으로 등록되었습니다.");
            logger.info("리다이렉트: /mypage/inquiry-history");
            return "redirect:/mypage/inquiry-history";
        } catch (Exception e) {
            logger.error("문의 등록 실패", e);
            logger.error("예외 메시지: {}", e.getMessage());
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            logger.info("리다이렉트: /mypage/inquiry");
            return "redirect:/mypage/inquiry";
        }
    }
    
    @GetMapping("/inquiry-history")
    public String inquiryHistoryPage(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }

        try {
            Member member = memberService.findByUsername(username);
            List<Inquiry> inquiries = inquiryService.getInquiriesByMemberId(member.getId());
            
            model.addAttribute("inquiries", inquiries != null ? inquiries : new java.util.ArrayList<>());
            
            logger.info("문의 내역 조회 성공 - 사용자: {}, 문의 수: {}", 
                       username, inquiries != null ? inquiries.size() : 0);
            
            if (inquiries != null) {
                for (Inquiry inquiry : inquiries) {
                    logger.info("Inquiry ID: {}, Type: {}, Content: {}, CreatedAt: {}, Status: {}",
                                inquiry.getId(), inquiry.getInquiryType(), inquiry.getContent(),
                                inquiry.getCreatedAt(), inquiry.getStatus());
                }
            }

        } catch (Exception e) {
            logger.error("inquiryHistoryPage - 오류 발생", e);
            model.addAttribute("inquiries", new java.util.ArrayList<>());
            model.addAttribute("error", "문의 내역을 불러오는 중 오류가 발생했습니다.");
        }
        return "mypage/inquiry-history";
    }
}

@Controller
@RequestMapping("/admin")
class AdminInquiryController {
    
    @Autowired
    private InquiryService inquiryService;
    
    @GetMapping("/inquiries")
    public String adminInquiryList(Model model) {
        List<Inquiry> inquiries = inquiryService.getAllInquiries();
        model.addAttribute("inquiries", inquiries);
        return "admin/inquiry-list";
    }
    
    @PostMapping("/inquiry/{id}/reply")
    public String replyToInquiry(@PathVariable Long id,
                                @RequestParam String adminReply,
                                RedirectAttributes redirectAttributes) {
        try {
            inquiryService.replyToInquiry(id, adminReply);
            redirectAttributes.addFlashAttribute("message", "답변이 등록되었습니다.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/admin/inquiries";
    }
}
