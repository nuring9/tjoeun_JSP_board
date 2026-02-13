<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="dto.BoardDto"%>

<%
BoardDto dto = (BoardDto) request.getAttribute("dto");
%>

<!DOCTYPE html>
<html>
<head>
<title>게시글 상세보기</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>
	<div class="container mt-5">

		<h2 class="text-center mb-4">게시글 상세보기</h2>

		<div class="card shadow-sm border-dark">

			<!-- 상단 검정 배경 -->
			<div class="card-header bg-dark text-white">
				<h5 class="mb-0"><%=dto.getTitle()%></h5>
			</div>

			<div class="card-body">

				<div class="row mb-3">
					<div class="col-md-4">
						<strong>번호</strong> :
						<%=dto.getId()%></div>
					<div class="col-md-4">
						<strong>작성자</strong> :
						<%=dto.getWriter()%></div>
					<div class="col-md-4">
						<strong>작성일</strong> :
						<%=dto.getRegdate()%></div>
				</div>

				<hr>

				<div class="mb-4">
					<pre class="fs-6"><%=dto.getContent()%></pre>
				</div>

				<div class="text-end">
					<a href="board?action=list" class="btn btn-secondary">목록</a> 
					<a href="board?action=write" class="btn btn-dark">글쓰기</a> 
					<a href="board?action=edit&id=<%=dto.getId()%>" class="btn btn-dark"
						onclick="return confirm('수정하시겠습니까?')"> 수정 </a> 
				    <a href="board?action=delete&id=<%=dto.getId()%>"
						class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?')">
						삭제 </a>
				</div>

			</div>
		</div>

	</div>
</body>
</html>
