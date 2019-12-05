package com.zonel;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	
	 static final String URL= "jdbc:oracle:thin:@172.22.0.199:1521:ctopup"; 
	 //static final String URL= "jdbc:oracle:thin:@41.223.76.74:1521:etopup";
	    static final String DATABASE_NAME="ctopup";
	    static final String USERNAME="mvoucher";
	    static final String PASSWORD="mvoucher";
	    
	    public Connection getConnection(){
	        Connection con=null;
	        System.out.println("*******************DB Connection ***********************");
	        try{
	        	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	            con=DriverManager.getConnection(URL,USERNAME,PASSWORD);
	 System.out.println("connection con ::"+con);
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	        
	        return con;
	    }

}
