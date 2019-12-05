package com.curd.action;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.curd.bean.Student;
import com.curd.dao.StudentDao;
import com.curd.dao.StudentDaoImpl;
@WebServlet("/AddStudentAction")
public class AddStudentAction extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean flag=false;
		
		/*HttpSession session=request.getSession(false);
		int uid=(int)session.getAttribute("uid");*/
		int sid=4;
		String name=request.getParameter("name");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String dob=request.getParameter("dat");

		Student pdd=new Student();
		
		try {
			java.util.Date date =new SimpleDateFormat("MM/dd/yyyy").parse(dob);
			java.sql.Date sqlDate=new java.sql.Date(date.getTime());
			pdd.setSdate(sqlDate);
				 
			System.out.println(date);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		pdd.setSid(sid);
		pdd.setName(name);
		pdd.setMobile(mobile);
		pdd.setEmail(email);
		StudentDao studentdao=new StudentDaoImpl();
		try {
			flag=studentdao.addPersonalDetailsDao(pdd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag){
			System.out.println("addesd successfully");
			RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
			rd.forward(request, response);
		}
		else{
			System.out.println("failed");
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
