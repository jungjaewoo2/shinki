<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<!-- 탈퇴하기 페이지 -->
<div id="withdrawal-page" class="page d-flex flex-column h-100">
    <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
        <div class="page-title">탈퇴하기</div>
        <div class="breadcrumb">마이페이지 > MY 정보 > 탈퇴하기</div>
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
        
        <div>
            <div class="d-flex flex-column gap-2">
                <div class="border-bottom fw-bold text-dark">회원 탈퇴 약정</div>
                <div class="d-flex flex-column gap-4">
                    <div>[ SYNAPSE 3D 계정 탈퇴 전 꼭 확인해주세요 ]</div>
                    <div>안녕하세요, SYNAPSE 3D입니다. 서비스를 이용해주셔서 진심으로 감사드립니다.<br>
                        회원 탈퇴를 진행하시기 전 아래 내용을 꼭 확인해 주세요.</div>
                    <div class="border-top pt-3 text-black-50">
                        1. 진행 중인 캠페인이 있으신가요?<br>
                        - 현재 모집 중이거나 리뷰어 선정이 완료된 캠페인이 있는 경우, 캠페인 운영이 중단될 수 있어 탈퇴 전 마무리 절차가 필요합니다.
                    </div>
                    <div class="border-bottom pb-3 text-black-50">
                        2. 운영 내역은 삭제됩니다.<br>
                        - 탈퇴가 완료되면 캠페인 운영 이력, 결제 정보 등은 복구가 불가능하며, 신규 가입 시에도 이전 기록은 승계되지 않습니다.<br>
                        - <strong class="text-danger">의뢰내역과 문의사항이 모두 삭제됩니다.</strong>
                    </div>
                    <div>
                        SYNAPSE 3D은 언제나 고객님의 성장을 응원합니다.<br>탈퇴 후에도 언제든 다시 찾아주시면, 진심을 다해 함께하겠습니다.
                    </div>
                </div>
            </div>

            <div class="button-group justify-content-center d-flex flex-column">
                <div class="text-danger">회원 탈퇴를 위해 비밀번호를 한번 더 입력해 주세요.*</div>
                <form id="withdrawalForm" action="/mypage/withdrawal" method="post">
                    <div class="d-flex">
                        <div class="form-group flex-fill">
                            <input type="password" id="password" name="password" class="form-input" placeholder="비밀번호를 입력하세요" required>
                        </div>
                        <div class="col-3 col-md-2 col-lg-1 d-grid ms-2">
                            <button type="button" class="btn btn-dark" onclick="confirmWithdrawal()">탈퇴</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
function confirmWithdrawal() {
    const password = document.getElementById('password').value;
    
    if (!password) {
        alert('비밀번호를 입력해주세요.');
        return;
    }
    
    // 비밀번호 확인을 위한 AJAX 요청
    fetch('/mypage/check-password', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'password=' + encodeURIComponent(password)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // 비밀번호가 맞으면 확인 알림창 표시
            if (confirm('회원 탈퇴 시 의뢰내역과 문의사항이 모두 삭제됩니다.\n정말 탈퇴하시겠습니까?')) {
                // 확인 버튼 클릭 시 탈퇴 처리
                document.getElementById('withdrawalForm').submit();
            }
        } else {
            alert('비밀번호가 일치하지 않습니다.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('오류가 발생했습니다.');
    });
}
</script>

<jsp:include page="footer.jsp" />