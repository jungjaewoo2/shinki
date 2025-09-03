<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 - 문의 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>
<body>
    <div class="container mt-4">
        <h2>문의 관리</h2>
        
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>문의유형</th>
                        <th>문의내용</th>
                        <th>작성일</th>
                        <th>상태</th>
                        <th>답변</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="inquiry" items="${inquiries}">
                        <tr>
                            <td>${inquiry.id}</td>
                            <td>${inquiry.inquiryType}</td>
                            <td>${inquiry.content}</td>
                            <td>${inquiry.createdAt}</td>
                            <td>
                                <span class="badge ${inquiry.status == '진행중' ? 'bg-warning' : 'bg-success'}">
                                    ${inquiry.status}
                                </span>
                            </td>
                            <td>
                                <c:if test="${inquiry.status == '진행중'}">
                                    <button class="btn btn-sm btn-primary" onclick="showReplyModal(${inquiry.id})">
                                        답변하기
                                    </button>
                                </c:if>
                                <c:if test="${inquiry.status == '완료'}">
                                    <button class="btn btn-sm btn-info" onclick="showReplyModal(${inquiry.id})">
                                        답변보기
                                    </button>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 답변 모달 -->
    <div class="modal fade" id="replyModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">문의 답변</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form id="replyForm" action="/admin/inquiry/reply" method="post">
                    <div class="modal-body">
                        <input type="hidden" id="inquiryId" name="id">
                        <div class="mb-3">
                            <label for="adminReply" class="form-label">답변 내용</label>
                            <textarea class="form-control" id="adminReply" name="adminReply" rows="5" required></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-primary">답변 등록</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function showReplyModal(inquiryId) {
            document.getElementById('inquiryId').value = inquiryId;
            document.getElementById('replyForm').action = '/admin/inquiry/' + inquiryId + '/reply';
            new bootstrap.Modal(document.getElementById('replyModal')).show();
        }
    </script>
</body>
</html>
