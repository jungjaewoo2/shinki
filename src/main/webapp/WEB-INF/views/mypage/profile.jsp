<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<!-- 개인정보확인/수정 페이지 -->
<div id="profile-page" class="page d-flex flex-column h-100">
    <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
        <div class="page-title">개인정보확인/수정</div>
        <div class="breadcrumb">마이페이지 > MY 정보 > 개인정보확인/수정</div>
    </div>

    <div class="card flex-fill overflow-auto">
        <!-- 메시지 표시 -->
        <c:if test="${not empty message}">
            <div class="alert alert-success text-center mx-3 mt-3" role="alert">
                ${message}
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center mx-3 mt-3" role="alert">
                ${error}
            </div>
        </c:if>
        
        <form action="/mypage/update" method="post">
            <div class="form-group">
                <label class="form-label required">병원</label>
                <input type="text" name="hospitalName" class="form-input" value="${member.hospitalName}" placeholder="병원명을 입력하세요" required>
            </div>

            <div class="form-group">
                <label class="form-label required">진료과</label>
                <input type="text" name="department" class="form-input" value="${member.department}" placeholder="진료과를 입력하세요" required>
            </div>

            <div class="form-group">
                <label class="form-label required">이름</label>
                <input type="text" name="name" class="form-input" value="${member.name}" placeholder="이름을 입력하세요" required>
            </div>

            <div class="form-group">
                <label class="form-label required">아이디</label>
                <input type="text" name="username" class="form-input" value="${member.username}" placeholder="아이디를 입력하세요" required readonly>
            </div>

            <div class="form-group">
                <label class="form-label">비밀번호 변경</label>
                <input type="password" name="newPassword" class="form-input" placeholder="새 비밀번호를 입력하세요">
            </div>

            <div class="form-group">
                <label class="form-label">비밀번호 확인</label>
                <input type="password" name="confirmPassword" class="form-input" placeholder="새 비밀번호를 다시 입력하세요">
            </div>

            <div class="form-group">
                <label class="form-label required">연락처</label>
                <input type="text" name="phone" class="form-input" value="${member.phone}" placeholder="010-0000-0000" required>
            </div>

            <div class="form-group">
                <label class="form-label">이메일</label>
                <input type="email" name="email" class="form-input" value="${member.email}" placeholder="email@example.com">
            </div>

            <div class="form-group">
                <label class="form-label">추천직원</label>
                <input type="text" name="recommendedEmployee" class="form-input" value="${member.recommendedEmployee}" placeholder="추천직원명">
            </div>

            <div class="form-group">
                <label class="form-label">추천코드</label>
                <input type="text" name="recommendCode" class="form-input" value="${member.recommendCode}" placeholder="추천코드를 입력하세요">
            </div>

            <div class="button-group justify-content-center">
                <button type="submit" class="btn btn-dark">정보 수정</button>
            </div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp" />