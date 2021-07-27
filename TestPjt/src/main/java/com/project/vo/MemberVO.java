package com.project.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private int userNo;
	private String userId;
	private String userPass;
	private String userName;
	private String userBirth;
	private String userNick;
	private String userEmail;
	private String userTell;
	private String userGender;
	private Date userRegdate;
	private Date userEditdate;
	
	@Override
	public String toString() {
		return "MemberVO [userNo=" + userNo + ", userId=" + userId + ", userPass=" + userPass + ", userName=" + userName
				+ ", userBirth=" + userBirth + ", userNick=" + userNick + ", userEmail=" + userEmail + ", userTell="
				+ userTell + ", userGender=" + userGender + ", userRegdate=" + userRegdate + ", userEditdate="
				+ userEditdate + "]";
	}
	
}