<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>글쓰기</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
<div class="container mt-5">

    <div class="card shadow-sm border-dark">

        <!-- 상단 검정 헤더 -->
        <div class="card-header bg-dark text-white">
            <h5 class="mb-0">글쓰기</h5>
        </div>

        <div class="card-body">

            <form action="board" method="post">

                <input type="hidden" name="action" value="insert">

                <!-- 제목 -->
                <div class="mb-3">
                    <label class="form-label">제목</label>
                    <input type="text" name="title"
                           class="form-control" required>
                </div>

                <!-- 작성자 -->
                <div class="mb-3">
                    <label class="form-label">작성자</label>
                    <input type="text" name="writer"
                           class="form-control" required>
                </div>

                <!-- 내용 -->
                <div class="mb-3">
                    <label class="form-label">내용</label>
                    <textarea name="content"
                              class="form-control"
                              rows="6" required></textarea>
                </div>

                <!-- 버튼 -->
                <div class="text-end">
                    <button type="submit"
                            class="btn btn-dark"
                            onclick="return confirm('저장하시겠습니까?')">
                        저장
                    </button>

                    <button type="button"
                            class="btn btn-secondary"
                            onclick="location.href='board?action=list'">
                        목록
                    </button>
                </div>

            </form>

        </div>
    </div>

</div>
</body>
</html>
