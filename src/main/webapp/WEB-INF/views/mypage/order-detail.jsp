<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />

 <!-- 주문내역 페이지 -->
 <div id="orders-page" class="order-detail page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">의뢰 현황</div>
         <div class="breadcrumb">마이페이지 > 의뢰 내역 > 의뢰 목록 / 현황</div>
     </div>

     <div class="card d-flex flex-fill flex-column gap-3 overflow-auto">
         <div class="card">
             <div class="card-header">
                 <div class="d-flex flex-fill flex-column flex-lg-row justify-content-between">
                     <div>
                         <div style="font-weight: bold;">
                             <c:choose>
                                 <c:when test="${not empty request.createdAt}">
                                     ${request.createdAt.year}.<fmt:formatNumber value="${request.createdAt.monthValue}" pattern="00"/>.<fmt:formatNumber value="${request.createdAt.dayOfMonth}" pattern="00"/> ${request.status}
                                 </c:when>
                                 <c:otherwise>
                                     2025.05.29 등록
                                 </c:otherwise>
                             </c:choose>
                         </div>

                     </div>
                 </div>

             </div>
             <div class="d-flex justify-content-between align-items-lg-center flex-column flex-lg-row gap-3">
                 <div class="order-type text-center bg-body-secondary rounded" style="color: #666;">
                     <div class="">
                         <c:choose>
                             <c:when test="${not empty request and request.applicationType == 'HBP'}">
                                 <img src="/assets/images/app-btn1.png">
                             </c:when>
                             <c:when test="${not empty request and request.applicationType == 'LUNG'}">
                                 <img src="/assets/images/app-btn2.png">
                             </c:when>
                             <c:when test="${not empty request and request.applicationType == 'CARDIAC'}">
                                 <img src="/assets/images/app-btn3.png">
                             </c:when>
                             <c:when test="${not empty request and request.applicationType == 'KNEE'}">
                                 <img src="/assets/images/app-btn4.png">
                             </c:when>
                             <c:otherwise>
                                 <img src="/assets/images/app-btn1.png">
                             </c:otherwise>
                         </c:choose>
                     </div>
                     <div>${not empty request ? request.applicationType : 'HBP'}</div>
                 </div>
                 <div class="flex-fill align-items-center d-flex">${not empty request ? request.title : '제목 없음'}</div>
                 <div class="status-badge status-progress align-items-center d-flex">
                     <span class="">
                        <c:out value="${not empty request ? request.status : '상태 없음'}"/>
                     </span>
                 </div>
             </div>
         </div>
         
         
         <!---진행바 시작-->
         <div class="card progress-box d-flex gap-3">
             <div>
                 <div class="progress-stacked">
                     <div style="width: 20%;">
                         <div class="progress-step ${not empty request and (request.status == '의뢰 확인중' || request.status == '견적중' || request.status == '결제 진행' || request.status == '작업중' || request.status == '작업 완료') ? 'active' : ''}">
                             <div class="prog-cont">
                                 <span class="step-number"></span>
                             </div>
                         </div>
                         <div class="prog-txt text-center pt-2"><span class="step-label">의뢰 확인중</span></div>
                     </div>
                     <div style="width: 20%;">
                         <div class="progress-step ${not empty request and (request.status == '견적중' || request.status == '결제 진행' || request.status == '작업중' || request.status == '작업 완료') ? 'active' : ''}">
                             <div class="prog-cont">
                                 <span class="step-number"></span>
                             </div>
                         </div>
                         <div class="prog-txt text-center pt-2"><span class="step-label">견적중</span></div>
                     </div>
                     <div style="width: 20%;">
                         <div class="progress-step ${not empty request and (request.status == '결제 진행' || request.status == '작업중' || request.status == '작업 완료') ? 'active' : ''}">
                             <div class="prog-cont">
                                 <span class="step-number"></span>
                             </div>
                         </div>
                         <div class="prog-txt text-center pt-2"><span class="step-label">결제 진행</span></div>
                     </div>
                     <div style="width: 20%;">
                         <div class="progress-step ${not empty request and (request.status == '작업중' || request.status == '작업 완료') ? 'active' : ''}">
                             <div class="prog-cont">
                                 <span class="step-number"></span>
                             </div>
                         </div>
                         <div class="prog-txt text-center pt-2"><span class="step-label">작업중</span></div>
                     </div>
                     <div style="width: 20%;">
                         <div class="progress-step ${not empty request and request.status == '작업 완료' ? 'active' : ''}">
                             <div class="prog-cont">
                                 <span class="step-number"></span>
                             </div>
                         </div>
                         <div class="prog-txt text-center pt-2"><span class="step-label">작업 완료</span></div>
                     </div>
                 </div>
             </div>
             <div class="prog-pane bg-body-tertiary p-3 rounded-2" id="step1-panel">
                 <div class="fw-bold mb-3 progress-title">1단계_접수 및 파일 업로드</div>
                 <div class="bg-white p-3">
                     <div class="form-group flex-column align-items-baseline gap-1">
                         <label class="form-label w-100"><i class="bi bi-arrow-right-circle-fill"></i> 환자 정보 보호 동의서</label>
                         <textarea class="form-input" rows="1" placeholder="내용을 입력하세요" readonly>${not empty request ? request.privacyAgreement : ''}</textarea>
                     </div>
                     <div class="form-group flex-column align-items-baseline gap-1">
                         <label class="form-label w-100"><i class="bi bi-arrow-right-circle-fill"></i> 의뢰내용</label>
                         <textarea class="form-input" rows="1" placeholder="내용을 입력하세요" readonly>${not empty request ? request.content : ''}</textarea>
                     </div>
                     <div class="form-group flex-column align-items-baseline gap-1">
                         <label class="form-label w-100"><i class="bi bi-arrow-right-circle-fill"></i> 파일 업로드 현황</label>
                         <c:if test="${not empty request and not empty request.filePath}">
                             <div class="text-success">${request.filePath}</div>
                         </c:if>
                         <c:if test="${empty request or empty request.filePath}">
                             <div class="text-muted">업로드된 파일이 없습니다.</div>
                         </c:if>
                     </div>
                                           <div class="text-center">
                          <c:choose>
                              <c:when test="${not empty request and (request.status == '작업 완료' || request.status == '취소 진행중' || request.status == '취소 완료')}">
                                  <button class="btn btn-danger" style="flex: 1;" disabled>수정하기</button>
                                  <button type="button" class="btn btn-secondary" style="flex: 1;" disabled>취소하기</button>
                              </c:when>
                              <c:otherwise>
                                  <a href="/mypage/edit-request/${request.id}" class="btn btn-danger" style="flex: 1;">수정하기</a>
                                  <button type="button" class="btn btn-secondary" style="flex: 1;" onclick="cancelRequest('${request.id}', event)" data-status="<c:out value="${request.status}"/>">취소하기</button>
                              </c:otherwise>
                          </c:choose>
                      </div>
                 </div>
             </div>
             <div class="prog-pane bg-body-tertiary p-3 rounded-2" id="step2-panel">
                 <div class="fw-bold mb-3 progress-title">2단계_상담 및 견적안내</div>
                 <div class="align-items-center d-flex flex-column gap-3 bg-white p-3">
                     <div class="custom-spinner">
                         <!--<span class="spinner-dot"></span>-->
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                     </div>
                     <div class="">
                         <c:choose>
                             <c:when test="${not empty request and (request.status == '견적중' || request.status == '결제 진행' || request.status == '작업중' || request.status == '작업 완료')}">견적 완료</c:when>
                             <c:otherwise>견적중</c:otherwise>
                         </c:choose>
                     </div>
                     <div class="text-black-50">
                         <c:choose>
                             <c:when test="${not empty request and (request.status == '견적중' || request.status == '결제 진행' || request.status == '작업중' || request.status == '작업 완료')}">견적이 완료되었습니다.</c:when>
                             <c:otherwise>요청하신 내용으로 연락 예정입니다.</c:otherwise>
                         </c:choose>
                     </div>
                 </div>
             </div>
             <div class="prog-pane bg-body-tertiary p-3 rounded-2" id="step3-panel">
                 <div class="fw-bold mb-3 progress-title">3단계_결제정보</div>
                 <div class="bg-white p-3">
                     <div class="border-bottom pb-3" style="border-bottom: 1px dashed #d9d9d9 !important;">
                         <div class="fw-bold pb-3">결제수단</div>
                         <div class="text-secondary">계좌입금 or 신한카드 / 일시불 및 할부내역 입력</div>
                     </div>
                     <div class="d-flex justify-content-end gap-3 pt-1">총 결제금액 <span class="text-danger fw-bold">20,000,000원</span></div>
                 </div>
             </div>
             <div class="prog-pane bg-body-tertiary p-3 rounded-2" id="step4-panel">
                 <div class="fw-bold mb-3 progress-title">4단계_작업 수행</div>
                 <div class="align-items-center d-flex flex-column gap-3 justify-content-center bg-white p-3">
                     <div class="custom-spinner">
                         <!--<span class="spinner-dot"></span>-->
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                         <span class="spinner-dot"></span>
                     </div>
                     <div class="">
                         <c:choose>
                             <c:when test="${not empty request and request.status == '작업 완료'}">작업 완료</c:when>
                             <c:when test="${not empty request and request.status == '작업중'}">작업중</c:when>
                             <c:otherwise>대기중</c:otherwise>
                         </c:choose>
                     </div>
                 </div>
             </div>
             <div class="prog-pane bg-body-tertiary p-3 rounded-2" id="step5-panel">
                 <div class="fw-bold mb-3 progress-title">5단계_작업 완료</div>
                 <div class="d-none d-lg-block bg-white p-3">
                     <c:choose>
                         <c:when test="${not empty request and request.status == '작업 완료'}">
                             <div class="">첨부파일을 다운로드하여 결과물을 확인해보세요.</div>
                         </c:when>
                         <c:otherwise>
                             <div class="text-muted">작업이 완료되면 결과물을 확인할 수 있습니다.</div>
                         </c:otherwise>
                     </c:choose>
                                           <table class="table table-bordered">
                          <thead>
                              <tr>
                                  <th>No.</th>
                                  <th>의뢰내용</th>
                                  <th>다운로드 상태</th>
                                  <th>첨부파일</th>
                              </tr>
                          </thead>
                          <tbody class="">
                              <c:choose>
                                  <c:when test="${not empty request and request.status == '작업 완료'}">
                                      <tr>
                                          <td>Project${request.id}</td>
                                          <td class="w-50">
                                              <div class="request-details">${request.content}</div>
                                          </td>
                                          <td>작업 완료</td>
                                          <td>
                                              <c:if test="${not empty request.filePath}">
                                                  <button type="button" class="btn" onclick="downloadFile('${request.id}', '${request.filePath}')">
                                                      <img src="/assets/images/download-icon.png">
                                                  </button>
                                              </c:if>
                                              <c:if test="${empty request.filePath}">
                                                  <span class="text-muted">파일 없음</span>
                                              </c:if>
                                          </td>
                                      </tr>
                                  </c:when>
                                  <c:otherwise>
                                      <tr>
                                          <td colspan="4" class="text-center text-muted">작업이 완료되면 결과물을 확인할 수 있습니다.</td>
                                      </tr>
                                  </c:otherwise>
                              </c:choose>
                          </tbody>
                      </table>
                </div>
                                 <div class="d-block d-lg-none">
                     <c:choose>
                         <c:when test="${not empty request and request.status == '작업 완료'}">
                             <div class="d-flex flex-column gap-1 border-top border-bottom pb-1 pt-1">
                                 <div class="order-numb align-items-center d-flex justify-content-between">
                                     <div>No. Project${request.id}</div>
                                     <div>
                                         <c:if test="${not empty request.filePath}">
                                             <button type="button" class="btn btn-sm" onclick="downloadFile('${request.id}', '${request.filePath}')">
                                                 <img src="/assets/images/download-icon.png">
                                             </button>
                                         </c:if>
                                         <c:if test="${empty request.filePath}">
                                             <span class="text-muted">파일 없음</span>
                                         </c:if>
                                     </div>
                                 </div>
                                 <div class="order-contents">${request.content}</div>
                                 <div class="align-items-center d-flex justify-content-end">
                                     <div class="order-date">작업 완료</div>
                                 </div>
                             </div>
                         </c:when>
                         <c:otherwise>
                             <div class="text-center text-muted py-3">
                                 작업이 완료되면 결과물을 확인할 수 있습니다.
                             </div>
                         </c:otherwise>
                     </c:choose>
                 </div>
            </div>
         <!---진행바 끝-->






        </div>
    </div>
</div>

<!--<script>
document.addEventListener('DOMContentLoaded', function () {
    // 모든 .progress-step과 .prog-pane 요소를 선택
    const progressSteps = document.querySelectorAll('.progress-step');
    const progPanes = document.querySelectorAll('.prog-pane');

    // 초기 상태 설정: .active인 .progress-step에 맞는 .prog-pane만 표시
    function updatePanes() {
        // 모든 .prog-pane을 먼저 숨김
        progPanes.forEach(pane => {
            pane.style.display = 'none';
        });

        // .active 클래스가 있는 .progress-step을 찾아 해당 인덱스의 .prog-pane을 표시
        progressSteps.forEach((step, index) => {
            if (step.classList.contains('active')) {
                progPanes[index].style.display = 'block';
            }
        });
    }

    // 초기 로드 시 실행
    updatePanes();

    // .progress-step 클릭 시 .active 클래스 토글 및 .prog-pane 업데이트
    progressSteps.forEach(step => {
        step.addEventListener('click', function () {
            // 모든 .progress-step에서 .active 클래스 제거
            progressSteps.forEach(s => s.classList.remove('active'));
            // 클릭한 .progress-step에 .active 클래스 추가
            this.classList.add('active');
            // .prog-pane 업데이트
            updatePanes();
        });
    });
});
</script>-->

<script>
    document.addEventListener('DOMContentLoaded', function() {
   // 모든 .progress-step과 .prog-pane 요소를 선택
   const progressSteps = document.querySelectorAll('.progress-step');
   const progPanes = document.querySelectorAll('.prog-pane');

   // 마지막 .active 단계에 둥근 테두리 스타일 추가
   function updateActiveStepStyles() {
       // 모든 .progress-step에서 기존 스타일 초기화
       progressSteps.forEach(step => {
           step.style.borderTopRightRadius = '0';
           step.style.borderBottomRightRadius = '0';
       });

       // .active 클래스를 가진 마지막 요소 찾기
       const activeSteps = document.querySelectorAll('.progress-step.active');
       const lastActiveStep = activeSteps[activeSteps.length - 1];

       // 마지막 .active 요소에 둥근 테두리 스타일 추가
       if (lastActiveStep) {
           lastActiveStep.style.borderTopRightRadius = '50px';
           lastActiveStep.style.borderBottomRightRadius = '50px';
       }
   }

   // 특정 .prog-pane만 표시하는 함수
   function updatePanes(activeIndex) {
       // 모든 .prog-pane을 숨김
       progPanes.forEach(pane => {
           pane.style.display = 'none';
       });

       // activeIndex에 해당하는 .prog-pane만 표시
       if (activeIndex >= 0 && activeIndex < progPanes.length) {
           progPanes[activeIndex].style.display = 'block';
       }
   }

   // .active 클래스 업데이트: 클릭한 단계까지 모든 이전 단계에 .active 추가
   function updateActiveSteps(clickedIndex) {
       // 모든 .progress-step에서 .active 클래스 제거
       progressSteps.forEach(step => step.classList.remove('active'));

       // 클릭한 단계까지 모든 이전 단계에 .active 클래스 추가
       for (let i = 0; i <= clickedIndex; i++) {
           progressSteps[i].classList.add('active');
       }

       // .prog-pane 업데이트 (클릭한 단계에 해당하는 패널만 표시)
       updatePanes(clickedIndex);

       // 마지막 .active 단계에 스타일 적용
       updateActiveStepStyles();
   }

   // 초기 상태 설정
   function initialize() {
       // 초기 상태에서 첫 번째 .progress-step에 .active 추가
       if (progressSteps.length > 0) {
           progressSteps[0].classList.add('active');
           updatePanes(0);
           updateActiveStepStyles();
       }
   }

   // 초기 로드 시 실행
   initialize();

   // .progress-step 클릭 시 .active 클래스 업데이트 및 .prog-pane 업데이트
   progressSteps.forEach((step, index) => {
       step.addEventListener('click', function() {
           updateActiveSteps(index);
       });
   });
});
</script>

<jsp:include page="footer.jsp" />