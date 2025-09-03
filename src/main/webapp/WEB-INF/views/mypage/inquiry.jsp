<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

 <!-- 문의하기 페이지 -->
 <div id="inquiry-page" class="page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">1:1 문의</div>
         <div class="breadcrumb">마이페이지 > 1:1 문의 > 문의하기</div>
     </div>

     <div class="card flex-fill overflow-auto">
         <!-- Flash 메시지 표시 -->
         <c:if test="${not empty error}">
             <div class="alert alert-danger alert-dismissible fade show" role="alert">
                 ${error}
                 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
             </div>
         </c:if>
         
         <form id="inquiryForm" action="/mypage/inquiry" method="post" enctype="multipart/form-data">
             
             <p>안녕하세요, 고객님.</p>
             <p>아래에서 궁금하신 <strong>버튼을 선택하고</strong>, 입력창에 문의내용을 작성해주세요.</p>

             <div class="bg-body-tertiary p-3">
                 <div class="form-group mb-3">
                     <label class="form-label required">문의유형</label>
                     <div class="select-buttons" style="margin: 0;">
                         <button type="button" class="select-btn" data-type="기능문의">기능문의</button>
                         <button type="button" class="select-btn" data-type="의뢰절차 문의">의뢰절차 문의</button>
                         <button type="button" class="select-btn" data-type="가격문의">가격문의</button>
                         <button type="button" class="select-btn" data-type="단순문의">단순문의</button>
                     </div>
                     <small class="text-muted">* 문의유형을 반드시 선택해주세요.</small>
                     <div id="selectedTypeDisplay" style="margin-top: 10px; padding: 5px; background-color: #f8f9fa; border-radius: 4px; display: none;">
                         <strong>선택된 문의유형:</strong> <span id="selectedTypeText"></span>
                     </div>
                 </div>
                 
                 <input type="hidden" name="inquiryType" id="selectedInquiryType" value="">

                 <div class="form-group mb-3">
                     <label class="form-label required">문의내용</label>
                     <textarea name="content" class="form-input" rows="8" placeholder="문의하실 내용을 자세히 작성해주세요." required></textarea>
                 </div>

                 <div class="form-group">
                     <label class="form-label">첨부파일 등록</label>
                     <div id="dropArea" class="drop-area form-control d-flex flex-column align-items-center justify-content-center p-4 border rounded" style="height: 150px; cursor: pointer;">
                         <i class="bi bi-cloud-arrow-up-fill fs-3 text-muted"></i>
                         <p class="text-muted">파일을 여기로 드래그하거나 클릭하여 선택하세요.</p>
                         <input class="form-control d-none" type="file" id="formFile" name="file">
                         <div id="fileList" class="file-list mt-2"></div>
                     </div>
                 </div>
             </div>

             <div class="button-group justify-content-end mt-3">
                 <button type="button" class="btn btn-dark text-white" id="submitBtn">문의하기</button>
             </div>
         </form>
     </div>
 </div>

 <script>
 // DOM이 로드된 후 실행 (window.onload 사용)
 window.onload = function() {
     console.log('페이지 로드 완료 - inquiry.jsp');
     
     // 문의유형 버튼들에 이벤트 리스너 추가
     var selectButtons = document.querySelectorAll('.select-btn');
     selectButtons.forEach(function(button) {
         button.addEventListener('click', function() {
             var type = this.getAttribute('data-type');
             console.log('버튼 클릭됨:', type);
             updateInquiryType(this, type);
         });
     });
     
     // 문의하기 버튼 클릭 이벤트 추가
     var submitBtn = document.getElementById('submitBtn');
     if (submitBtn) {
         submitBtn.addEventListener('click', function(e) {
             console.log('문의하기 버튼 클릭됨');
             
             // 유효성 검사
             var inquiryType = document.getElementById('selectedInquiryType').value;
             var content = document.querySelector('textarea[name="content"]').value.trim();
             var fileInput = document.getElementById('formFile');
             
             console.log('검증 - inquiryType:', inquiryType);
             console.log('검증 - content:', content);
             console.log('검증 - fileInput.files.length:', fileInput.files.length);
             
             if (!inquiryType || inquiryType.trim() === '') {
                 alert('문의유형을 선택해주세요.');
                 console.log('문의유형 미선택으로 제출 중단');
                 return;
             }
             
             if (!content) {
                 alert('문의내용을 입력해주세요.');
                 console.log('문의내용 미입력으로 제출 중단');
                 return;
             }
             
             console.log('유효성 검사 통과 - 폼 제출 진행');
             
             // 폼 제출
             var form = document.getElementById('inquiryForm');
             if (form) {
                 form.submit();
             } else {
                 console.error('inquiryForm 요소를 찾을 수 없습니다.');
             }
         });
     }

     // 드래그 앤 드롭 기능
     var dropArea = document.getElementById('dropArea');
     var fileInput = document.getElementById('formFile');
     var fileList = document.getElementById('fileList');

     // 드롭 영역 클릭 시 파일 입력 열기
     dropArea.addEventListener('click', function() {
         fileInput.click();
     });

     // 파일 입력 변경 시 파일 목록 업데이트
     fileInput.addEventListener('change', function() {
         handleFiles(this.files);
     });

     // 드래그 앤 드롭 이벤트
     ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
         dropArea.addEventListener(eventName, preventDefaults, false);
         document.body.addEventListener(eventName, preventDefaults, false); // 전체 페이지 기본 동작 방지
     });

     ['dragenter', 'dragover'].forEach(eventName => {
         dropArea.addEventListener(eventName, highlight, false);
     });

     ['dragleave', 'drop'].forEach(eventName => {
         dropArea.addEventListener(eventName, unhighlight, false);
     });

     dropArea.addEventListener('drop', handleDrop, false);

     function preventDefaults (e) {
         e.preventDefault();
         e.stopPropagation();
     }

     function highlight(e) {
         dropArea.classList.add('dragover');
     }

     function unhighlight(e) {
         dropArea.classList.remove('dragover');
     }

     function handleDrop(e) {
         var dt = e.dataTransfer;
         var files = dt.files;
         
         fileInput.files = files; // 드롭된 파일을 input 요소에 할당
         handleFiles(files);
     }

     function handleFiles(files) {
         fileList.innerHTML = ''; // 기존 목록 초기화
         if (files.length > 0) {
             for (var i = 0; i < files.length; i++) {
                 var fileItem = document.createElement('div');
                 fileItem.textContent = files[i].name;
                 fileList.appendChild(fileItem);
             }
         } else {
             fileList.textContent = '선택된 파일 없음';
         }
     }
 };
 
 // 문의유형 업데이트 함수 (기존 코드 유지)
 function updateInquiryType(button, type) {
     console.log('updateInquiryType 함수 호출됨:', type);
     
     try {
         document.querySelectorAll('.select-btn').forEach(function(btn) {
             btn.classList.remove('active');
         });
         
         button.classList.add('active');
         
         var hiddenInput = document.getElementById('selectedInquiryType');
         if (hiddenInput) {
             hiddenInput.value = type;
             console.log('hidden input에 설정된 값:', hiddenInput.value);
         } else {
             console.error('selectedInquiryType (hidden input) 요소를 찾을 수 없습니다.');
         }
         
         var displayElement = document.getElementById('selectedTypeDisplay');
         var textElement = document.getElementById('selectedTypeText');
         if (displayElement && textElement) {
             textElement.textContent = type;
             displayElement.style.display = 'block';
             console.log('시각적 표시 업데이트 완료');
         } else {
             console.error('selectedTypeDisplay 또는 selectedTypeText 요소를 찾을 수 없습니다.');
         }
         
         console.log('문의유형 선택 완료:', type);
         
     } catch (error) {
         console.error('updateInquiryType 함수 오류:', error);
     }
 }
 </script>

 <jsp:include page="footer.jsp" />