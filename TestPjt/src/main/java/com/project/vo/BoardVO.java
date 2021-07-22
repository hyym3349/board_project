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
	
}