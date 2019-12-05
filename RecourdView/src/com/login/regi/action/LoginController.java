package com.login.regi.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.regi.bean.RegisterBean;
import com.login.regi.service.LoginService;
import com.login.regi.serviceImpl.LoginServiceImpl;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int flag=0;
		PrintWriter printWriter=res.getWriter();
		res.setContentType("text/html");
		String userEmail=req.getParameter("email");
		String userMobile=req.getParameter("mobile");
		
		RegisterBean registerBean=new RegisterBean();
		registerBean.setEmail(userEmail);
		registerBean.setMobile(userMobile);
		
		LoginService loginService=new LoginServiceImpl();
		try {
			flag=loginService.loginService(registerBean);
			//int userId=registerBean.getUid();
			System.out.println(flag);
			if(flag>0) {
				printWriter.print("login success.........");
				RequestDispatcher rd=req.getRequestDispatcher("website.jsp");
				rd.forward(req, res);
				
			}else {
				printWriter.print("login falure.........");
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
