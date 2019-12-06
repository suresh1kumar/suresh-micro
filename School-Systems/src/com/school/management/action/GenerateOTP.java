package com.school.management.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/GenerateOTP")
public class GenerateOTP extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("**********************send otp servlet*****************************");
		HttpSession session=req.getSession();
		
		System.out.println("session-----------otp--------");

			String otp = req.getParameter("otp");
			
			System.out.println("otp :"+otp);
			System.out.println("otp :"+otp.toString());
				//if (name.equals(userdbName) && password.equals(userdbPsw) && usertype.equals(dbUsertype)) {
			String sessionOTP=session.getAttribute("otp").toString();
			
			String mobileN=session.getAttribute("mobile").toString();
			String Password=session.getAttribute("password").toString();
			
			System.out.println("session mobileN  ::"+mobileN);
			System.out.println("session Password  ::"+Password);
			System.out.println("session otpses sionOTP ::"+sessionOTP);
			
			int ss=sessionOTP.hashCode();
			System.out.println("-------------------------ss::"+ss);
				//if (otp.equals(sessionOTP)  ) {
			//if (otp==sessionOTP  ) {
				if((otp.equals(sessionOTP)) && sessionOTP.equals(otp)){
					System.out.println("otp getParameter :"+otp);
					System.out.println("otp getttingSession :"+sessionOTP);
					res.sendRedirect("home.jsp");
			} else{
				res.sendRedirect("otp.jsp");
			}
			
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

}
