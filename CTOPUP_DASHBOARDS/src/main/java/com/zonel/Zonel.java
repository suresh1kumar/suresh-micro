package com.zonel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Zonel {
		static final String URL= "jdbc:oracle:thin:@172.22.0.199:1521:ctopup"; 
		static final String USER = "mvoucher";
		static final String PASS = "mvoucher";
	    
	    public  String getCircle(String circle){
		//public static void main(String[] args) {
	    System.out.println("*******************DB Connection ***********************");
	    Connection conn = null;
	    Statement stmt = null;
	    String circlename ="";
	   try{
		   Class.forName("oracle.jdbc.driver.OracleDriver"); 
	      System.out.println("Connecting to a selected database...");
	      conn = DriverManager.getConnection(URL, USER, PASS);
	      System.out.println("Connected database successfully...");
	      
	      System.out.println("Creating statement...");
	      stmt = conn.createStatement();
	     // String sql="select  R_SHORTNAME,R_FULLNAME from mvclient.TBL_REGION where R_FULLNAME='Chennai'";
	      String sql="select  R_SHORTNAME,R_FULLNAME from mvclient.TBL_REGION where R_FULLNAME='"+circle+"'";
	      System.out.println("query_zonel ::"+sql);
	      ResultSet rs = stmt.executeQuery(sql);
	     // while(rs.next()){
	    	  rs.next();
	          circlename = rs.getString("R_FULLNAME");
	         System.out.print(", circlename:: " + circlename+"\n");
	     // }
	         System.out.println("eeeeeeeeeeeeeeeeeeeeee ::"+circlename);
	      rs.close();
	   }catch(SQLException se){
	      se.printStackTrace();
	   }catch(Exception e){
	      e.printStackTrace();
	   }finally{
	      try{
	    	 
	         if(stmt!=null)
	            conn.close();
	      }catch(SQLException se){
	      }
	      try{
	         if(conn!=null)
	            conn.close();
	      }catch(SQLException se){
	         se.printStackTrace();
	      }
	   }//end try
	   System.out.println("Goodbye!");
	//return conn;
	return circlename;
	}//end main
	    
	    public  String getZone(String zonenae){
			//public static void main(String[] args) {
		    System.out.println("*******************DB Connection ***********************");
		    Connection conn = null;
		    Statement stmt = null;
		    String zonename ="";
		   try{
			   Class.forName("oracle.jdbc.driver.OracleDriver"); 
		      System.out.println("Connecting to a selected database...");
		      conn = DriverManager.getConnection(URL, USER, PASS);
		      System.out.println("Connected database successfully...");
		      
		      System.out.println("Creating statement...");
		      stmt = conn.createStatement();
		      String sql="select  R_SHORTNAME,R_FULLNAME from mvclient.TBL_REGION where R_FULLNAME='"+zonenae+"'";
		      System.out.println("query_zonel ::"+sql);
		      ResultSet rs = stmt.executeQuery(sql);
		     // while(rs.next()){
		    	  rs.next();
		          zonename = rs.getString("R_FULLNAME");
		         System.out.print(", zonename:: " + zonename+"\n");
		     // }
		         System.out.println("eeeeeeeeeeeeeeeeeeeeee ::"+zonename);
		      rs.close();
		   }catch(SQLException se){
		      se.printStackTrace();
		   }catch(Exception e){
		      e.printStackTrace();
		   }finally{
		      try{
		    	 
		         if(stmt!=null)
		            conn.close();
		      }catch(SQLException se){
		      }
		      try{
		         if(conn!=null)
		            conn.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }
		   }//end try
		   System.out.println("Goodbye!");
		//return conn;
		return zonename;
		}//end main
	}//end


