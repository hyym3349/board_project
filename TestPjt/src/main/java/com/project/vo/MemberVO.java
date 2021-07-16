package com.project.vo;

import java.util.Date;

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
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserTell() {
		return userTell;
	}
	public void setUserTell(String userTell) {
		this.userTell = userTell;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public Date getUserRegdate() {
		return userRegdate;
	}
	public void setUserRegdate(Date userRegdate) {
		this.userRegdate = userRegdate;
	}
	public Date getUserEditdate() {
		return userEditdate;
	}
	public void setUserEditdate(Date userEditdate) {
		this.userEditdate = userEditdate;
	}
	@Override
	public String toString() {
		return "MemberVO [userNo=" + userNo + ", userId=" + userId + ", userPass=" + userPass + ", userName=" + userName
				+ ", userBirth=" + userBirth + ", userNick=" + userNick + ", userEmail=" + userEmail + ", userTell="
				+ userTell + ", userGender=" + userGender + ", userRegdate=" + userRegdate + ", userEditdate="
				+ userEditdate + "]";
	}
	
}