package com.curd.bean;

import java.io.Serializable;
import java.sql.Date;

public class Student implements Serializable{
	private int sid;
	private String name;
	private String mobile;
	private String email;
	private Date sdate;
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(int sid, String name, String mobile, String email, Date sdate) {
		super();
		this.sid = sid;
		this.name = name;
		this.mobile = mobile;
		this.email = email;
		this.sdate = sdate;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	@Override
	public String toString() {
		return "Student [sid=" + sid + ", name=" + name + ", mobile=" + mobile + ", email=" + email + ", sdate=" + sdate
				+ "]";
	}
	
	

}
