package dto;

public class BoardDto {
	private int id;
	private String title;
	private String content;
	private String writer;
	private String regdate;

	// 기본생성자
	public BoardDto() {
	}

	// 전체 생성자
	public BoardDto(int id, String title, String content, String writer, String regdate) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
