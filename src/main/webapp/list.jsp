<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dto.BoardDto" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container mt-5">
    <div class="card shadow-sm border-dark overflow-hidden">
        <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
            <h5 class="mb-0">게시판 목록</h5>
            <a href="board?action=write" class="btn btn-sm btn-light">글쓰기</a>
        </div>

        <div class="card-body p-0">
            <table class="table table-hover text-center align-middle mb-0">
                <thead>
                    <tr>
                        <th style="width:10%">번호</th>
                        <th style="width:45%">제목</th>
                        <th style="width:15%">작성자</th>
                        <th style="width:20%">작성일</th>
                        <th style="width:10%">삭제</th>
                    </tr>
                </thead>
                <tbody>
<%
    // Controller에서 보낸 "list" 속성을 가져옵니다.
    List<BoardDto> list = (List<BoardDto>) request.getAttribute("list");

    // 리스트가 존재하고 비어있지 않은지 확인
    if (list != null && !list.isEmpty()) {
        for (BoardDto dto : list) {
%>
                    <tr>
                        <td><%= dto.getId() %></td>
                        <td class="text-start">
                            <%-- 제목 클릭 시 상세 페이지 이동 --%>
                            <a href="board?action=view&id=<%= dto.getId() %>" 
                               class="d-block text-decoration-none text-dark fw-bold">
                                <%= dto.getTitle() %>
                            </a>
                        </td>
                        <td><%= dto.getWriter() %></td>
                        <td><%= dto.getRegdate() %></td>
                        <td>
                            <a href="board?action=delete&id=<%= dto.getId() %>" 
                               class="btn btn-sm btn-outline-danger"
                               onclick="return confirm('정말 삭제하시겠습니까?')">
                               삭제
                            </a>
                        </td>   
                    </tr>
<%
        }
    } else {
%>
                    <%-- 데이터가 없을 경우 출력될 행 --%>
                    <tr>
                        <td colspan="5" class="py-5 text-muted">등록된 게시글이 없습니다.</td>
                    </tr>
<%
    }
%>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>