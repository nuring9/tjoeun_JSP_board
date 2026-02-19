<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.BoardDto" %>
<%
    // Controller에서 보낸 "dto" 객체를 가져옵니다.
    BoardDto dto = (BoardDto) request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="card shadow-sm border-dark">
        <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
            <h5 class="mb-0">게시글 상세보기</h5>
            <span class="badge bg-secondary">번호: <%= dto.getId() %></span>
        </div>

        <div class="card-body">
            <div class="mb-4 pb-2 border-bottom">
                <h3 class="fw-bold"><%= dto.getTitle() %></h3>
                <div class="text-muted small d-flex justify-content-between">
                    <span>작성자: <strong><%= dto.getWriter() %></strong></span>
                    <span>작성일: <%= dto.getRegdate() %></span>
                </div>
            </div>

            <div class="mb-5" style="min-height: 200px; white-space: pre-wrap;"><%= dto.getContent() %></div>

            <div class="text-end border-top pt-3">
                <a href="board?action=edit&id=<%= dto.getId() %>" class="btn btn-dark">수정하기</a>
                <a href="board?action=delete&id=<%= dto.getId() %>" 
                   class="btn btn-outline-danger" 
                   onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
                <a href="board?action=list" class="btn btn-secondary">목록으로</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>