package com.shinki.shinki.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
    
    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("message", "Hello from Spring Boot JSP!");
        return "index";
    }
    
    @GetMapping("/mypage")
    public String mypage() {
        return "mypage/profile";
    }
    
    @GetMapping("/test")
    public String test(Model model) {
        model.addAttribute("testMessage", "JSP Test Page");
        return "test";
    }
}
