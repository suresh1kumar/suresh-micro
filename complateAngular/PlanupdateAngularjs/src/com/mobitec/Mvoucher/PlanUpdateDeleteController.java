package com.mobitec.Mvoucher;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

public class PlanUpdateDeleteController extends HttpServlet{
	
	IPlanUpdateDao planUpdateDao=null;
	
	public void init(){
		planUpdateDao=new PlanUpdateDaoImpl();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	System.out.println("*********************<<Planupdate DeletePlan Controller>>**************************");
	ObjectMapper mapper=new ObjectMapper();
	
	String strI = req.getParameter("sno");
	int SNO = Integer.parseInt(strI);
	System.out.println("SNO ::"+SNO);
	
	int deleteid=0;
	String jsonProductList;
	String convertjavatojson="";
	try {
		deleteid = planUpdateDao.deletePlanUpdateRecordDao(SNO);
		 jsonProductList = Integer.toString(deleteid);
		 convertjavatojson=mapper.writeValueAsString(jsonProductList);
		System.out.println("controller ::"+convertjavatojson);
		res.setContentType("application/json");
		res.getWriter().write(convertjavatojson);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}
