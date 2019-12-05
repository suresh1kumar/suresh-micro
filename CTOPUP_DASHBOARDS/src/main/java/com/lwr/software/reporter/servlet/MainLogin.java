package com.lwr.software.reporter.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.PathParam;

import com.lwr.software.reporter.admin.usermgmt.User;
import com.lwr.software.reporter.admin.usermgmt.UserManager;
import com.lwr.software.reporter.utils.EncryptionUtil;
import com.zonel.DBConnection;

//@WebServlet("/MainLogin")
public class MainLogin extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		String login_ids =  req.getParameter("name");
		String passwords =  req.getParameter("password");
		System.out.println("LOGIN_ID ::"+login_ids);
		System.out.println("password ::"+passwords);
		
		String z= (String)session.getAttribute("zoneId");
		String cr = (String)session.getAttribute("regionId");
		String ct = (String)session.getAttribute("cityId");
		
		System.out.println("main login servlet session.getAttribute zone ::"+z);
		System.out.println("main login servlet session.getAttribute circle ::"+cr);
		System.out.println("main login servlet session.getAttribute city ::"+ct);
		
		String zonename = (String)session.getAttribute("zonename"); 
		String circlename = (String)session.getAttribute("circlename");
		String cityname = (String)session.getAttribute("citynames"); 
		
		
		System.out.println("main login servlet session.getAttribute zone ::"+zonename);
		System.out.println("main login servlet session.getAttribute circle ::"+circlename);
		System.out.println("main login servlet session.getAttribute city ::"+cityname);
		
		Connection con= null;
		PreparedStatement ps = null;
		Statement st=null;
		DBConnection db=new DBConnection();
		ResultSet rs = null;
		String userdbName;
		String userdbPsw;
		 
//0000000000000000000000000000000000000000000 zonename,circlename,cityname
		if (login_ids.equalsIgnoreCase("admin") && passwords.equalsIgnoreCase("admin")) {
			//String username = (String) req.getParameter(DashboardConstants.USERNAME);
			//String password = (String) req.getParameter(DashboardConstants.PASSWORD);
			System.out.println("****************Admin Login Validation if condation *************************");
			User user = UserManager.getUserManager().getUser(login_ids);
			if(user == null){
				req.getSession().putValue("errmsg", "Invalid Username or Password. Try again!!");
				getServletContext().getRequestDispatcher("/login").forward(req, resp);
			}else if(!(passwords.equals(EncryptionUtil.decrypt(user.getPassword())))){
				req.getSession().putValue("errmsg", "Invalid Username or Password. Try again!!");
				getServletContext().getRequestDispatcher("/login").forward(req, resp);
			}else{
				Cookie cookie = new Cookie("username",user.getUsername()+"_0_"+user.getPassword()+"_0_"+user.getRole());
				cookie.setMaxAge(600);
				resp.addCookie(cookie);
				session.setAttribute("userdbName",login_ids);
				req.setAttribute("passwords",passwords);
				session.setAttribute("passwords",passwords);
				req.setAttribute("userdbName",login_ids);
				resp.sendRedirect("index2.jsp#/list/public");
			}
		}else{
//00000000000000000000000000000000000000000000
			/*@PathParam("zoneId") String zoneId,
			@PathParam("circleId") String circleId,
			@PathParam("cityId") String cityId
			*/
		String query="select LOGIN_ID,mvoucher.des3_inline_decrypt(password,'12345678901234567890') as password  from mvclient.users_info where login_id=?";
		if((!(login_ids.equals(null) || login_ids.equals("")) && !(passwords.equals(null) || passwords.equals(""))) )
		{
		try{
		System.out.println("****************First Login Validation if condation *************************");
		con=db.getConnection();
		ps = con.prepareStatement(query);
		System.out.println("login query ::"+query);
		System.out.println("LOGIN_ID ::"+login_ids);
		System.out.println("password ::"+passwords);
		ps.setString(1, login_ids);
		//ps.setString(2, passwords);
		
		rs = ps.executeQuery();
		if(rs.next())
		{
			System.out.println("*************inside rs *************");
			//userdbName = rs.getString(1);
			//userdbPsw = rs.getString(2);
			userdbName = rs.getString("LOGIN_ID");
			userdbPsw = rs.getString("password");
			System.out.println("userdbName 111::"+userdbName);
			System.out.println("userdbPsw 111::"+userdbPsw);
			
			//if(LOGIN_ID.equals(userdbName) && password.equals(userdbPsw) )
			if(login_ids.equals(userdbName) ){
				System.out.println("**************************** <<Login Validation Success>> ************************");
				System.out.println("userdbName ::"+userdbName);
				System.out.println("userdbPsw  ::"+userdbPsw);
				session.setAttribute("userdbName",userdbName);
				req.setAttribute("userdbName",userdbName);
			
				resp.sendRedirect("login.jsp");
			} else{
				req.setAttribute("errmsg","Invalid Username or Password. Try again!!");
				req.getSession().putValue("errmsg", "Invalid Username or Password. Try again!!");
				resp.sendRedirect("homelogin.jsp");
			}
		}
		else
		resp.sendRedirect("error.jsp");
		rs.close();
		ps.close();
		}
		catch(SQLException sqe)
		{
		sqe.printStackTrace();
		}
		}
		}
		/*else
		{
			req.setAttribute("errmsg"," Username or Password not match in database. Try again!!");
			resp.sendRedirect("homelogin.jsp");
		}*/
	}

}
