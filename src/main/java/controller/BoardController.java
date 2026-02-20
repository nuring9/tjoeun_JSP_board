package controller;

import dao.BoardDao;
import dto.BoardDto;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class BoardController extends HttpServlet {

	// GET 요청 처리 (목록, 상세, 삭제, write 페이지 이동)
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		try {
			BoardDao dao = new BoardDao();

			if (action == null || action.equals("list")) {
				// 목록 보기
				int page = 1;
				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}

				int pageSize = 10;
				int start = (page - 1) * pageSize;

				int totalCount = dao.getTotalCount();
				int totalPage = (int) Math.ceil((double) totalCount / pageSize);

				List<BoardDto> list = dao.getList(start, pageSize);

				request.setAttribute("list", list);
				request.setAttribute("currentPage", page);
				request.setAttribute("totalPage", totalPage);

				request.getRequestDispatcher("list.jsp").forward(request, response);
			} else if (action.equals("view")) {
				// 상세보기
				int id = Integer.parseInt(request.getParameter("id"));
				BoardDto dto = dao.getBoard(id);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("view.jsp").forward(request, response);
			} else if (action.equals("delete")) {
				// 삭제
				int id = Integer.parseInt(request.getParameter("id"));
				dao.delete(id);
				response.sendRedirect("board?action=list");
			} else if (action.equals("write")) {
				// 글쓰기 페이지 이동
				request.getRequestDispatcher("write.jsp").forward(request, response);
			} else if (action.equals("edit")) {
				// 수정 페이지 이동
				int id = Integer.parseInt(request.getParameter("id"));
				BoardDto dto = dao.getBoard(id);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("edit.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// POST 요청 처리(insert, update)
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		try {
			BoardDao dao = new BoardDao();

			if (action.equals("insert")) {
				// 글 저장
				BoardDto dto = new BoardDto();
				dto.setTitle(request.getParameter("title"));
				dto.setContent(request.getParameter("content"));
				dto.setWriter(request.getParameter("writer"));

				dao.insert(dto);
				response.sendRedirect("board?action=list");

			} else if (action.equals("update")) {
				// 수정 처리
				BoardDto dto = new BoardDto();
				dto.setId(Integer.parseInt(request.getParameter("id")));
				dto.setTitle(request.getParameter("title"));
				dto.setContent(request.getParameter("content"));
				dto.setWriter(request.getParameter("writer"));

				dao.update(dto);
				response.sendRedirect("board?action=list");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
