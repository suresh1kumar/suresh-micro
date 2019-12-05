package com.curd.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.curd.bean.Student;
import com.curd.dao.StudentDao;
import com.curd.dao.StudentDaoImpl;

@WebServlet("/DeleteStudentAction")
public class DeleteStudentAction extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StudentDao contactService = new StudentDaoImpl();
		contactService.deleteContact(request.getParameter("sid"));//deleteStudentDao(sid);
		RequestDispatcher rd = request.getRequestDispatcher("ViewStudentAction");
		rd.forward(request,response);

	}
	/*public void  doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		
		boolean flag=false;
		int sid=Integer.parseInt(request.getParameter("sid"));
		System.out.println("userId :"+sid);
		
		StudentDao studentDao=new StudentDaoImpl();
		try {
			flag=studentDao.deleteStudentDao(sid);
			if(flag){
				System.out.println("Deleted Successfully");
				RequestDispatcher rd = request.getRequestDispatcher("ViewStudentAction");
				rd.include(request, response);
			}
			else{
				System.out.println("Deletion Failed");
			}
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		
		
		
		//=====================
		/*boolean flag=false;
		int sid=Integer.parseInt(request.getParameter("sid"));
		System.out.println(sid);
		Student student=new Student();
		student.setSid(sid);
		
		StudentDao studentDao=new StudentDaoImpl();
		try {
			flag=studentDao.deletePersonalDetailsDao(student)
			if(flag){
				System.out.println("Deleted Successfully");
				RequestDispatcher rd=request.getRequestDispatcher("ViewStudentAction");
				rd.include(request, response);
			}
			else{
				
				System.out.println("Deletion Failed");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		
	}*/
	
}
