package com.login.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginActionDao;
import com.login.util.DBConnection;
import com.login.util.SQLQuery;
import com.login.util.SendMail;

@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	LoginActionDao loginActionDao=null;
	public void init(){
		loginActionDao=new LoginActionDao();
	}
	
	Connection con=null;
		PreparedStatement ps=null;
		PreparedStatement ps1=null;
		ResultSet rs = null;
	
	
	 public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{//throws ServletException, IOException {
	        doPost(req,res);
	     }
	 
	 public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException {
		 String sendOtp=req.getParameter("sendOtp");
		 HttpSession session=req.getSession();
		 
		 if(sendOtp !=null) {
	        	String s=loginActionDao.otpGenerator();
				SendMail.sendMail(sendOtp,s);
				session.setAttribute("otpSessionValue", s);
				
				
				try {
					con=DBConnection.createConnection();
					//String query = "update login set PASSWORD = ? where username = ?";
					ps = con.prepareStatement(SQLQuery.FORGET_PASSWORD);
					ps.setString(1,s);
					ps.setString(2,sendOtp);
					rs = ps.executeQuery();
					System.out.println("Your password forget Successfully?.");
				}catch (Exception sqe) {
					//out.println(sqe);
				}finally{
					try {
						rs.close();
						ps.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
    				
				}
	        }
	 }

}
