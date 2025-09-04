<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<!-- 취소 요청 처리 페이지 -->
<div id="cancel-request-page" class="page d-flex flex-column h-100">
    <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
        <div class="page-title">취소 요청 처리</div>
        <div class="breadcrumb">마이페이지 > 의뢰 내역 > 취소 요청</div>
    </div>

    <div class="card d-flex flex-fill flex-column gap-3 overflow-auto">
        <div class="text-center p-5">
            <div class="spinner-border text-primary mb-3" role="status">
                <span class="visually-hidden">처리중...</span>
            </div>
            <h4>취소 요청을 처리하고 있습니다...</h4>
            <p class="text-muted">잠시만 기다려주세요.</p>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // URL에서 request ID를 가져옴
    const pathSegments = window.location.pathname.split('/');
    const requestId = pathSegments[pathSegments.length - 1];
    
    // 취소 요청 처리
    fetch('/mypage/cancel-request/' + requestId, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        }
    })
    .then(response => {
        if (response.ok) {
            // 성공 시 orders.jsp로 리다이렉트
            window.location.href = '/mypage/orders';
        } else {
            // 실패 시 에러 메시지 표시 후 orders.jsp로 리다이렉트
            alert('취소 요청 처리 중 오류가 발생했습니다.');
            window.location.href = '/mypage/orders';
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('취소 요청 처리 중 오류가 발생했습니다.');
        window.location.href = '/mypage/orders';
    });
});
</script>

<jsp:include page="footer.jsp" />
