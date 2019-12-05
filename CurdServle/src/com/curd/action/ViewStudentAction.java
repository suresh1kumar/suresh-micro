package com.curd.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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

@WebServlet("/ViewStudentAction")
public class ViewStudentAction extends HttpServlet{
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		StudentDao personalDetailsServiceI=new StudentDaoImpl();
		HttpSession session=request.getSession();
		try {
			//List<Student>list=personalDetailsServiceI.getAllPersonalDetailsDao(4);
			List<Student>list=personalDetailsServiceI.getAllStudentDetails();
			System.out.println("========view1");
			session.setAttribute("studentlist", list);
			System.out.println(list);
		//	RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
			response.sendRedirect("/CurdServle/view.jsp");
			System.out.println("==============view down");
			//rd.forward(request, response);
			
			for(Student lists:list){
				System.out.println(lists.getName()+"\t"+lists.getMobile()+"\t"+lists.getEmail()+"\t"+lists.getSdate());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	 }
}
