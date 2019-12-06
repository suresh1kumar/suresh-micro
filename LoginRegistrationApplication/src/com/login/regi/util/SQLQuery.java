package com.login.regi.util;

public class SQLQuery {
	 
	public static final String LOGIN_USER="select register.email,register.mobile from register where register.email=? and register.mobile=?";

	public static final String REGISTER_USER = "insert into register(uid,uname,email,mobile) values (NULL,?,?,?)";
	//public static final String INSERT_STUDENT = "insert into student(studentId,studentName,Qualification,gender,joinDate) values (NULL,?,?,?,?)";
	public static final String INSERT_PERSONAL_DETAILS="insert into studentrecord values(default,?,?,?,?)";
	
	public static final String GET_ALL_PERSONAL_DETAILS="select * from studentrecord where studentId=?";
}
