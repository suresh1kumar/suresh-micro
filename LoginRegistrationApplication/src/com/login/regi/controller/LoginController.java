package com.login.regi.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.regi.bean.RegisterBean;
import com.login.regi.service.LoginService;
import com.login.regi.serviceimpl.LoginServiceImpl;
@WebServlet("/LoginController")
public class LoginController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		boolean flag=false;
		String userEmail=req.getParameter("email");
		String userMobile=req.getParameter("mobile");
		
		RegisterBean registerBean=new RegisterBean();
		registerBean.setEmail(userEmail);
		registerBean.setMobile(userMobile);
		
		LoginService loginService=new LoginServiceImpl();
		try {
			flag=loginService.loginService(registerBean);
			//int userId=registerBean.getUid();
			if(flag) {
				System.out.println("login success.........");
				RequestDispatcher rd=req.getRequestDispatcher("website.jsp");
				rd.forward(req, res);
				
			}else {
				System.out.println("login falure.........");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, res);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
