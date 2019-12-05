package com.mobitec.Mvoucher;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

public class PlanUpdateAddUpdateController extends HttpServlet{
	
private static final long serialVersionUID = 1L;
	
	IPlanUpdateDao planUpdateDao=null;
	
		public void init(){
			planUpdateDao=new PlanUpdateDaoImpl();
		}
		
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("*********************<<Planupdate AddEditPlan Controller>>**************************");
		
		String productidgetPrameter=null;
		
		productidgetPrameter=req.getParameter("sno");
		System.out.println("productidgetPrameter::"+productidgetPrameter);
		int	sno=0;
		if(productidgetPrameter!=null) {
			sno=Integer.parseInt(productidgetPrameter);
		}
		//IPlanUpdateDao productDao=new PlanUpdateDaos();
		
		//String sno=req.getParameter("sno");
		String bsnlid=req.getParameter("bsnlid");
		String regionName=req.getParameter("regionName");
		
		int rid=Integer.parseInt(regionName);
		
		String type=req.getParameter("type");
		String country=req.getParameter("country");
		
		String denomination1=req.getParameter("denomination");
		int denomination=Integer.parseInt(denomination1);
		
		String talkvalue1=req.getParameter("talkvalue");
		double talkvalue=Double.parseDouble(talkvalue1);
		
		String validity1=req.getParameter("validity");
		int validity=Integer.parseInt(validity1);
		
		String description=req.getParameter("description");
		String fromDate=req.getParameter("fromdates");
		String toDate=req.getParameter("toDates");
		
		//PlanUpdateDaos planUpdateDaos=new PlanUpdateDaos();
		//String s=planUpdateDaos.getCircleid(regionName);
		//bsnlid,region,denomination,type,talkvalue,validity,description,country,fromDate,toDate,sno
		
		
		System.out.println("sno ::"+sno);
		System.out.println("regionName ::"+regionName);
		System.out.println("fromDate::"+fromDate);
		System.out.println("toDate ::"+toDate);
		System.out.println("denomination ::"+denomination);
		
		/*PlanUpdateDaoImpl planUpdateDao=new PlanUpdateDaoImpl();
		String s=planUpdateDao.getCircleid(regionName);
		int region=Integer.parseInt(s);
		System.out.println("converted int region ::"+region);*/
		
		
		ObjectMapper mapper=new ObjectMapper();
		
		//List<PlanUpdateBean> list=null;
		String convertjavatojson="";
		if(sno !=0) {
			try {
				System.out.println("*********Update record block **********");
				
				boolean adds=planUpdateDao.updatePlanUpdateRecordDao(bsnlid,rid,denomination,type,talkvalue,validity,description,country,fromDate,toDate,sno);
				String str = String.valueOf(adds);
				System.out.println("----------------------------update 4");
				convertjavatojson=mapper.writeValueAsString(str);
				System.out.println("----------------------------pdate 5");
				System.out.println("controller ::"+convertjavatojson);
				res.setContentType("application/json");
				res.getWriter().write(convertjavatojson);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else {
			try {
				System.out.println("*********Add record block **********");
				
				boolean add=planUpdateDao.addPlanUpdateRecordDao(bsnlid,rid,denomination,type,talkvalue,validity,description,country,fromDate,toDate,sno);
				System.out.println("----------------------------add 4");
				String str = String.valueOf(add);
				convertjavatojson=mapper.writeValueAsString(str);
				
				System.out.println("----------------------------add 5");
				System.out.println("controller ::"+convertjavatojson);
				res.setContentType("application/json");
				res.getWriter().write(convertjavatojson);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		}
}
