package com.cambio.org.board;

public class BoardDTO {

	private int num;
	private String title;
	private String content;
	private String moddate;
	private String writer;
	
	public BoardDTO() {}
	
	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", title=" + title + ", content=" + content + ", moddate=" + moddate
				+ ", writer=" + writer + "]";
	}
	public BoardDTO(int num, String title, String content, String moddate, String writer) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.moddate = moddate;
		this.writer = writer;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getModdate() {
		return moddate;
	}
	public void setModdate(String moddate) {
		this.moddate = moddate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
	
}
