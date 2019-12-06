package com.school.management.bean;

public class User {
	
	private int userid;
	private String userName;
	private String emaiId;
	private String mobileNumber;
	private String address;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmaiId() {
		return emaiId;
	}
	public void setEmaiId(String emaiId) {
		this.emaiId = emaiId;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", userName=" + userName + ", emaiId=" + emaiId + ", mobileNumber="
				+ mobileNumber + ", address=" + address + "]";
	}
	
	
	
	
	
}
