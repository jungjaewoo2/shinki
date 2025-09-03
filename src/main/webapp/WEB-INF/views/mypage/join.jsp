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
        <div class="page-title text-center m-3 m-lg-5">회원가입</div>
        
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
        <div class="overflow-x-hidden overflow-y-auto">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-5">
                    <div class="d-flex flex-column gap-2">
                        <form action="/mypage/register" method="post">
                            <div>
                                <div class="form-group">
                                    <label class="form-label required">병원</label>
                                    <input type="text" name="hospitalName" class="form-input" placeholder="병원명을 입력하세요" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label required">진료과</label>
                                    <input type="text" name="department" class="form-input" placeholder="진료과를 입력하세요" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label required">이름</label>
                                    <input type="text" name="name" class="form-input" placeholder="이름을 입력하세요" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label required">아이디</label>
                                    <input type="text" name="username" class="form-input" placeholder="아이디를 입력하세요" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label required">비밀번호</label>
                                    <input type="password" name="password" class="form-input" placeholder="비밀번호를 입력하세요" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label required">비밀번호 확인</label>
                                    <input type="password" name="confirmPassword" class="form-input" placeholder="비밀번호를 다시 입력하세요" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label required">연락처</label>
                                    <input type="text" name="phone" class="form-input" placeholder="010-0000-0000" required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">이메일</label>
                                    <input type="email" name="email" class="form-input" placeholder="email@example.com">
                                </div>

                                <div class="form-group">
                                    <label class="form-label">추천직원</label>
                                    <input type="text" name="recommendedEmployee" class="form-input" placeholder="추천직원명">
                                </div>

                                <div class="form-group">
                                    <label class="form-label">추천코드</label>
                                    <input type="text" name="recommendCode" class="form-input" placeholder="추천코드를 입력하세요">
                                </div>
                            </div>
                            <div class="d-grid col-12 mx-auto mt-4">
                                <button type="submit" class="btn btn-dark">회원가입</button>
                            </div>
                        </form>
                        
                        <div class="text-center" style="margin-top: 20px;">
                            <a href="/mypage/login" class="btn-link">로그인으로 돌아가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="termsBox_list2" tabindex="-1" aria-labelledby="termsBoxLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg justify-content-center">
        <div class="modal-content p-3" style="height: 700px; overflow-y: scroll">
            <div class="border-bottom d-flex justify-content-between mb-10">
                <h4>개인정보 수집 및 이용 약관</h4>
                <button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="d-flex flex-column gap-3 justify-content-center">
                <div class="contents">
                    <div class="title">제1조 수집하는 개인정보 항목 및 수집방법</div>
                    <br />
                    <div>
                        Synapse 3D(이하 "회사")는 『개인정보 보호법』 및 관련 법령에 따라,
                        아래와 같이 이용자의 개인정보를 수집·이용하며, 이에 대해 동의를 받고자 합니다.
                    </div>
                    <br />

                    <div class="nb_list">1.수집항목</div>
                    <br />
                    <div class="nb_list2">1)회원가입 및 기본 서비스 제공 시</div>
                    <br />
                    <div class="dot-list">* 필수 : 이름, 휴대전화번호, 이메일 주소, 상품을 제공받는 해당 채널의 주소 및 ID, 주소지</div>
                    <br />
                    <div class="nb_list2">
                        2)마케팅 및 이벤트 안내 시 – 선택 동의
                    </div>
                    <br />
                    <div class="dot-list">
                        * 선택항목: 이름, 휴대전화번호, 이메일 주소
                    </div>
                    <div class="dot-list">
                        ※ 쿠키, 접속 IP, 브라우저 정보 등 자동 수집 항목은 별도의 ‘개인정보 처리방침’에 따릅니다.
                    </div>
                    <br />

                    <div class="nb_list">2.수집 및 이용 목적</div>
                    <br />
                    <div class="dot-list">
                        ·회원 가입 및 서비스 이용에 따른 본인 확인, 민원 응대, 고지사항 전달 등
                    </div>
                    <br />
                    <div class="dot-list">
                        ·이벤트 및 프로모션 정보 제공, 신규 서비스 안내 및 마케팅 활용 (선택 동의 시)
                    </div>
                    <br />
                    <div class="title">제2조 개인정보의 수집 및 이용 목적</div>
                    <br />

                    <div class="nb_list">3.개인정보 보유 및 이용 기간</div>
                    <br />
                    <div class="dot-list">
                        (사진 참조)
                        ※ 관련 법령에 따라 아래와 같이 별도 보존될 수 있습니다.
                    </div>
                    <br />
                    <div class="dot-list">
                        * 계약 또는 청약 철회 등에 관한 기록: 5년 (전자상거래법)
                    </div>
                    <br />
                    <div class="dot-list">
                        * 소비자 불만 또는 분쟁처리에 관한 기록: 3년 (전자상거래법)
                    </div>
                    <br />

                    <div class="nb_list">4.동의 거부권 및 거부에 따른 불이익</div>
                    <br />
                    <div class="dot-list">
                        * 귀하는 위 개인정보 수집·이용에 대한 동의를 거부할 권리가 있습니다.
                    </div>
                    <br />
                    <div class="dot-list">
                        * 단, 필수항목에 대한 동의를 거부할 경우, 회원가입 및 서비스 제공이 제한될 수 있습니다.
                    </div>
                    <br />

                </div>
                <div class="text-end">
                    <button type="button" class="btn btn-dark" data-bs-dismiss="modal">
                        확인
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />