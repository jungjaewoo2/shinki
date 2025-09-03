<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</div>
</div>
</div>

<script>
    // 사이드바 토글 (모바일)
    function toggleSidebar() {
        const sidebar = document.querySelector('.sidebar');
        const overlay = document.querySelector('.overlay');

        if (sidebar.classList.contains('open')) {
            closeSidebar();
        } else {
            sidebar.classList.add('open');
            overlay.classList.add('active');
            document.body.style.overflow = 'hidden'; // 스크롤 방지
        }
    }

    function closeSidebar() {
        const sidebar = document.querySelector('.sidebar');
        const overlay = document.querySelector('.overlay');

        sidebar.classList.remove('open');
        overlay.classList.remove('active');
        document.body.style.overflow = ''; // 스크롤 복원
    }

    // 사이드바 섹션 토글
    function toggleSection(element) {
        const items = element.nextElementSibling;
        const arrow = element.querySelector('span');

        if (items.classList.contains('hidden')) {
            items.classList.remove('hidden');
            arrow.innerHTML = '<i class="bi bi-caret-up-fill"></i>';
            element.classList.add('active');
        } else {
            items.classList.add('hidden');
            arrow.innerHTML = '<i class="bi bi-caret-down-fill"></i>';
            element.classList.remove('active');
        }
    }

    // 페이지 전환
    function showPage(pageId) {
        // 모든 페이지 숨김
        const pages = document.querySelectorAll('.page');
        pages.forEach(page => {
            page.classList.add('hidden');
            page.style.pointerEvents = 'none'; // 클릭 방지
        });

        // 모든 네비게이션 아이템 비활성화
        const navItems = document.querySelectorAll('.nav-item');
        navItems.forEach(item => item.classList.remove('active'));

        // 선택된 페이지 표시
        const targetPage = document.getElementById(pageId + '-page');
        if (targetPage) {
            // 즉시 opacity 0으로 설정하여 페이드인 준비
            targetPage.style.opacity = '0';
            targetPage.style.transform = 'translateY(10px)';
            targetPage.classList.remove('hidden');
            // 다음 프레임에서 트랜지션 시작
            requestAnimationFrame(() => {
                targetPage.style.opacity = '1';
                targetPage.style.transform = 'translateY(0)';
                targetPage.style.pointerEvents = 'auto'; // 클릭 가능
            });
        }

        // 클릭된 네비게이션 아이템 활성화
        if (event && event.target) {
            event.target.classList.add('active');
        }

        // 모바일에서 페이지 전환 시 사이드바 닫기
        if (window.innerWidth <= 768) {
            closeSidebar();
        }
    }

    // 앱 선택
    function selectApp(element, appType) {
        // 모든 앱 옵션 비활성화
        const appOptions = document.querySelectorAll('.app-option');
        appOptions.forEach(option => option.classList.remove('selected'));

        // 선택된 앱 활성화
        element.classList.add('selected');
    }

    // 문의 유형 선택
    function selectInquiryType(element, type) {
        // 모든 선택 버튼 비활성화
        const buttons = element.parentNode.querySelectorAll('.select-btn');
        buttons.forEach(btn => btn.classList.remove('active'));

        // 선택된 버튼 활성화
        element.classList.add('active');
    }

    // 파일 드래그 앤 드롭
    function dropHandler(ev) {
        ev.preventDefault();
        ev.target.classList.remove('dragover');

        const files = ev.dataTransfer.files;
        handleFiles(files);
    }

    function dragOverHandler(ev) {
        ev.preventDefault();
        ev.target.classList.add('dragover');
    }

    function handleFiles(files) {
        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            console.log('업로드된 파일:', file.name);
            // 여기에 파일 처리 로직 추가
        }
    }

    // 화면 크기 변경 감지
    function handleResize() {
        if (window.innerWidth > 768) {
            // 데스크톱에서는 사이드바 상태 초기화
            const sidebar = document.querySelector('.sidebar');
            const overlay = document.querySelector('.overlay');
            sidebar.classList.remove('open');
            overlay.classList.remove('active');
            document.body.style.overflow = '';
        }
    }

    // 초기화
    /*document.addEventListener('DOMContentLoaded', function() {
        // 첫 번째 섹션 열기
        const firstSection = document.querySelector('.nav-title');
        if (firstSection) {
            firstSection.click();
        }

        // 파일 입력 이벤트
        const fileInput = document.getElementById('fileInput');
        if (fileInput) {
            fileInput.addEventListener('change', function(e) {
                handleFiles(e.target.files);
            });
        }

        // 화면 크기 변경 이벤트
        window.addEventListener('resize', handleResize);
    });*/

    // 드래그 이벤트 리스너
    document.addEventListener('dragenter', function(e) {
        e.preventDefault();
    });

    document.addEventListener('dragover', function(e) {
        e.preventDefault();
    });

    document.addEventListener('drop', function(e) {
        e.preventDefault();
    });

</script>

</body>

</html>
