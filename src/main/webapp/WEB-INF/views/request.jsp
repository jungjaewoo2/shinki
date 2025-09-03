<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />


<!-- Request Page -->
<section id="request" class="page-section">
    <div class="dynamic-backdrop">
        <div class="gradient-glow"></div>
    </div>

    <div class="container">
        <span class="pill">Request</span>
        <h2 style="font-size: 2rem; margin-top: 0.75rem;">도입 상담 및 견적 요청</h2>

        <div class="form-grid">
            <div style="color: rgba(255,255,255,0.75); font-size: 0.875rem;">
                <p style="margin-bottom: 1rem;">프로덕트 데모, 도입 환경(온프레미스/클라우드), HW 스펙, 라이선스 구성 등 원하는 정보를 알려주시면 맞춤 견적을 드립니다.</p>
                <ul style="list-style: none; padding: 0;">
                    <li style="display: flex; align-items: center; gap: 0.5rem; margin-bottom: 0.5rem;">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M12 2L2 7v10c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V7l-10-5z" />
                        </svg>
                        의료 데이터 보안 및 컴플라이언스 고려
                    </li>
                    <li style="display: flex; align-items: center; gap: 0.5rem;">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="3" width="18" height="18" rx="2" ry="2" />
                            <line x1="9" y1="9" x2="15" y2="9" />
                            <line x1="9" y1="15" x2="15" y2="15" />
                        </svg>
                        PACS/EMR 연동 컨설팅 지원
                    </li>
                </ul>
            </div>

            <form class="form-container">
                <input type="text" class="form-input" placeholder="성함">
                <input type="email" class="form-input" placeholder="이메일">
                <input type="text" class="form-input" placeholder="기관명(병원/기업)">
                <textarea class="form-textarea" placeholder="요청 사항(환경, 수량, 납기 등)"></textarea>
                <button class="btn-primary" style="width: 100%;">제출하기</button>
            </form>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp" />