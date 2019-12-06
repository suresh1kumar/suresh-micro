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
import com.login.regi.service.RegisterService;
import com.login.regi.serviceimpl.RegisterServiceImpl;
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		boolean flag=false;
		String userName=req.getParameter("uname");
		String email=req.getParameter("email");
		String mobile=req.getParameter("mobile");
		
		RegisterBean registerBean=new RegisterBean();
		registerBean.setUname(userName);
		registerBean.setEmail(email);
		registerBean.setMobile(mobile);
		
		RegisterService registerService=new RegisterServiceImpl();
		try {
			flag=registerService.getRegister(registerBean);
			if(flag) {
				System.out.println("register successfull..........");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, res);
			}else {
				System.out.println("register falure........");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
