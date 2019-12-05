package com.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.login.util.DBConnection;
import com.login.util.SQLQuery;

public class LoginActionDaoImpl {
	
	public String otpGenerator() 
	{ 
	    String numbers = "0123456789"; 
	    String x="";
	    Random rndm_method = new Random(); 
	    char[] otp = new char[4]; 
	    
	    for (int i = 0; i <4; i++) 
	    { 
	        otp[i]=numbers.charAt(rndm_method.nextInt(numbers.length())); 
	        x=x+otp[i];
	    } 
	    return x; 
	}
	
	
	public List changeLoginDB(String newPassword,String userName,String oldPassword) throws SQLException {
		System.out.println("*********************<<getLoginDB  DAO>>**************************");
		Connection con=null;
	    Statement st=null;
	    ResultSet rs=null;
	    
	    PreparedStatement ps = null;
	    System.out.println("newPassword ::"+newPassword);
	    System.out.println("userName ::"+userName);
	    
		List list = new ArrayList();
	    try {
	    	con=DBConnection.createConnection();
	    //	 String CHANGE_LOGIN_USER = "update login set password= ? where username=? and password= ?";
	    	
String query="update mvclient.users_info set password = MVOUCHER.des3_inline_encrypt('"+newPassword+"','12345678901234567890')"
			+ " where login_id = '"+userName+"' ";
	    	ps = con.prepareStatement(query);
	    	ps.setString(1,newPassword);
            ps.setString(2, userName);
            ps.setString(3, oldPassword);
            System.out.println("---------------------444444444444");
            rs = ps.executeQuery();
	    } catch (SQLException ex) {
	        Logger.getLogger(LoginActionDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	        return null;
	    } finally {
	        if (con != null) {
	            try {
	                con.close();
	            } catch (SQLException ex) {
	                Logger.getLogger(LoginActionDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
	        if (st != null) {
	            try {
	                st.close();
	            } catch (SQLException ex) {
	                Logger.getLogger(LoginActionDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
	    }
		return list;
	}
	
	public String sendSMS(String strNumbers,int rqstDelivery,String shortMessage,String senderNumber) throws SQLException {
		System.out.println("*********************<<getLoginDB  DAO>>**************************");
		 Statement st=null;
	     ResultSet  rs=null;
		 Connection con=null;
	     PreparedStatement ps = null;
	     String strSenders="",query="";
	     int intRqStd=0;
	    try {
	    	con=DBConnection.createConnection();
	    	//ps = con.prepareStatement(SQLQuery.CHANGE_LOGIN_USER);
	    	st = con.createStatement();
            rs=st.executeQuery("select sender_number from system_info where rownum = 1");
            while(rs.next()){
            	strSenders=rs.getString(1);
                /*if(strMyList.equals("Me2uCustomers")){
                      strSenders=rsSender.getString(2);
                }
                else if(strMyList.equals("Dealers")){
                      strSenders=rsSender.getString(1);
                }*/
              }
               intRqStd=1;
               query="INSERT INTO SHORT_MESSAGES (MSISDN, RQST_DELIVERY , TIME_STAMP, SHORT_MESSAGE , sender_number)" +
                  		" VALUES ('"+strNumbers+ "', "+rqstDelivery+" , sysdate, '"+shortMessage+"','"+strSenders+"')";
                   System.out.println(query);
                   int e=st.executeUpdate(query);
                  
	    } catch (SQLException ex) {
	        Logger.getLogger(LoginActionDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	        return null;
	    } finally {
	        if (con != null) {
	            try {
	                con.close();
	            } catch (SQLException ex) {
	                Logger.getLogger(LoginActionDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
	        if (st != null) {
	            try {
	                st.close();
	            } catch (SQLException ex) {
	                Logger.getLogger(LoginActionDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
	    }
	    return "Success";
	}
	
	


}
