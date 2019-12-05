package com.lwr.software.reporter.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lwr.software.reporter.DashboardConstants;
import com.lwr.software.reporter.admin.usermgmt.User;
import com.lwr.software.reporter.admin.usermgmt.UserManager;
import com.lwr.software.reporter.security.UserSecurityContext;
import com.lwr.software.reporter.utils.EncryptionUtil;
import com.report.login.LoginDAO;

public class LoginServlet extends HttpServlet {

	//@SuppressWarnings("unused")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		System.out.println("*******************action Servlet*******************");
		/*String un=req.getParameter("username");
		String pw=req.getParameter("password");
		System.out.println("getParameter username ::"+un);
		System.out.println("getParameter password ::"+pw);
		User user=new User();
		
		user.setUsername(un);
		user.setPassword(pw);
		
		LoginDAO loginDAO=new LoginDAO();
		user=loginDAO.loginCheck(un,pw);
		
		String u=user.getUsername();
		String p=user.getPassword();
		System.out.println("getUser ::"+u);
		System.out.println("getpassword ::"+p);
		
		System.out.println("method data in action ::"+user.toString());
		if (u.equals(null) && u.equals(user.getUsername()) ){
		//if(u==null){
			System.out.println("1.........");
			req.getSession().putValue("errmsg", "Invalid Username or Password. Try again!!");
			getServletContext().getRequestDispatcher("/login").forward(req, resp);
			
		}else if (pw.equals(null) && pw.equals(user.getPassword()) ){
			System.out.println("2.........");
			req.getSession().putValue("errmsg", "Invalid Username or Password. Try again!!");
			getServletContext().getRequestDispatcher("/login").forward(req, resp);
		}else{
			System.out.println("3.........");
			Cookie cookie = new Cookie("username",user.getUsername()+"_0_"+user.getPassword()+"_0_"+user.getRole());
			System.out.println("COOKIE  === ::"+cookie);
			cookie.setMaxAge(600);
			//if (cookie != null) {
			//resp.addCookie(cookie);
			//}
			resp.sendRedirect("index.html#/list/public");
		}*/
		
		
		String username = (String) req.getParameter(DashboardConstants.USERNAME);
		String password = (String) req.getParameter(DashboardConstants.PASSWORD);

		User user = UserManager.getUserManager().getUser(username);
		if(user == null){
			req.getSession().putValue("errmsg", "Invalid Username or Password. Try again!!");
			getServletContext().getRequestDispatcher("/login").forward(req, resp);
		}else if(!(password.equals(EncryptionUtil.decrypt(user.getPassword())))){
			req.getSession().putValue("errmsg", "Invalid Username or Password. Try again!!");
			getServletContext().getRequestDispatcher("/login").forward(req, resp);
		}else{
			
			Cookie cookie = new Cookie("username",user.getUsername()+"_0_"+user.getPassword()+"_0_"+user.getRole());
			//Cookie cookie1 = new Cookie("username",user.getUsername()+"_0_"+user.getPassword()+"_0_"+rol);
			//Cookie cookie = new Cookie("username",user.getUsername()+"_0_"+user.getPassword());
			cookie.setMaxAge(600);
			resp.addCookie(cookie);
			resp.sendRedirect("index.html#/list/public");
		}
	}
}
