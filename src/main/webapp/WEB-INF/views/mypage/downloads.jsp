<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp" />

 <!-- 자료실 페이지 -->
 <div id="download-page" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">자료실</div>
         <div class="breadcrumb">마이페이지 > 자료실 > 파일 다운로드</div>
     </div>

     <div class="card d-flex flex-column gap-0 gap-lg-3 flex-fill overflow-auto">
         <c:choose>
             <c:when test="${not empty groupedRequests}">
                 <c:forEach var="entry" items="${groupedRequests}">
                     <c:set var="groupKey" value="${entry.key}" />
                     <c:set var="requests" value="${entry.value}" />
                     <c:set var="firstRequest" value="${requests[0]}" />
                     <c:set var="datePart" value="${fn:substringBefore(groupKey, '_')}" />
                     <c:set var="appType" value="${fn:substringAfter(groupKey, '_')}" />
                     
                     <div class="card">
                         <div class="align-items-center d-flex flex-column flex-lg-row gap-2 gap-lg-0 justify-content-between mb-3 mb-lg-0">
                             <div class="title fw-bold">${datePart} <span class="text-danger fs-5">${appType}</span></div>
                             <div>
                                 <button type="button" class="btn btn-outline-secondary download-all" data-group="${groupKey}">
                                     <i class="bi bi-download text-warning"></i> <span class="fw-bold">전체 다운로드</span>
                                 </button>
                                 <button type="button" class="btn btn-outline-secondary download-selected" data-group="${groupKey}">
                                     <i class="bi bi-download text-warning"></i> <span class="fw-bold">선택 다운로드</span>
                                 </button>
                             </div>
                         </div>
                         <div class="d-none d-lg-block">
                             <table class="table table-bordered">
                                <colgroup>
                                    <col width="10%">
                                    <col width="15%">
                                    <col width="75%">
                                </colgroup>
                                 <thead>
                                     <tr>
                                         <th>
                                             <div class="form-check d-flex justify-content-center">
                                                 <input class="form-check-input group-checkbox" type="checkbox" value="" data-group="${groupKey}">
                                             </div>
                                         </th>
                                         <th>No.</th>
                                         <th>의뢰내용</th>
                                     </tr>
                                 </thead>
                                 <tbody class="">
                                     <c:forEach var="request" items="${requests}">
                                         <tr>
                                             <td>
                                                 <div class="form-check d-flex justify-content-center">
                                                     <input class="form-check-input request-checkbox" type="checkbox" value="${request.id}" data-group="${groupKey}">
                                                 </div>
                                             </td>
                                             <td>Project${request.id}</td>
                                             <td class="w-50">
                                                 <div class="request-details">${request.content}</div>
                                             </td>
                                         </tr>
                                     </c:forEach>
                                 </tbody>
                             </table>
                         </div>
                         <div class="d-block d-lg-none">
                             <c:forEach var="request" items="${requests}">
                                 <div class="d-flex flex-column gap-1 border-top border-bottom pb-1 pt-1">
                                     <div class="order-numb align-items-center d-flex gap-1">
                                         <input class="form-check-input request-checkbox" type="checkbox" value="${request.id}" data-group="${groupKey}">
                                         <div>No. Project${request.id}</div>
                                     </div>
                                     <div class="download-contents">${request.content}</div>
                                 </div>
                             </c:forEach>
                         </div>
                     </div>
                 </c:forEach>
             </c:when>
             <c:otherwise>
                 <div class="alert alert-info text-center" role="alert">
                     완료된 의뢰가 없습니다.
                 </div>
             </c:otherwise>
         </c:choose>
     </div>
 </div>

 <!-- 체크박스 전체선택 및 다운로드 기능 js -->
 <script>
     document.addEventListener('DOMContentLoaded', function() {
         // 그룹별 전체 선택 기능
         document.querySelectorAll('.group-checkbox').forEach(function(groupCheckbox) {
             const groupKey = groupCheckbox.dataset.group;
             const requestCheckboxes = document.querySelectorAll(`.request-checkbox[data-group="${groupKey}"]`);
             
             groupCheckbox.addEventListener('change', function() {
                 requestCheckboxes.forEach(checkbox => {
                     checkbox.checked = groupCheckbox.checked;
                 });
             });
         });
         
         // 개별 체크박스 변경 시 그룹 체크박스 상태 업데이트
         document.querySelectorAll('.request-checkbox').forEach(function(checkbox) {
             checkbox.addEventListener('change', function() {
                 const groupKey = this.dataset.group;
                 const groupCheckbox = document.querySelector(`.group-checkbox[data-group="${groupKey}"]`);
                 const requestCheckboxes = document.querySelectorAll(`.request-checkbox[data-group="${groupKey}"]`);
                 const checkedCheckboxes = document.querySelectorAll(`.request-checkbox[data-group="${groupKey}"]:checked`);
                 
                 groupCheckbox.checked = checkedCheckboxes.length === requestCheckboxes.length;
             });
         });
         
         // 전체 다운로드 기능
         document.querySelectorAll('.download-all').forEach(function(button) {
             button.addEventListener('click', function() {
                 const groupKey = this.dataset.group;
                 const requestCheckboxes = document.querySelectorAll(`.request-checkbox[data-group="${groupKey}"]`);
                 const requestIds = Array.from(requestCheckboxes).map(checkbox => checkbox.value);
                 
                 if (requestIds.length > 0) {
                     downloadFiles(requestIds);
                 } else {
                     alert('다운로드할 파일이 없습니다.');
                 }
             });
         });
         
         // 선택 다운로드 기능
         document.querySelectorAll('.download-selected').forEach(function(button) {
             button.addEventListener('click', function() {
                 const groupKey = this.dataset.group;
                 const checkedCheckboxes = document.querySelectorAll(`.request-checkbox[data-group="${groupKey}"]:checked`);
                 const requestIds = Array.from(checkedCheckboxes).map(checkbox => checkbox.value);
                 
                 if (requestIds.length > 0) {
                     downloadFiles(requestIds);
                 } else {
                     alert('다운로드할 파일을 선택해주세요.');
                 }
             });
         });
         
         // 파일 다운로드 함수
         function downloadFiles(requestIds) {
             // POST 요청을 보내기 위한 폼 생성
             const form = document.createElement('form');
             form.method = 'POST';
             form.action = '/mypage/download-files';
             
             // requestIds를 hidden input으로 추가
             requestIds.forEach(function(id) {
                 const hiddenInput = document.createElement('input');
                 hiddenInput.type = 'hidden';
                 hiddenInput.name = 'requestIds';
                 hiddenInput.value = id;
                 form.appendChild(hiddenInput);
             });
             
             document.body.appendChild(form);
             form.submit();
             document.body.removeChild(form);
         }
     });
 </script>

 <jsp:include page="footer.jsp" />