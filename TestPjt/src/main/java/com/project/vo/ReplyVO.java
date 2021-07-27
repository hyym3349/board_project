package com.project.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private int bno;
	private int rno;
	private String content;
	private int userno;
	private Date regdate;
	private Date editdate;
	private String deleted;
	
	private String userName;
	
	@Override
	public String toString() {
		return "ReplyVO [bno=" + bno + ", rno=" + rno + ", content=" + content + ", userno=" + userno + ", regdate="
				+ regdate + ", editdate=" + editdate + ", deleted=" + deleted + ", userName=" + userName + "]";
	}
}
