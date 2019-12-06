package com.school.management.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.school.management.bean.User;
import com.school.management.dao.LoginActionDao;
import com.school.management.util.JsonUtil;


@WebServlet("/UserRegistrations")
public class UserRegistrations extends HttpServlet{
	
	LoginActionDao productService=null;
	public void init(){
		productService=new LoginActionDao();
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("*********************<<servlet Add>>**************************");
		
		//userName,emaiId,mobileNumber,address
		
		String userName=req.getParameter("userName");
		String emaiId=req.getParameter("emaiId");
		String mobileNumber=req.getParameter("mobileNumber");
		String address=req.getParameter("address");
		
		System.out.println("userName ::"+userName);
		System.out.println("emaiId ::"+emaiId);
		System.out.println("mobileNumber ::"+mobileNumber);
		System.out.println("address ::"+address);
		
		User users=new User();
		
		users.setUserName(userName);
		users.setEmaiId(emaiId);
		users.setMobileNumber(mobileNumber);
		users.setAddress(address);
		boolean boovar;
		try {
			boovar = productService.addUserRegistration(users);
			String list = String.valueOf(boovar);
			String jsonProductList=JsonUtil.convertJavaToJson(list);
			System.out.println("controller ::"+jsonProductList);
			res.setContentType("application/json");
			res.getWriter().write(jsonProductList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
