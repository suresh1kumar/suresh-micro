package com.school.management.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.school.management.dao.LoginActionDao;

@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet{
		
	private static final long serialVersionUID = 1L;
	
	LoginActionDao loginActionDao=null;
	public void init(){
		loginActionDao=new LoginActionDao();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("****************************<< Login Action >>********************************");
		HttpSession session=req.getSession();
		System.out.println("----------------------<< session >>-------------------");
		String userdbName = null;
		String userdbPsw =null;
			
		
			String name = req.getParameter("mobileNumber");
			String password = req.getParameter("password");
			System.out.println("userName :"+name);
			System.out.println("password ::"+password);
			
			if ((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals("")))){
				
				//LoginActionDao logindb=new LoginActionDao();
				try {
					List l=loginActionDao.getLoginDB(name, password);
					System.out.println("list action ::"+l);
					for (int i = 0; i < l.size(); i++) {
						System.out.println(l.get(i));
						userdbName=(String)l.get(0);
						userdbPsw=(String)l.get(1);
					}
					if (name.equals(userdbName) && password.equals(userdbPsw) ) {
						//String s=otpGenerator();
						//SendMail.sendMail(name,s);
						System.out.println("userdbName ::"+userdbName);
						System.out.println("userdbPsw ::"+userdbPsw);
						
						session.setMaxInactiveInterval(60);
						session.setAttribute("name", userdbName);
						session.setAttribute("pass", userdbPsw);
						session.setAttribute("getname", name);
						session.setAttribute("getpassword", password);
						System.out.println("Login Success full-............................................");
				}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println("aaaaaaaaaaaaaaaaaaa ::"+userdbName);
				System.out.println("bbbbbbbbbbbbbbbbbbb ::"+userdbPsw);
				
			} else {
					/*<center>
						<p style="color: red">Error In Login</p>
					</center>*/
					getServletContext().getRequestDispatcher("/login.jsp").include(req, res);
				}
			
			}
		
}