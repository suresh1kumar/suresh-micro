package com.login.regi.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.regi.bean.StudentBean;
import com.login.regi.service.StudentService;
import com.login.regi.serviceimpl.StudentServiceImpl;
@WebServlet("/AddStudentInfo")
public class AddStudentInfo extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		boolean flag=false;
		String Sname=req.getParameter("studentName");
		String quali=req.getParameter("Qualification");
		String gender=req.getParameter("gender");
		String jdate=req.getParameter("joinDate");
		
		StudentBean st=new StudentBean();
		//st.setStudentId(studentId);
		
		try {
			java.util.Date date =new SimpleDateFormat("MM/dd/yyyy").parse(jdate);
			java.sql.Date sqlDate=new java.sql.Date(date.getTime());
			st.setJoinDate(sqlDate);
			System.out.println(date);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		st.setStudentName(Sname);
		st.setQualification(quali);
		st.setGender(gender);	 
			StudentService studentService=new StudentServiceImpl();
			try {
				flag=studentService.addStudent(st);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(flag) {
				System.out.println("Student data saved in database.......");
			}else {
				System.out.println("failured.............");
			}
		}
	}
//}
