<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<!-- 의뢰하기 페이지 -->
<div id="request-page" class="page d-flex flex-column h-100">
    <div class="align-items-center d-flex flex-column flex-lg-row justify-content-between page-header">
        <div class="page-title">의뢰하기</div>
        <div class="breadcrumb">마이페이지 > 의뢰하기</div>
    </div>

    <div class="card flex-fill overflow-auto">
        <!-- 메시지 표시 -->
        <c:if test="${not empty message}">
            <div class="alert alert-success text-center mx-3 mt-3" role="alert">
                ${message}
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center mx-3 mt-3" role="alert">
                ${error}
            </div>
        </c:if>
        
        <form id="requestForm" action="/mypage/request" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
            <input type="hidden" name="memberId" value="${memberId}">
            
            <div class="form-group flex-column align-items-baseline gap-3">
                <label class="form-label required">1. 환자 정보 보호 동의서</label>
                <textarea name="privacyAgreement" id="privacyAgreement" class="form-input" rows="2" placeholder="내용을 입력하세요" required>dffsdfdsfs</textarea>
            </div>
            <div class="checkbox-group justify-content-end">
                <label class="checkbox-item">
                    <input type="radio" name="privacyAgreed" value="true" required> 동의합니다.
                </label>
                <label class="checkbox-item">
                    <input type="radio" name="privacyAgreed" value="false"> 동의하지 않습니다.
                </label>
            </div>

            <div class="form-group">
                <label class="form-label required">APPLICATION</label>
                <select name="applicationType" id="applicationType" class="form-select" aria-label="Default select example" required>
                    <option value="">선택</option>
                    <option value="HBP">HBP</option>
                    <option value="LUNG">LUNG</option>
                    <option value="CARDIAC">CARDIAC</option>
                    <option value="KNEE">KNEE</option>
                </select>
            </div>
            <div class="form-group">
                <label class="form-label required">제목</label>
                <input type="text" name="title" id="title" class="form-input" placeholder="제목을 입력하세요" required>
            </div>

            <div class="form-group">
                <label class="form-label required">의뢰내용</label>
                <textarea name="content" id="content" class="form-input" rows="5" placeholder="의뢰내용을 입력하세요" required></textarea>
            </div>

            <div class="form-group align-items-baseline flex-column gap-3">
                <label class="form-label">Image 파일 업로드</label>
                <p class="m-0 text-danger" style="font-size: 14px">첨부파일을 Zip 압축파일로 올려주시기 바랍니다.</p>
                <div id="dropArea" class="file-upload-area w-100 d-flex flex-column align-items-center justify-content-center p-4 border rounded border-dashed" style="height: 150px; cursor: pointer;">
                    <i class="bi bi-cloud-arrow-up-fill fs-3 text-muted"></i>
                    <p id="dropAreaText" class="text-muted">첨부하실 파일을 마우스로 끌어서 넣어주세요.</p>
                    <input class="form-control d-none" type="file" id="formFile" name="file" accept=".zip">
                    <div id="fileList" class="file-list mt-2"></div>
                </div>
                <div class="button-group flex-row justify-content-end gap-1 w-100">
                    <button type="button" class="btn btn-secondary" onclick="document.getElementById('formFile').click()">추가</button>
                    <button type="button" class="btn btn-danger" onclick="clearFile()">삭제</button>
                </div>
            </div>

            <div class="button-group justify-content-center">
                <button type="submit" class="btn btn-dark">전송하기</button>
            </div>
        </form>
    </div>
</div>

<script>
// 파일 목록을 표시하는 함수
function displayFiles(files) {
    const fileList = document.getElementById('fileList');
    fileList.innerHTML = ''; // 기존 목록 초기화

    if (files.length > 0) {
        for (let i = 0; i < files.length; i++) {
            const fileItem = document.createElement('div');
            fileItem.textContent = files[i].name;
            fileList.appendChild(fileItem);
        }
        document.getElementById('dropAreaText').style.display = 'none'; // 텍스트 숨기기
    } else {
        fileList.textContent = '';
        document.getElementById('dropAreaText').style.display = 'block'; // 텍스트 보이기
    }
}

// 파일 선택 초기화 (삭제 버튼)
function clearFile() {
    document.getElementById('formFile').value = '';
    displayFiles([]); // 파일 목록 초기화
}

// 폼 유효성 검사
function validateForm() {
    const privacyAgreement = document.getElementById('privacyAgreement').value.trim();
    if (!privacyAgreement) {
        alert('환자 정보 보호 동의서 내용을 입력해주세요.');
        return false;
    }
    
    const privacyAgreed = document.querySelector('input[name="privacyAgreed"]:checked');
    if (!privacyAgreed) {
        alert('환자 정보 보호 동의서에 동의해주세요.');
        return false;
    }
    
    if (privacyAgreed.value === 'false') {
        alert('환자 정보 보호 동의서에 동의해야 합니다.');
        return false;
    }
    
    const applicationType = document.getElementById('applicationType').value;
    if (!applicationType) {
        alert('APPLICATION을 선택해주세요.');
        return false;
    }
    
    const title = document.getElementById('title').value.trim();
    if (!title) {
        alert('제목을 입력해주세요.');
        return false;
    }
    
    const content = document.getElementById('content').value.trim();
    if (!content) {
        alert('의뢰내용을 입력해주세요.');
        return false;
    }
    
    const fileInput = document.getElementById('formFile');
    if (fileInput.files.length > 0) {
        const fileName = fileInput.files[0].name;
        if (!fileName.toLowerCase().endsWith('.zip')) {
            alert('ZIP 파일만 업로드 가능합니다.');
            return false;
        }
    }
    
    return true;
}

// DOM 로드 후 실행 (window.onload 사용)
window.onload = function() {
    var dropArea = document.getElementById('dropArea');
    var formFile = document.getElementById('formFile');
    var fileList = document.getElementById('fileList');

    // 드래그 기본 동작 방지 헬퍼 함수
    function preventDefaults(e) {
        e.preventDefault();
        e.stopPropagation();
    }

    // 드래그 오버 핸들러 (하이라이트)
    function highlight(e) {
        dropArea.classList.add('dragover');
    }

    // 드래그 리브 핸들러 (하이라이트 해제)
    function unhighlight(e) {
        dropArea.classList.remove('dragover');
    }

    // 드롭 핸들러
    function dropHandler(e) {
        var dt = e.dataTransfer;
        var files = dt.files;

        if (files.length > 0) {
            var file = files[0];
            if (!file.name.toLowerCase().endsWith('.zip')) {
                alert('ZIP 파일만 업로드 가능합니다.');
                return;
            }
            formFile.files = files;
            displayFiles(files);
        }
    }

    // 드래그 앤 드롭 이벤트 등록
    if (dropArea) {
        // dropArea와 document.body에 대한 preventDefaults 등록 (inquiry.jsp와 동일하게)
        ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
            dropArea.addEventListener(eventName, preventDefaults, false);
            document.body.addEventListener(eventName, preventDefaults, false); // 전체 페이지 기본 동작 방지
        });

        // highlight 이벤트 등록
        ['dragenter', 'dragover'].forEach(eventName => {
            dropArea.addEventListener(eventName, highlight, false);
        });

        // unhighlight 이벤트 등록
        ['dragleave', 'drop'].forEach(eventName => {
            dropArea.addEventListener(eventName, unhighlight, false);
        });

        dropArea.addEventListener('click', function() {
            formFile.click(); // 드롭 영역 클릭 시 파일 입력 열기
        });
        dropArea.addEventListener('drop', dropHandler, false);
    }

    if (formFile) {
        formFile.addEventListener('change', function() {
            displayFiles(this.files);
        });
    }
};
</script>

<jsp:include page="footer.jsp" />