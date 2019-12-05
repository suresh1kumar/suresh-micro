package com.login.regi.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.regi.daoImpl.StudentDaoImpl;
@WebServlet("/EnableDisableUser")
public class EnableDisableUser extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	
		String sAction=req.getParameter("saction");
		String sid=req.getParameter("sid");
		
		if(sAction.equals("Enable")) {
			sAction="Disable";
		}
		else {
			sAction="Enable";
		}
		
		System.out.println(sAction);
		System.out.println(sid);
		StudentDaoImpl stddao=new StudentDaoImpl();
		int result=stddao.updateAction(sAction,Integer.parseInt(sid));
	 System.out.println(result);
//		if(result>0) {
			res.sendRedirect("/RecourdView/GetStudentRecourd");
//		}
	}

}
