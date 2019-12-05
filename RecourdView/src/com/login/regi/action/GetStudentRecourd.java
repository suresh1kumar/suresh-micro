package com.login.regi.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;

import com.login.regi.bean.StudentBean;
import com.login.regi.service.StudentService;
import com.login.regi.serviceImpl.StudentServiceImpl;
@WebServlet("/GetStudentRecourd")
public class GetStudentRecourd extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session=req.getSession();
		StudentService studentService=new StudentServiceImpl();
		try {
			List<StudentBean> list=studentService.getStudentDetails(1);
			
			session.setAttribute("studentDetails", list);
			System.out.println(list);
			//RequestDispatcher rd=req.getRequestDispatcher("/RecourdView/WebContent/getStudentDetails.jsp");
			res.sendRedirect("/RecourdView/getStudentDetails.jsp");
			//rd.forward(req, res);
			for( StudentBean lists:list){
				//System.out.println(lists.getQualificatoin()+"\t"+lists.getSchoollName()+"\t"+lists.getDateAttend()+"\t "+lists.getPer()+"\t "+lists.getBoard()+"\t"+lists.getTotaMarks()+"\t "+lists.getObtainMarks());
				System.out.println(lists.getStudentName()+""+lists.getQualification()+""+lists.getGender()+""+lists.getJoinDate());
				
			}
		}catch(Exception e) {
			
		}
	}

}
