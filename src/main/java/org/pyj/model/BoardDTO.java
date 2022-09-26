package org.pyj.model;

import java.util.ArrayList;

public class BoardDTO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String regdate;
	private int count;
	private String id;
	
	private ArrayList<AttachFileDTO> attach;
	
	
	public ArrayList<AttachFileDTO> getAttach() {
		return attach;
	}
	public void setAttach(ArrayList<AttachFileDTO> attach) {
		this.attach = attach;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regdate=" + regdate + ", count=" + count + ", id=" + id + ", attach=" + attach + "]";
	}
	
	
}
