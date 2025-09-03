<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />


<!-- Login Page -->
<section id="login" class="page-section">
    <div class="dynamic-backdrop">
        <div class="gradient-glow"></div>
    </div>

    <div class="container">
        <div style="max-width: 28rem; margin: 0 auto;">
            <div class="form-container">
                <div style="text-align: center; margin-bottom: 1.5rem;">
                    <h2 style="font-size: 1.5rem;">로그인</h2>
                    <p style="color: rgba(255,255,255,0.7); font-size: 0.875rem; margin-top: 0.25rem;">파트너/고객 포털 접속</p>
                </div>

                <div style="position: relative;">
                    <svg style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%); width: 16px; height: 16px; color: rgba(255,255,255,0.6);" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="11" width="18" height="10" rx="2" ry="2" />
                        <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                    </svg>
                    <input type="email" class="form-input" placeholder="이메일" style="padding-left: 2.5rem;">
                </div>

                <div style="position: relative;">
                    <svg style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%); width: 16px; height: 16px; color: rgba(255,255,255,0.6);" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="11" width="18" height="10" rx="2" ry="2" />
                        <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                    </svg>
                    <input type="password" class="form-input" placeholder="비밀번호" style="padding-left: 2.5rem;">
                </div>

                <button class="btn-primary" style="width: 100%; margin-top: 0.5rem;">로그인</button>
            </div>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp" />