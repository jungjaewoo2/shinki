package com.shinki.shinki.controller;

import com.shinki.shinki.entity.Member;
import com.shinki.shinki.service.MemberService;
import com.shinki.shinki.service.RequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.http.ResponseEntity;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import com.shinki.shinki.entity.Request;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/mypage")
public class MemberController {
    
    @Autowired
    private MemberService memberService;

    @Autowired
    private RequestService requestService;
    
    @GetMapping("/profile")
    public String profilePage(HttpSession session, Model model) {
        // 세션에서 로그인된 사용자 정보 가져오기
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }
        
        try {
            Member member = memberService.findByUsername(username);
            model.addAttribute("member", member);
            return "mypage/profile";
        } catch (Exception e) {
            return "redirect:/mypage/login";
        }
    }
    
    @PostMapping("/register")
    public String registerMember(@Valid @ModelAttribute Member member, 
                                @RequestParam String confirmPassword,
                                RedirectAttributes redirectAttributes) {
        try {
            // 비밀번호 확인
            if (!member.getPassword().equals(confirmPassword)) {
                redirectAttributes.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
                return "redirect:/mypage/join";
            }
            
            memberService.registerMember(member);
            redirectAttributes.addFlashAttribute("message", "회원가입이 완료되었습니다.");
            return "redirect:/mypage/login";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/mypage/join";
        }
    }
    
    @PostMapping("/find-id")
    public String findId(@RequestParam String name,
                        @RequestParam String email,
                        RedirectAttributes redirectAttributes) {
        try {
            Member member = memberService.findByNameAndEmail(name, email);
            if (member != null) {
                redirectAttributes.addFlashAttribute("message", "아이디는 " + member.getUsername() + " 입니다.");
            } else {
                redirectAttributes.addFlashAttribute("error", "일치하는 정보가 없습니다.");
            }
            return "redirect:/mypage/find-id";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "아이디 찾기 중 오류가 발생했습니다.");
            return "redirect:/mypage/find-id";
        }
    }
    
    @PostMapping("/find-psw")
    public String findPassword(@RequestParam String username,
                              @RequestParam String name,
                              @RequestParam String email,
                              RedirectAttributes redirectAttributes) {
        try {
            Member member = memberService.findByUsername(username);
            if (member != null && member.getName().equals(name) && member.getEmail().equals(email)) {
                redirectAttributes.addFlashAttribute("message", "비밀번호는 " + member.getPassword() + " 입니다.");
            } else {
                redirectAttributes.addFlashAttribute("error", "일치하는 정보가 없습니다.");
            }   
            return "redirect:/mypage/find-psw";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "비밀번호 찾기 중 오류가 발생했습니다.");
            return "redirect:/mypage/find-psw";
        }
    }
    
    @GetMapping("/login")
    public String loginPage() {
        return "mypage/login";
    }
    
    @GetMapping("/find-id")
    public String findIdPage() {
        return "mypage/find-id";
    }
    
    @GetMapping("/find-psw")
    public String findPasswordPage() {
        return "mypage/find-psw";
    }
    
    @GetMapping("/join")
    public String joinPage() {
        return "mypage/join";
    }
    
    @PostMapping("/login")
    public String login(@RequestParam String username, 
                       @RequestParam String password,
                       HttpSession session,
                       RedirectAttributes redirectAttributes) {
        try {
            Member member = memberService.findByUsername(username);
            if (member != null && member.getPassword().equals(password)) {
                // 세션에 로그인 정보 저장
                session.setAttribute("username", username);
                session.setAttribute("memberId", member.getId());
                redirectAttributes.addFlashAttribute("message", "로그인되었습니다.");
                return "redirect:/mypage/profile";
            } else {
                redirectAttributes.addFlashAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
                return "redirect:/mypage/login";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "redirect:/mypage/login";
        }
    }
    
    @PostMapping("/update")
    public String updateMember(@ModelAttribute Member member,
                              @RequestParam(required = false) String newPassword,
                              @RequestParam(required = false) String confirmPassword,
                              HttpSession session,
                              RedirectAttributes redirectAttributes) {
        try {
            String username = (String) session.getAttribute("username");
            if (username == null) {
                return "redirect:/mypage/login";
            }
            
            Member existingMember = memberService.findByUsername(username);
            
            // 비밀번호 변경 처리
            if (newPassword != null && !newPassword.isEmpty()) {
                if (!newPassword.equals(confirmPassword)) {
                    redirectAttributes.addFlashAttribute("error", "새 비밀번호가 일치하지 않습니다.");
                    return "redirect:/mypage/profile";
                }
                existingMember.setPassword(newPassword);
            }
            
            // 다른 필드들 업데이트
            existingMember.setHospitalName(member.getHospitalName());
            existingMember.setDepartment(member.getDepartment());
            existingMember.setName(member.getName());
            existingMember.setPhone(member.getPhone());
            existingMember.setEmail(member.getEmail());
            existingMember.setRecommendedEmployee(member.getRecommendedEmployee());
            existingMember.setRecommendCode(member.getRecommendCode());
            
            memberService.updateMember(existingMember);
            redirectAttributes.addFlashAttribute("message", "정보가 성공적으로 수정되었습니다.");
            return "redirect:/mypage/profile";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "정보 수정 중 오류가 발생했습니다.");
            return "redirect:/mypage/profile";
        }
    }
    
    @GetMapping("/withdrawal")
    public String withdrawalPage(HttpSession session, Model model) {
        // 세션에서 로그인된 사용자 정보 가져오기
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }
        
        try {
            Member member = memberService.findByUsername(username);
            model.addAttribute("member", member);
            return "mypage/withdrawal";
        } catch (Exception e) {
            return "redirect:/mypage/login";
        }
    }
    
    @PostMapping("/check-password")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> checkPassword(@RequestParam String password,
                                                            HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            String username = (String) session.getAttribute("username");
            if (username == null) {
                response.put("success", false);
                response.put("message", "로그인이 필요합니다.");
                return ResponseEntity.ok(response);
            }
            
            Member member = memberService.findByUsername(username);
            if (member.getPassword().equals(password)) {
                response.put("success", true);
                response.put("message", "비밀번호가 일치합니다.");
            } else {
                response.put("success", false);
                response.put("message", "비밀번호가 일치하지 않습니다.");
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "오류가 발생했습니다.");
        }
        
        return ResponseEntity.ok(response);
    }
    
    @PostMapping("/withdrawal")
    public String withdrawal(@RequestParam String password,
                           HttpSession session,
                           RedirectAttributes redirectAttributes) {
        try {
            String username = (String) session.getAttribute("username");
            if (username == null) {
                return "redirect:/mypage/login";
            }
            
            Member member = memberService.findByUsername(username);
            if (member.getPassword().equals(password)) {
                // 회원 탈퇴 처리
                memberService.deleteMember(member.getId());
                session.invalidate();
                redirectAttributes.addFlashAttribute("message", "회원탈퇴가 정상적으로 이루어졌습니다.");
                return "redirect:/mypage/login";
            } else {
                redirectAttributes.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
                return "redirect:/mypage/withdrawal";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "탈퇴 처리 중 오류가 발생했습니다.");
            return "redirect:/mypage/withdrawal";
        }
    }
    
    @GetMapping("/logout")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> logout(HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            session.invalidate();
            response.put("success", true);
            response.put("message", "로그아웃 되었습니다");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "로그아웃 중 오류가 발생했습니다");
            return ResponseEntity.ok(response);
        }
    }
    
    @GetMapping("/downloads")
    public String downloadsPage(HttpSession session, Model model) {
        // 세션에서 로그인된 사용자 정보 가져오기
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }
        
        try {
            Member member = memberService.findByUsername(username);
            List<Request> completedRequests = requestService.getRequestsByMemberId(member.getId());
            // '완료' 상태의 의뢰만 필터링
            completedRequests = completedRequests.stream()
                .filter(r -> "완료".equals(r.getStatus()))
                .collect(Collectors.toList());
            
            // 날짜별, application_type별로 그룹화
            Map<String, List<Request>> groupedRequests = completedRequests.stream()
                .collect(Collectors.groupingBy(request -> {
                    String date = request.getCreatedAt().getYear() + "." + 
                                String.format("%02d", request.getCreatedAt().getMonthValue()) + "." + 
                                String.format("%02d", request.getCreatedAt().getDayOfMonth());
                    return date + "_" + request.getApplicationType();
                }));
            
            model.addAttribute("member", member);
            model.addAttribute("groupedRequests", groupedRequests);
            return "mypage/downloads";
        } catch (Exception e) {
            model.addAttribute("groupedRequests", new HashMap<>());
            return "mypage/downloads";
        }
    }

    @GetMapping("/cancelled-orders")
    public String cancelledOrdersPage(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/mypage/login";
        }

        try {
            Member member = memberService.findByUsername(username);
            List<Request> cancelledRequests = requestService.getCancelledRequestsByMemberId(member.getId());
            model.addAttribute("member", member);
            model.addAttribute("cancelledRequests", cancelledRequests);
            return "mypage/cancelled-orders";
        } catch (Exception e) {
            return "redirect:/mypage/login";
        }
    }
}
