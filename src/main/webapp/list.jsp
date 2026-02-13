<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dto.BoardDto" %>

<html>
<head>
<title>게시판 목록</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/style.css">

</head>
<body>

<div class="container mt-5">

    <h2 class="text-center mb-4">게시판 목록</h2>

    <div class="text-end mb-3">
        <a href="board?action=write" class="btn btn-dark">글쓰기</a> 
    </div>

    <table class="table table-bordered table-hover text-center align-middle">
        <thead class="table-dark">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>

<%
  List<BoardDto> list = (List<BoardDto>) request.getAttribute("list");

  if(list != null){
      for(BoardDto dto : list) {
%>
            <tr>
                <td><%= dto.getId() %></td>
                <td class="text-start">
                    <a href="board?action=view&id=<%= dto.getId() %>"
                       class="text-decoration-none">
                        <%= dto.getTitle() %>
                    </a>
                </td>
                <td><%= dto.getWriter() %></td>
                <td><%= dto.getRegdate() %></td>
                <td>
                    <a href="board?action=delete&id=<%= dto.getId() %>"
                       class="btn btn-sm btn-danger"
                       onclick="return confirm('정말 삭제하시겠습니까?')">
                       삭제
                    </a>
                </td>
            </tr>
<%
      }
  }
%>

        </tbody>
    </table>

</div>

</body>
</html>
