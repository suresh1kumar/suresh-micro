package com.angularjs.report.mvoucher;

import java.sql.Date;

public class ReportBean
{
	private String studentId;
	private String studentName;
	private String qualification;
	private String gender;
	private String joinDate;
	private String uaction;
	public ReportBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getUaction() {
		return uaction;
	}
	public void setUaction(String uaction) {
		this.uaction = uaction;
	}
	@Override
	public String toString() {
		return "ReportBean [studentId=" + studentId + ", studentName=" + studentName + ", qualification="
				+ qualification + ", gender=" + gender + ", joinDate=" + joinDate + ", uaction=" + uaction + "]";
	}
	
	
  
 
}