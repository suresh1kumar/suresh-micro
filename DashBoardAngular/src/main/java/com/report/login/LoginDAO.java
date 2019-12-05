package com.report.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.lwr.software.reporter.admin.usermgmt.User;
 
public class LoginDAO {
	 public User loginCheck(String LOGIN_ID,String password){   //,String user_Id,String password){
	    	
	    	String query="select LOGIN_ID,mvoucher.des3_inline_decrypt(password,'12345678901234567890') as password  from mvclient.users_info"
	    					+ " where login_id='" + LOGIN_ID + "'";
	    	System.out.println("*****************login Dao*************************");
	        try{
	            Connection con=DBConnection.getConnection();
	            PreparedStatement ps=con.prepareStatement(query);
	          
	            System.out.println("query ::"+query);
	            System.out.println("00000000000000000000000000111111");
	            ResultSet rs=ps.executeQuery();
	            
	            if(rs.next()){
	            	User user=new User();
	            	
	            	//user.setLOGIN_ID(rs.getString("lOGIN_ID"));
	            	user.setUsername(rs.getString("lOGIN_ID"));
	            	user.setPassword(rs.getString("password"));
	            	System.out.println(rs.getString(1));
	            	System.out.println(rs.getString(2));
	                return user;
	                
	            }
	            else{
	                //return ;
	            }
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	        
	        return null;
	    }
	}