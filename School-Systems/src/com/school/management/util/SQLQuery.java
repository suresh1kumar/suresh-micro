package com.school.management.util;

public class SQLQuery {
	//username ,mobile ,password 
	public static final String LOGIN_USER="select username,password  from login where username=? and password=?";

	public static final String CHANGE_LOGIN_USER = "update login set password= ? where username=? and password= ?";
	
	public static final String FORGET_PASSWORD = "update login set PASSWORD = ? where username = ?";
	public static final String REGISTER_USER = "insert into register(uid,uname,email,mobile) values (NULL,?,?,?)";
	

}
