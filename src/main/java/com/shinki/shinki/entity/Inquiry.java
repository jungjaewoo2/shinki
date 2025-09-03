package com.shinki.shinki.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import java.util.Date; // LocalDateTime 대신 java.util.Date 사용

@Entity
@Table(name = "inquiry")
public class Inquiry {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;
    
    @NotBlank(message = "문의유형은 필수입니다.")
    @Column(name = "inquiry_type", nullable = false)
    private String inquiryType; // 기능문의, 의뢰절차 문의, 가격문의, 단순문의
    
    @NotBlank(message = "문의내용은 필수입니다.")
    @Column(name = "content", nullable = false, columnDefinition = "TEXT")
    private String content;
    
    @Column(name = "file_path")
    private String filePath;
    
    @Column(name = "status", nullable = false, length = 20)
    private String status = "진행중"; // 진행중, 완료
    
    @Column(name = "admin_reply", columnDefinition = "TEXT")
    private String adminReply;
    
    @Column(name = "reply_date")
    private Date replyDate; // LocalDateTime 대신 Date 사용
    
    @Column(name = "created_at")
    private Date createdAt; // LocalDateTime 대신 Date 사용
    
    @Column(name = "updated_at")
    private Date updatedAt; // LocalDateTime 대신 Date 사용
    
    // 기본 생성자
    public Inquiry() {}
    
    // 전체 생성자
    public Inquiry(Long id, Member member, String inquiryType, String content, String filePath, 
                   String status, String adminReply, Date replyDate, 
                   Date createdAt, Date updatedAt) {
        this.id = id;
        this.member = member;
        this.inquiryType = inquiryType;
        this.content = content;
        this.filePath = filePath;
        this.status = status;
        this.adminReply = adminReply;
        this.replyDate = replyDate;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
    
    // Getter와 Setter
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public Member getMember() { return member; }
    public void setMember(Member member) { this.member = member; }
    
    public String getInquiryType() { return inquiryType; }
    public void setInquiryType(String inquiryType) { this.inquiryType = inquiryType; }
    
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    
    public String getFilePath() { return filePath; }
    public void setFilePath(String filePath) { this.filePath = filePath; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public String getAdminReply() { return adminReply; }
    public void setAdminReply(String adminReply) { this.adminReply = adminReply; }
    
    public Date getReplyDate() { return replyDate; }
    public void setReplyDate(Date replyDate) { this.replyDate = replyDate; }
    
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    
    @PrePersist
    protected void onCreate() {
        createdAt = new Date(); // 현재 날짜로 설정
        updatedAt = new Date(); // 현재 날짜로 설정
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = new Date(); // 현재 날짜로 설정
    }
}
