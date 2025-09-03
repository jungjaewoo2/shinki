<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />

 <!-- 주문내역 페이지 -->
 <div id="orders-page" class="order-detail page d-flex flex-column h-100">
     <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
         <div class="page-title">주문현황</div>
         <div class="breadcrumb">마이페이지 > 주문내역 > 주문목록 / 현황 > 주문현황</div>
     </div>

     <div class="card d-flex flex-fill flex-column gap-3 overflow-auto">
         <div class="card">
             <div class="card-header">
                 <div class="d-flex flex-fill flex-column flex-lg-row justify-content-between">
                     <div>
                         <div style="font-weight: bold;">
                             <c:choose>
                                 <c:when test="${not empty request.createdAt}">
                                     ${request.createdAt.year}.<fmt:formatNumber value="${request.createdAt.monthValue}" pattern="00"/>.<fmt:formatNumber value="${request.createdAt.dayOfMonth}" pattern="00"/> 주문
                                 </c:when>
                                 <c:otherwise>
                                     2025.05.29 주문
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
         <div class="card progress-box d-flex gap-3">
             <div>
                 <div class="progress-stacked">
                     <div style="width: 20%;">
                         <div class="progress-step ${not empty request and request.regCondition >= 1 and request.regCondition <= 1 ? 'active' : ''}">
                             <div class="prog-cont">
                                 <span class="step-number"></span>
                             </div>
                         </div>
                         <div class="prog-txt text-center pt-2"><span class="step-label">의뢰 확인중</span></div>
                     </div>
                     <div style="width: 20%;">
                         <div class="progress-step ${not empty request and request.regCondition >= 2 and request.regCondition <= 2 ? 'active' : ''}">
                             <div class="prog-cont">
                                 <span class="step-number"></span>
                             </div>
                         </div>
                         <div class="prog-txt text-center pt-2"><span class="step-label">견적중</span></div>
                     </div>
                     <div style="width: 20%;">
                         <div class="progress-step ${not empty request and request.regCondition >= 3 and request.regCondition <= 3 ? 'active' : ''}">
                             <div class="prog-cont">
                                 <span class="step-number"></span>
                             </div>
                         </div>
                         <div class="prog-txt text-center pt-2"><span class="step-label">결제진행</span></div>
                     </div>
                     <div style="width: 20%;">
                         <div class="progress-step ${not empty request and request.regCondition >= 4 and request.regCondition <= 4 ? 'active' : ''}">
                             <div class="prog-cont">
                                 <span class="step-number"></span>
                             </div>
                         </div>
                         <div class="prog-txt text-center pt-2"><span class="step-label">작업수행</span></div>
                     </div>
                     <div style="width: 20%;">
                         <div class="progress-step ${not empty request and request.regCondition >= 5 and request.regCondition <= 5 ? 'active' : ''}">
                             <div class="prog-cont">
                                 <span class="step-number"></span>
                             </div>
                         </div>
                         <div class="prog-txt text-center pt-2"><span class="step-label">완료</span></div>
                     </div>
                 </div>
             </div>
             <div class="prog-pane bg-body-tertiary p-3 rounded-2">
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
                             <div class="text-success">파일이 업로드되었습니다: ${request.filePath}</div>
                         </c:if>
                         <c:if test="${empty request or empty request.filePath}">
                             <div class="text-muted">업로드된 파일이 없습니다.</div>
                         </c:if>
                     </div>
                     <div class="text-center">
                         <a href="/mypage/edit-request/${request.id}" class="btn btn-danger" style="flex: 1;">수정하기</a>
                         <button type="button" class="btn btn-secondary" style="flex: 1;" onclick="cancelRequest('${request.id}', event)" data-status="<c:out value="${request.status}"/>">취소하기</button>
                     </div>
                 </div>
             </div>
             <div class="prog-pane bg-body-tertiary p-3 rounded-2">
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
                             <c:when test="${not empty request and request.regCondition >= 2}">견적 완료</c:when>
                             <c:otherwise>견적중</c:otherwise>
                         </c:choose>
                     </div>
                     <div class="text-black-50">
                         <c:choose>
                             <c:when test="${not empty request and request.regCondition >= 2}">견적이 완료되었습니다.</c:when>
                             <c:otherwise>요청하신 내용으로 연락 예정입니다.</c:otherwise>
                         </c:choose>
                     </div>
                 </div>
             </div>
             <div class="prog-pane bg-body-tertiary p-3 rounded-2">
                 <div class="fw-bold mb-3 progress-title">3단계_결제정보</div>
                 <div class="bg-white p-3">
                     <div class="border-bottom pb-3" style="border-bottom: 1px dashed #d9d9d9 !important;">
                         <div class="fw-bold pb-3">결제수단</div>
                         <div class="text-secondary">계좌입금 or 신한카드 / 일시불 및 할부내역 입력</div>
                     </div>
                     <div class="d-flex justify-content-end gap-3 pt-1">총 결제금액 <span class="text-danger fw-bold">20,000,000원</span></div>
                 </div>
             </div>
             <div class="prog-pane bg-body-tertiary p-3 rounded-2">
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
                             <c:when test="${not empty request and request.regCondition >= 4}">작업 완료</c:when>
                             <c:when test="${not empty request and request.regCondition >= 3}">작업중</c:when>
                             <c:otherwise>대기중</c:otherwise>
                         </c:choose>
                     </div>
                 </div>
             </div>
             <div class="prog-pane bg-body-tertiary p-3 rounded-2">
                 <div class="fw-bold mb-3 progress-title">5단계_작업 완료</div>
                 <div class="d-none d-lg-block bg-white p-3">
                     <c:choose>
                         <c:when test="${not empty request and request.regCondition >= 5}">
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
                             <tr>
                                 <td>Project250101</td>
                                 <td class="w-50">
                                     <div class="request-details">간 수술 시뮬레이션 의뢰합니다. 시뮬레이션은 어떤식으로 진행되나요?</div>
                                 </td>
                                 <td>2025.01.31까지</td>
                                 <td><button type="button" class="btn"><img src="../assets/images/download-icon.png"></button></td>
                            </tr>
                             <tr>
                                 <td>Project250101</td>
                                 <td class="w-50">
                                     <div class="request-details">심장 수술 시뮬레이션 의뢰합니다. 시뮬레이션은 어떤식으로 진행되나요?</div>
                                 </td>
                                 <td>완료</td>
                                 <td><button type="button" class="btn"><img src="../assets/images/download-icon.png"></button></td>
                            </tr>
                             <tr>
                                 <td>Project250101</td>
                                 <td class="w-50">
                                     <div class="request-details">폐 수술 시뮬레이션 의뢰합니다. 시뮬레이션은 어떤식으로 진행되나요?</div>
                                 </td>
                                 <td>2025.01.31까지</td>
                                 <td><button type="button" class="btn"><img src="../assets/images/download-icon.png"></button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="d-block d-lg-none">
                    <div class="d-flex flex-column gap-1 border-top border-bottom pb-1 pt-1">
                        <div class="order-numb align-items-center d-flex justify-content-between">
                            <div>No. Project250101</div>
                            <div><button type="button" class="btn btn-sm"><img src="../assets/images/download-icon.png"></button></div>
                        </div>
                        <div class="order-contents">간 수술 시뮬레이션 의뢰합니다. 시뮬레이션은 어떤식으로 진행되나요?</div>
                        <div class="align-items-center d-flex justify-content-end">

                            <div class="order-date">2025.01.31까지</div>
                        </div>

                    </div>
                    <div class="d-flex flex-column gap-1 border-bottom pb-1 pt-1">
                        <div class="order-numb align-items-center d-flex justify-content-between">
                            <div>No. Project250102</div>
                            <div><button type="button" class="btn btn-sm"><img src="../assets/images/download-icon.png"></button></div>
                        </div>
                        <div class="order-contents">심장 수술 시뮬레이션 의뢰합니다. 시뮬레이션은 어떤식으로 진행되나요?</div>
                        <div class="align-items-center d-flex justify-content-end">

                            <div class="order-date">2025.01.31까지</div>
                        </div>

                    </div>
                </div>
            </div>
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
         }

         // 초기 상태 설정
         function initialize() {
             // reg_condition 값에 따라 초기 상태 설정
             const regCondition = parseInt('${not empty request and request.regCondition != null ? request.regCondition : 1}') || 1;
             
             // 모든 .progress-step에서 .active 클래스 제거
             progressSteps.forEach(step => step.classList.remove('active'));
             
             // reg_condition 값에 해당하는 단계까지만 활성화 (0부터 시작)
             for (let i = 0; i < regCondition && i < progressSteps.length; i++) {
                 progressSteps[i].classList.add('active');
             }
             
             // 첫 번째 패널 표시 -> regCondition에 해당하는 패널 표시
             updatePanes(regCondition - 1);
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

    function cancelRequest(requestId, event) {
        const clickedButton = event.currentTarget;
        const requestStatus = clickedButton.dataset.status;

        if (requestStatus === '완료') {
            alert('완료된 의뢰는 취소할 수 없습니다.');
            return;
        }
        if (confirm('정말로 이 의뢰를 취소하시겠습니까?')) {
            // POST 요청을 보내기 위한 폼 생성
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = '/mypage/cancel-request/' + requestId;

            // CSRF 토큰이 필요할 경우 추가 (Spring Security 사용 시)
            // const csrfToken = document.querySelector('meta[name="_csrf"]').getAttribute('content');
            // const csrfHeader = document.querySelector('meta[name="_csrf_header"]').getAttribute('content');
            // const hiddenInput = document.createElement('input');
            // hiddenInput.type = 'hidden';
            // hiddenInput.name = csrfHeader;
            // hiddenInput.value = csrfToken;
            // form.appendChild(hiddenInput);

            document.body.appendChild(form);
            form.submit();
        }
    }
 </script>

<jsp:include page="footer.jsp" />