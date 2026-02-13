<%@ page contentType="text/html;charset=UTF-8" %>

<%
    // 처음 접속하면 게시판 목록으로 이동
    response.sendRedirect("board?action=list");
%>