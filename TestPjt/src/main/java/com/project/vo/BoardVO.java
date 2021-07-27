package com.project.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int hit;
	private Date editdate;
	private String editor;
	private String deleted;
	
	private int RNUM;
	private String userName;
	
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", hit=" + hit + ", editdate=" + editdate + ", editor=" + editor + ", deleted=" + deleted
				+ ", RNUM=" + RNUM + ", userName=" + userName + "]";
	}
}