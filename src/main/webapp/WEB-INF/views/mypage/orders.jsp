<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />

 <!-- 주문내역 페이지 -->
 <div id="orders-page" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
        <div class="page-title">의뢰 목록 /  현황</div>
        <div class="breadcrumb">마이페이지 > 의뢰 내역 > 의뢰 목록</div>
    </div>

     <div class="card d-flex flex-fill flex-column gap-3 overflow-auto">
         <div class="align-items-center d-flex justify-content-between flex-column flex-lg-row gap-3 gap-lg-0 mb-3">
             <div class="form-group flex-fill flex-row m-0">
                 <label class="form-label">의뢰일자</label>
                 <form method="GET" action="/mypage/orders" class="d-flex gap-2 align-items-center">
                     <input type="date" name="searchDate" class="form-input" style="max-width: 200px;" value="${param.searchDate}">
                     <button type="submit" class="btn btn-primary" style="padding: 8px 20px; font-size: 14px; min-width: 70px;">검색</button>
                     <a href="/mypage/orders" class="btn btn-secondary" style="padding: 8px 20px; font-size: 14px; min-width: 100px;">전체보기</a>
                 </form>
             </div>

             <div class="d-flex flex-fill justify-content-end gap-1">
                 <div class="progress-count align-items-center d-flex flex-column bg-body-tertiary">
                     <div class="fs-4 text-primary fw-bold">
                         <c:set var="inProgressCount" value="0" />
                         <c:forEach var="request" items="${requests}">
                             <c:if test="${request.status != '작업 완료' && request.status != '취소 진행중' && request.status != '취소 완료'}">
                                 <c:set var="inProgressCount" value="${inProgressCount + 1}" />
                             </c:if>
                         </c:forEach>
                         ${inProgressCount}
                     </div>
                     <div>진행중인 의뢰</div>
                 </div>
                 <div class="border-end"></div>
                 <div class="progress-count align-items-center d-flex flex-column bg-body-tertiary">
                     <div class="fs-4 text-primary fw-bold">
                         <c:set var="completedCount" value="0" />
                         <c:forEach var="request" items="${requests}">
                             <c:if test="${request.status == '작업 완료'}">
                                 <c:set var="completedCount" value="${completedCount + 1}" />
                             </c:if>
                         </c:forEach>
                         ${completedCount}
                     </div>
                     <div>처리완료</div>
                 </div>
             </div>
         </div>

         <c:choose>
             <c:when test="${empty requests}">
                 <div class="card">
                     <div class="card-body text-center py-5">
                         <c:choose>
                             <c:when test="${not empty param.searchDate}">
                                 <div class="text-muted">${param.searchDate}에 등록된 의뢰가 없습니다.</div>
                             </c:when>
                             <c:otherwise>
                                 <div class="text-muted">등록된 의뢰가 없습니다.</div>
                             </c:otherwise>
                         </c:choose>
                     </div>
                 </div>
             </c:when>
             <c:otherwise>
                 <c:forEach var="request" items="${requests}">
             <div class="card">
                 <div class="card-header">
                     <div class="d-flex flex-fill flex-column flex-lg-row justify-content-between">
                         <div>
                             <div style="font-weight: bold;">
                                 <c:if test="${not empty request.createdAt}">
                                     ${request.createdAt.year}.<fmt:formatNumber value="${request.createdAt.monthValue}" pattern="00"/>.<fmt:formatNumber value="${request.createdAt.dayOfMonth}" pattern="00"/> 의뢰
                                 </c:if>
                             </div>
                         </div>
                         <div>
                             <a href="/mypage/order-detail/${request.id}" class="btn-link">주문현황 상세보기 <i class="bi bi-arrow-right-square"></i></a>
                         </div>
                     </div>
                 </div>
                 <div class="d-flex justify-content-between align-items-lg-center flex-column flex-lg-row gap-3">
                     <div class="order-type text-center bg-body-secondary rounded" style="color: #666;">
                         <div class="">
                             <c:choose>
                                 <c:when test="${request.applicationType == 'HBP'}">
                                     <img src="../assets/images/app-btn1.png">
                                 </c:when>
                                 <c:when test="${request.applicationType == 'LUNG'}">
                                     <img src="../assets/images/app-btn2.png">
                                 </c:when>
                                 <c:when test="${request.applicationType == 'CARDIAC'}">
                                     <img src="../assets/images/app-btn3.png">
                                 </c:when>
                                 <c:when test="${request.applicationType == 'KNEE'}">
                                     <img src="../assets/images/app-btn4.png">
                                 </c:when>
                             </c:choose>
                         </div>
                         <div>${request.applicationType}</div>
                     </div>
                     <div class="flex-fill align-items-center d-flex">${request.title}</div>
                    
                    <div class="d-flex flex-column gap-1">
                     <c:choose>
                         <c:when test="${request.status == '취소 진행중' || request.status == '취소 완료'}">
                             <div class="status-badge status-cancelled align-items-center d-flex">
                                 <span class="">
                                     <c:choose>
                                         <c:when test="${request.status == '의뢰 확인중' || request.status == '견적중' || request.status == '결제 진행'}">의뢰 확인중</c:when>
                                         <c:otherwise>${request.status}</c:otherwise>
                                     </c:choose>
                                 </span>
                             </div>
                         </c:when>
                         <c:otherwise>
                             <div class="status-badge status-progress align-items-center d-flex">
                                 <span class="">
                                     <c:choose>
                                         <c:when test="${request.status == '의뢰 확인중' || request.status == '견적중' || request.status == '결제 진행'}">의뢰 확인중</c:when>
                                         <c:otherwise>${request.status}</c:otherwise>
                                     </c:choose>
                                 </span>
                             </div>
                         </c:otherwise>
                     </c:choose>
                     
                     <c:if test="${request.status != '작업 완료' && request.status != '취소 진행중' && request.status != '취소 완료'}">
                         <div class="status-outline-badge">
                             <a href="/mypage/cancel-request/${request.id}" class="text-decoration-none">
                                 <span class="">취소요청</span>
                             </a>
                         </div>
                     </c:if>
                    </div>



                 </div>
             </div>
                 </c:forEach>
             </c:otherwise>
         </c:choose>

     </div>
 </div>

 <jsp:include page="footer.jsp" />