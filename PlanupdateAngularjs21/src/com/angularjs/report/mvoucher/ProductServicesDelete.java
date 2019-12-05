package com.angularjs.report.mvoucher;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ProductServicesDelete extends HttpServlet{
	
	ProductService productService=null;
	public void init(){
		productService=new ProductServiceImpl();
		
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("*********************servlet Delete**************************");
		//int productId=Integer.parseInt(req.getParameter("Delete"));
		String productId=req.getParameter("productId");
		System.out.println("productId ::"+productId);
		int result = Integer.parseInt(productId);	
		//int result=107;
		String jsonProductList;
		try {
			jsonProductList = productService.deleteProductDetails(result);
			res.setContentType("application/json");
			res.getWriter().write(jsonProductList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}


}
