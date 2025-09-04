<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

 <!-- 주문내역 페이지 -->
 <div id="orders-page" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
        <div class="page-title">취소주문내역</div>
        <div class="breadcrumb">마이페이지 > 주문내역 > 취소주문내역</div>
    </div>

     <div class="card d-flex flex-column gap-3 flex-fill overflow-auto">
         <c:choose>
             <c:when test="${not empty cancelledRequests}">
                 <c:forEach var="request" items="${cancelledRequests}">
                     <div class="card">
                         <div class="card-header">
                             <div class="d-flex flex-fill flex-column flex-lg-row justify-content-between">
                                 <div>
                                     <div style="font-weight: bold;">
                                         ${request.createdAt.year}.<fmt:formatNumber value="${request.createdAt.monthValue}" pattern="00"/>.<fmt:formatNumber value="${request.createdAt.dayOfMonth}" pattern="00"/> 주문취소
                                     </div>
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
                             <div class="status-badge status-cancelled align-items-center d-flex">
                                 <span class="">${request.status}</span>
                             </div>
                         </div>
                     </div>
                 </c:forEach>
             </c:when>
             <c:otherwise>
                 <div class="alert alert-info text-center" role="alert">
                     취소된 주문 내역이 없습니다.
                 </div>
             </c:otherwise>
         </c:choose>
     </div>
 </div>

 <jsp:include page="footer.jsp" />