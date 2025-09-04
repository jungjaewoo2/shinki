<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 사이드바 -->
<div class="sidebar">
    <div class="sidebar-header">
        <h1>마이 페이지</h1>
    </div>
    <nav class="sidebar-nav">
        <div class="nav-section">
            <div class="nav-title">
                MY 정보
                <span><i class="bi bi-caret-down-fill"></i></span>
            </div>
            <div class="nav-items">
                <div class="nav-item" onclick="location.href='/mypage/profile'">개인정보확인/수정</div>
                <div class="nav-item" onclick="location.href='/mypage/withdrawal'">탈퇴하기</div>
            </div>
        </div>

        <div class="nav-section">
            <div class="nav-title" onclick="location.href='/mypage/request'">
                의뢰하기
            </div>
        </div>

        <div class="nav-section">
            <div class="nav-title">
                의뢰내역
                <span><i class="bi bi-caret-down-fill"></i></span>
            </div>
            <div class="nav-items">
                <div class="nav-item" onclick="location.href='/mypage/orders'">의뢰 목록 / 현황</div>
                <div class="nav-item" onclick="location.href='/mypage/cancelled-orders'">취소 내역</div>
            </div>
        </div>

        <div class="nav-section">
            <div class="nav-title">
                자료실
                <span><i class="bi bi-caret-down-fill"></i></span>
            </div>
            <div class="nav-items">
                <div class="nav-item" onclick="location.href='/mypage/downloads'">파일 다운로드</div>
            </div>
        </div>

        <div class="nav-section">
            <div class="nav-title">
                1:1 문의
                <span><i class="bi bi-caret-down-fill"></i></span>
            </div>
            <div class="nav-items">
                <div class="nav-item" onclick="location.href='/mypage/inquiry'">문의하기</div>
                <div class="nav-item" onclick="location.href='/mypage/inquiry-history'">문의내역조회</div>
            </div>
        </div>
    </nav>
    <!--<div class="d-block d-lg-none" onclick="location.href='#'" style="padding: 15px 20px;font-weight: bold;position: absolute;bottom: 0;"></div>-->
    <div class="d-block d-lg-none " style="padding: 15px 20px;font-weight: bold;position: absolute;bottom: 0;">
                <div class="d-flex flex-column gap-2">
            <div><i class="bi bi-person-circle fs-5"></i> 마이페이지</div>
            <div onclick="location.href='/mypage/logout'"><i class="bi bi-box-arrow-right fs-5"></i> 로그아웃</div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
    const navSections = document.querySelectorAll('.nav-section');
    const currentPath = window.location.pathname.split('/').pop(); // Get the current page file name

    // localStorage에서 활성 상태 복원 및 현재 페이지와 일치 여부 확인
    function restoreActiveState() {
        // 모든 섹션 초기화
        navSections.forEach(section => {
            const navTitle = section.querySelector('.nav-title');
            const navItems = section.querySelector('.nav-items');
            const icon = navTitle?.querySelector('span > i');
            navTitle.classList.remove('active');
            if (navItems) {
                navItems.style.display = 'none';
            }
            if (icon) {
                icon.classList.remove('bi-caret-up-fill');
                icon.classList.add('bi-caret-down-fill');
            }
            section.querySelectorAll('.nav-item').forEach(item => {
                item.classList.remove('active');
            });
        });

        // 현재 페이지 URL과 일치하는 항목 찾기
        navSections.forEach(section => {
            const navTitle = section.querySelector('.nav-title');
            const navItems = section.querySelector('.nav-items');
            const icon = navTitle.querySelector('span > i');

            // "의뢰하기"와 같은 단일 항목 섹션 처리
            if (navTitle.getAttribute('onclick')) {
                const titleHref = navTitle.getAttribute('onclick').match(/'([^']+)'/)?.[1];
                if (titleHref && titleHref.split('/').pop() === currentPath) {
                    navTitle.classList.add('active');
                    localStorage.setItem('activeSection', navTitle.textContent.trim());
                    localStorage.removeItem('activeItem');
                    return;
                }
            }

            // 하위 nav-item이 있는 섹션 처리
            if (navItems) {
                const navItem = Array.from(section.querySelectorAll('.nav-item')).find(item => {
                    const itemHref = item.getAttribute('onclick')?.match(/'([^']+)'/)?.[1];
                    return itemHref && itemHref.split('/').pop() === currentPath;
                });

                if (navItem) {
                    navTitle.classList.add('active');
                    navItems.style.display = 'block';
                    if (icon) {
                        icon.classList.remove('bi-caret-down-fill');
                        icon.classList.add('bi-caret-up-fill');
                    }
                    navItem.classList.add('active');
                    localStorage.setItem('activeSection', navTitle.textContent.trim());
                    localStorage.setItem('activeItem', navItem.textContent.trim());
                }
            }
        });
    }

    // 페이지 로드 시 활성 상태 복원
    restoreActiveState();

    // 각 섹션의 nav-title 클릭 이벤트
    navSections.forEach(section => {
        const navTitle = section.querySelector('.nav-title');
        const navItems = section.querySelector('.nav-items');
        const icon = navTitle.querySelector('span > i');

        navTitle.addEventListener('click', function(e) {
            // "의뢰하기" 메뉴는 하위 항목이 없으므로 페이지 이동 처리
            if (navTitle.textContent.trim() === '의뢰하기') {
                localStorage.setItem('activeSection', navTitle.textContent.trim());
                localStorage.removeItem('activeItem'); // 하위 항목 없으므로 초기화
                return; // onclick 속성으로 페이지 이동 처리
            }

            // 다른 섹션의 동작: 모든 섹션의 active 클래스와 nav-items 표시 제거
            navSections.forEach(otherSection => {
                const otherNavTitle = otherSection.querySelector('.nav-title');
                const otherNavItems = otherSection.querySelector('.nav-items');
                const otherIcon = otherSection.querySelector('.nav-title span > i');
                otherNavTitle.classList.remove('active');
                if (otherNavItems) {
                    otherNavItems.style.display = 'none';
                }
                if (otherIcon) {
                    otherIcon.classList.remove('bi-caret-up-fill');
                    otherIcon.classList.add('bi-caret-down-fill');
                }
                otherSection.querySelectorAll('.nav-item').forEach(item => {
                    item.classList.remove('active');
                });
            });

            // 클릭한 섹션의 active 클래스 토글 및 nav-items 표시
            navTitle.classList.toggle('active');
            if (navItems) {
                navItems.style.display = navTitle.classList.contains('active') ? 'block' : 'none';
            }

            // 아이콘 클래스 변경
            if (icon) {
                if (navTitle.classList.contains('active')) {
                    icon.classList.remove('bi-caret-down-fill');
                    icon.classList.add('bi-caret-up-fill');
                } else {
                    icon.classList.remove('bi-caret-up-fill');
                    icon.classList.add('bi-caret-down-fill');
                }
            }

            // localStorage에 활성 섹션 저장
            if (navTitle.classList.contains('active')) {
                localStorage.setItem('activeSection', navTitle.textContent.trim());
            } else {
                localStorage.removeItem('activeSection');
                localStorage.removeItem('activeItem');
            }
        });

        // 각 nav-item에 클릭 이벤트 추가
        const navItemsList = section.querySelectorAll('.nav-item');
        navItemsList.forEach(item => {
            item.addEventListener('click', function(e) {
                // 같은 섹션 내 모든 nav-item에서 active 클래스 제거
                navItemsList.forEach(otherItem => {
                    otherItem.classList.remove('active');
                });

                // 클릭한 nav-item에 active 클래스 추가
                item.classList.add('active');

                // localStorage에 활성 항목 저장
                localStorage.setItem('activeItem', item.textContent.trim());
                localStorage.setItem('activeSection', section.querySelector('.nav-title').textContent.trim());
            });
        });
    });
});
</script>
