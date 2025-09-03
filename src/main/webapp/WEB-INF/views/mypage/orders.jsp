<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

 <!-- 주문내역 페이지 -->
 <div id="orders-page" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
        <div class="page-title">최근주문내역</div>
        <div class="breadcrumb">마이페이지 > 주문내역 > 주문목록 / 현황 > 주문목록</div>
    </div>

     <div class="card d-flex flex-fill flex-column gap-3 overflow-auto">
         <div class="align-items-center d-flex justify-content-between flex-column flex-lg-row gap-3 gap-lg-0 mb-3">
             <div class="form-group flex-fill flex-row m-0">
                 <label class="form-label">주문일자</label>
                 <input type="date" class="form-input" style="max-width: 200px;">
             </div>

             <div class="d-flex flex-fill justify-content-end gap-1">
                 <div class="progress-count align-items-center d-flex flex-column bg-body-tertiary">
                     <div class="fs-4 text-primary fw-bold">${inProgressCount}</div>
                     <div>진행중인 주문</div>
                 </div>
                 <div class="border-end"></div>
                 <div class="progress-count align-items-center d-flex flex-column bg-body-tertiary">
                     <div class="fs-4 text-primary fw-bold">${completedCount}</div>
                     <div>처리완료</div>
                 </div>
             </div>
         </div>

         <c:forEach var="request" items="${requests}">
             <div class="card">
                 <div class="card-header">
                     <div class="d-flex flex-fill flex-column flex-lg-row justify-content-between">
                         <div>
                             <div style="font-weight: bold;">${request.createdAt} 주문</div>
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
                     <div class="status-badge align-items-center d-flex">
                         <span class="">${request.status}</span>
                     </div>
                 </div>
             </div>
         </c:forEach>

     </div>
 </div>

 <jsp:include page="footer.jsp" />