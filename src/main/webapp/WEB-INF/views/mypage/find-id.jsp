<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
<style>
    .main-content {
        border-radius: 0.375rem;
    }

    .sidebar,
    .hamburger-btn {
        display: none;
    }

    @media (max-width: 1024px) {

        .navbar {
            padding: 0;
        }
    }

</style>

<!-- 로그인 페이지 -->
<div id="login-page" class="page d-flex flex-column h-100">


    <div class="card flex-fill h-100">
        <div class="page-title text-center m-5">아이디 찾기</div>
        
        <!-- 메시지 표시 -->
        <c:if test="${not empty message}">
            <div class="alert alert-success text-center mx-3" role="alert">
                ${message}
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center mx-3" role="alert">
                ${error}
            </div>
        </c:if>
        <div class="row">
            <div class="col-12 col-lg-3 m-auto">
                <form action="/mypage/find-id" method="post">
                    <div class="form-group align-items-baseline flex-column">
                        <label class="form-label">이름</label>
                        <input type="text" name="name" class="form-input" placeholder="이름을 입력하세요" required>
                    </div>

                    <div class="form-group align-items-baseline flex-column">
                        <label class="form-label">이메일</label>
                        <input type="email" name="email" class="form-input" placeholder="이메일을 입력하세요" required>
                    </div>

                    <div class="button-group">
                        <button type="submit" class="btn btn-light-green" style="flex: 1;">아이디 찾기</button>
                    </div>
                </form>
                
                <div class="text-center" style="margin-top: 20px;">
                    <a href="/mypage/login" class="btn-link">로그인으로 돌아가기</a>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="footer.jsp" />