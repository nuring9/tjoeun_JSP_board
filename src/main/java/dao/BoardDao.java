package dao;

import java.sql.*;
// sql 패키지전부 불러옴
import java.util.ArrayList;
import java.util.List;

import dto.BoardDto;

public class BoardDao {

	private String url = "jdbc:mysql://localhost:3306/jspboard?serverTimezone=Asia/Seoul&useSSL=false";
	// useSSL=false SSL 암호화 연결 끄기
	private String user = "root";
	private String password = "1234";

	// DB 연결 메서드
	private Connection getConnection() throws Exception {

		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(url, user, password);
	}

	// 글쓰기
	public void insert(BoardDto dto) throws Exception {
		String sql = "INSERT INTO board(title, content, writer) VALUES (?,?,?)";

		try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWriter());

			pstmt.executeUpdate();
		}
	}

	// 목록 조회
	public List<BoardDto> getList() throws Exception {

		List<BoardDto> list = new ArrayList<>();
		String sql = "SELECT * FROM board ORDER BY id DESC";

		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {

			while (rs.next()) {
				BoardDto dto = new BoardDto();
				dto.setId(rs.getInt("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWriter(rs.getString("writer"));
				dto.setRegdate(rs.getString("regdate"));

				list.add(dto);
			}
		}
		return list;
	}

   //  상세 조회
	public BoardDto getBoard(int id) throws Exception {
		
		String sql = "SELECT * FROM board WHERE id = ?";
		BoardDto dto = null;
		
		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDto();
				dto.setId(rs.getInt("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWriter(rs.getString("writer"));
				dto.setRegdate(rs.getString("regdate"));
			}
			
		}
		return dto;
	}

 
	// 글 수정
	public void update(BoardDto dto) throws Exception {
		
		String sql = "UPDATE board SET title = ?, content = ?, writer = ? WHERE id = ?";
		
		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWriter());
			pstmt.setInt(4, dto.getId());
			
			pstmt.executeUpdate();
		}
		
	}
	
	
	// 글 삭제
	public void delete(int id) throws Exception{
		
		String sql = "DELETE FROM board WHERE id = ?";
		
		try(Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		}
		
	}
}
