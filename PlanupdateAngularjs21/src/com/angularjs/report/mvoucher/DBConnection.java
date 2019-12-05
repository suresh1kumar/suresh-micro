package com.angularjs.report.mvoucher;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection createConnection()
	{
	Connection con = null;
   
	String url = "jdbc:oracle:thin:@172.22.0.199:1521:ctopup"; 
	String username = "mvoucher"; 
	String password = "mvoucher"; 
	try 
	{
	try 
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	//Class.forName("com.mysql.jdbc.Driver"); 
	} 
	catch (ClassNotFoundException e)
	{
	e.printStackTrace();
	}
	con = DriverManager.getConnection(url, username, password);
	System.out.println("Printing connection object "+con);
	} 
	catch (Exception e) 
	{
	e.printStackTrace();
	}
	return con; 
	}

}
