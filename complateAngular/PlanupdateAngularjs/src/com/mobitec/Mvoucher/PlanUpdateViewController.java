package com.mobitec.Mvoucher;

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
			System.out.println("*********************<<Planupdate viewPlan Controller>>**************************");
			
			String regionid=req.getParameter("");
			ObjectMapper mapper=new ObjectMapper();
			
			List<PlanUpdateBean> list=null;
			String convertjavatojson="";
			try {
				list=planUpdateDao.getAllPlanUpdateRecord(regionid);
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
