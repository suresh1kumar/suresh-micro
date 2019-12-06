package com.login.regi.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.regi.bean.StudentBean;
import com.login.regi.service.StudentService;
import com.login.regi.serviceimpl.StudentServiceImpl;
@WebServlet("/GetStudent")
public class GetStudent extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		StudentService studentService=new StudentServiceImpl();
		//HttpSession session=request.getSession();
		try {
			List<StudentBean>list=studentService.getStudentDetails(1);
			
			
			//session.setAttribute("personalDetails", list);
			req.setAttribute("list", list);
			RequestDispatcher rd=req.getRequestDispatcher("allstudents.jsp");
			rd.forward(req, res);
			for(StudentBean lists:list){
				System.out.println(lists.getStudentId()+"\t"+lists.getStudentName()+""+lists.getQualification()+""+lists.getGender()+""+lists.getJoinDate());
			}
		} catch (SQLException se) {
			// TODO Auto-generated catch block
			se.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
