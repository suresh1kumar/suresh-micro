package com.lwr.software.reporter.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.PathParam;

import com.lwr.software.reporter.DashboardConstants;
import com.lwr.software.reporter.admin.usermgmt.User;
import com.lwr.software.reporter.admin.usermgmt.UserManager;
import com.lwr.software.reporter.security.UserSecurityContext;
import com.lwr.software.reporter.utils.EncryptionUtil;

public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session=req.getSession();
		
		String zonename=req.getParameter("zoneName");
		String circlename=req.getParameter("regionName");
		String citynames=req.getParameter("cityName");
		
		/*@PathParam("zoneId") String zoneId,
		@PathParam("circleId") String circleId,
		@PathParam("cityId") String cityId*/
		
		
		System.out.println("zonename login ::"+zonename);
		System.out.println("circlename login ::"+circlename);
		System.out.println("cityname login ::"+citynames);
		
		String username = "admin";
		String password = "admin";
		//String username = (String) req.getParameter(DashboardConstants.USERNAME);
		//String password = (String) req.getParameter(DashboardConstants.PASSWORD);

		User user = UserManager.getUserManager().getUser(username);
		if(user == null){
			req.getSession().putValue("errmsg", "Invalid Username or Password. Try again!!");
			getServletContext().getRequestDispatcher("/login").forward(req, resp);
		}else if(!(password.equals(EncryptionUtil.decrypt(user.getPassword())))){
			req.getSession().putValue("errmsg", "Invalid Username or Password. Try again!!");
			/*getServletContext().getRequestDispatcher("/login").forward(req, resp);*/
			System.out.println("else if condation LoginServlet======");
			getServletContext().getRequestDispatcher("login.jsp").forward(req, resp);
		}else{
			Cookie cookie = new Cookie("username",user.getUsername()+"_0_"+user.getPassword()+"_0_"+user.getRole());
			cookie.setMaxAge(600);
			resp.addCookie(cookie);
			session.setAttribute("zonename", zonename);
			session.setAttribute("circlename", circlename);
			session.setAttribute("citynames", citynames);
			req.setAttribute("zonename",zonename);
			req.setAttribute("circlename",circlename);
			req.setAttribute("citynames",citynames);
			resp.sendRedirect("index2.jsp#/list/public");
		}
	}
}
