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
import javax.servlet.http.HttpSession;

import com.curd.bean.Student;
import com.curd.dao.StudentDao;
import com.curd.dao.StudentDaoImpl;

@WebServlet("/EditStudentAction")
public class EditStudentAction extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		System.out.println("hii");
		
		boolean flag=false;
		int sid=Integer.parseInt(request.getParameter("sid"));
		System.out.println(sid);
		String name=request.getParameter("name");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String sdate=request.getParameter("dat");
	
		System.out.println("sid::"+sid);
		System.out.println("name::"+name);
		System.out.println("mobile::"+mobile);
		System.out.println("email::"+email);
		System.out.println("sdate::"+sdate);
		
		Student student=new Student();
		student.setSid(sid);
		try {
			java.util.Date date =new SimpleDateFormat("mm/dd/yyyy").parse(sdate);
			java.sql.Date sqlDate=new java.sql.Date(date.getTime());
			student.setSdate(sqlDate);
				 
			System.out.println(date);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		student.setName(name);
		student.setMobile(mobile);
		student.setEmail(email);
		
		System.out.println("===================================call method action");
		StudentDao studentDao=new StudentDaoImpl();
		try {
			flag=studentDao.updatePersonalDeatilsDao(student);
		
			if(flag){
				
				System.out.println("Updated Successfully");
				RequestDispatcher rd=request.getRequestDispatcher("ViewStudentAction");
				rd.include(request, response);
			}
			else{
				System.out.println("not Updated");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
	}
	}


}
