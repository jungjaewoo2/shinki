<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<!-- Contact Page -->
<section id="contact" class="page-section">
    <div class="dynamic-backdrop">
        <div class="gradient-glow"></div>
    </div>

    <div class="container">
        <span class="pill">Contact</span>
        <h2 style="font-size: 2rem; margin-top: 0.75rem;">연락처 및 위치</h2>

        <div class="form-grid">
            <div class="form-container">
                <h4 style="margin-bottom: 0.75rem;">문의 채널</h4>
                <p style="color: rgba(255,255,255,0.75); font-size: 0.875rem;">
                    E: contact@shinkisa.com<br>
                    T: +82-2-0000-0000
                </p>
                <div style="margin-top: 1rem; height: 224px; background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1); border-radius: 0.75rem; display: grid; place-items: center; color: rgba(255,255,255,0.5); font-size: 0.875rem;">
                    지도(임시)
                </div>
            </div>

            <form class="form-container">
                <input type="text" class="form-input" placeholder="성함">
                <input type="email" class="form-input" placeholder="이메일">
                <textarea class="form-textarea" placeholder="메시지" style="min-height: 150px;"></textarea>
                <button class="btn-primary" style="width: 100%;">보내기</button>
            </form>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp" />