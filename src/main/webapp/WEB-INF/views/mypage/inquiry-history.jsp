<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />

 <!-- 문의내역조회 페이지 -->
 <div id="inquiry-history-page" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">문의내역조회</div>
         <div class="breadcrumb">마이페이지 > 1:1 문의 > 문의내역조회</div>
     </div>

     <div class="card flex-fill overflow-auto">
         <!-- Flash 메시지 표시 -->
         <c:if test="${not empty message}">
             <div class="alert alert-success alert-dismissible fade show" role="alert">
                 <c:out value="${message}"/>
                 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
             </div>
         </c:if>
         <c:if test="${not empty error}">
             <div class="alert alert-danger alert-dismissible fade show" role="alert">
                 <c:out value="${error}"/>
                 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
             </div>
         </c:if>
         
         <div class="card-body">
            <c:if test="${not empty inquiries}">
                <table class="table table-bordered">
                    <thead class="table-light">
                        <tr>
                            <th>No.</th>
                            <th>문의유형</th>
                            <th>문의내용</th>
                            <th>작성일</th>
                            <th>상담상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="inquiry" items="${inquiries}">
                            <tr>
                                <td><c:out value="${inquiry.id}"/></td>
                                <td><c:out value="${inquiry.inquiryType}"/></td>
                                <td><c:out value="${inquiry.content}"/></td>
                                <td>
                                    <c:if test="${not empty inquiry.createdAt}">
                                        <fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
                                    </c:if>
                                </td>
                                <td>
                                    <span class="badge ${inquiry.status eq '진행중' ? 'bg-warning' : 'bg-success'}">
                                        <c:out value="${inquiry.status}"/>
                                    </span>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            
            <c:if test="${empty inquiries}">
                <div class="alert alert-info text-center mt-3" role="alert">
                    등록된 문의 내역이 없습니다.
                </div>
            </c:if>
         </div>
     </div>
 </div>

<jsp:include page="footer.jsp" />