package com.login.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginActionDao;
import com.login.util.SendMail;

@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {

private static final long serialVersionUID = 1L;
	
	LoginActionDao loginActionDao=null;
	public void init(){
		loginActionDao=new LoginActionDao();
	}
   public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException {
        doPost(req,res);
     }

  public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException {
	  System.out.println("*************************<< ChangePassword Action>>*************************");
        	 HttpSession session=req.getSession();
        	 String sendOtp=req.getParameter("sendOtp");
        	 String conformOtp=req.getParameter("conformOtp");
        	 String sessionOTP=(String)session.getAttribute("otpSessionValue");  
        	 
        	 System.out.println("change password Action--------------------sessionOTP otpSessionValue::"+sessionOTP);
        	
        	 LoginActionDao loginDao=new LoginActionDao();
	         String username=(String)session.getAttribute("name");  
	         String pasword=(String)session.getAttribute("pass");
	
	         String oldpwd=req.getParameter("oldpassword");
	         String newpswd=req.getParameter("newpassword");
	         String cpswd=req.getParameter("conformpassword");
	        
			
	         System.out.println("pasword session::"+pasword);
	         System.out.println("username session::"+username);
	         System.out.println("oldpwd::"+oldpwd);
	         System.out.println("newpswd::"+newpswd);
	         System.out.println("cpswd::"+cpswd);
	       
	        int rqstDelivery=0;
	        if(sendOtp !=null) {
	        	String s=loginActionDao.otpGenerator();
	        	try {
	        		String shortMessage="Dear Customer," + s +  "is your one time password (OTP). Please enter the OTP to proceeed .Thank you,BSNL CTOPUP";
	        		// String shortMessage="This is your one time OTP ::"+s;
					loginActionDao.sendSMS(sendOtp, rqstDelivery, shortMessage, s);
					//SendMail.sendMail(username,s);
					session.setAttribute("otpSessionValue", s);
					System.out.println("-_-_-________----------__________-------");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
	        } else if (conformOtp.equals(sessionOTP)) {
	        
	        	System.out.println("Your are success validate OTP?.");
	        	
	        } else if (newpswd.equals(cpswd)) {
        		System.out.println("------------------------------111111111");
        		try {
        		if (oldpwd.equals(pasword) ) {
        			loginDao.changeLoginDB(newpswd, username, pasword);
					System.out.println("Your password Change Successfully?.");
				}
        	 } catch (SQLException sqe) {
				//out.println(sqe);
			}finally{
				
			}
          } 
	        	
	        	
  		}
}


