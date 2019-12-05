package com.angularjs.report.mvoucher;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

public class PlanUpdateViewController extends HttpServlet{
	
private static final long serialVersionUID = 1L;
	
	IPlanUpdateDao planUpdateDao=null;
	
		public void init(){
			planUpdateDao=new PlanUpdateDaoImpl();
		}

		@Override
			protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			System.out.println("*********************<<Report view Controller>>**************************");
			
			//qualification,gender,uaction,joinDate
			String qulifaction=req.getParameter("qualification");
			String gender=req.getParameter("gender");
			String jdate=req.getParameter("joinDate");
			String jdate1=req.getParameter("joinDate1");
			String uaction=req.getParameter("uaction");
			
			System.out.println("qulifaction ::"+qulifaction);
			System.out.println("gender ::"+gender);
			System.out.println("jdate ::"+jdate);
			System.out.println("jdate1 ::"+jdate1);
			System.out.println("uaction ::"+uaction);
			
			ObjectMapper mapper=new ObjectMapper();
			
			List<ReportBean> list=null;
			String convertjavatojson="";
			if(uaction!=null && uaction.equals("Disable")) {
			try {
				list=planUpdateDao.getAllRecordDisable(qulifaction, gender, jdate,jdate1, uaction);
				System.out.println("----------------------------5");
				
				convertjavatojson=mapper.writeValueAsString(list);
				System.out.println("----------------------------6");
				System.out.println("controller ::"+convertjavatojson);
				res.setContentType("application/json");
				res.getWriter().write(convertjavatojson);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			  }
			}else {
				try {
					list=planUpdateDao.getAllRecordEnable(qulifaction, gender, jdate,jdate1, uaction);
					System.out.println("----------------------------5");
					
					convertjavatojson=mapper.writeValueAsString(list);
					System.out.println("----------------------------6");
					System.out.println("controller ::"+convertjavatojson);
					res.setContentType("application/json");
					res.getWriter().write(convertjavatojson);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			}
}
