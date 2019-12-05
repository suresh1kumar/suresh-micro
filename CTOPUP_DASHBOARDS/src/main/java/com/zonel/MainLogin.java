package com.zonel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zonel.DBConnection;

//@WebServlet("/MainLogin")
public class MainLogin extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String username =  req.getParameter("name");
		String password =  req.getParameter("password");
		System.out.println("LOGIN_ID ::"+username);
		System.out.println("password ::"+password);
		
		Connection con= null;
		PreparedStatement ps = null;
		Statement st=null;
		DBConnection db=new DBConnection();
		ResultSet rs = null;
		
		 String userdbName;
		 String userdbPsw;
		 
		//String query="select LOGIN_ID,mvoucher.des3_inline_decrypt(password,'12345678901234567890') as password  from mvclient.users_info"
				//+ " where login_id='" + LOGIN_ID + "'";
		String query ="select * from suresh where username=? and password=?";
		if((!(username.equals(null) || username.equals("")) && !(password.equals(null) || password.equals(""))) )
		{
		try{
		con=db.getConnection();

		ps = con.prepareStatement(query);
		System.out.println("query====::"+query);
		ps.setString(1, username);
		ps.setString(2, password);
		System.out.println("--------------------------1");
		
		rs = ps.executeQuery();
		if(rs.next())
		{
			System.out.println("rs inside------------");
			userdbName = rs.getString("username");
			userdbPsw = rs.getString("password");
			String logpage="/JSP/login.jsp";
			System.out.println("loginpage ::"+logpage);
			System.out.println("userdbName 111::"+userdbName);
			System.out.println("userdbPsw 111::"+userdbPsw);
			if(username.equals(userdbName) && password.equals(userdbPsw) )
			{
			System.out.println("userdbName ::"+userdbName);
			System.out.println("userdbPsw  ::"+userdbPsw);
			System.out.println(":000000000000if condation0000000000:");
			session.setAttribute("userdbName",userdbName);
		
			resp.sendRedirect("login.jsp");
		//resp.sendRedirect("index1.jsp");
		}
		}
		else
		resp.sendRedirect("error.jsp");
		rs.close();
		ps.close();
		}
		catch(SQLException sqe)
		{
		//out.println(sqe);
		}
		}
		else
		{
		/*%>
		<center><p style="color:red">Error In Login</p></center>
		<%*/
		//getServletContext().getRequestDispatcher("/home.jsp").include(req,resp);
		resp.sendRedirect("/index.jsp");
		}
	//	%>
	}

}
