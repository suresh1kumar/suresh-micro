package com.angularjs.report.mvoucher;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ProductServiceAdd extends HttpServlet{
	
	ProductService productService=null;
	public void init(){
		productService=new ProductServiceImpl();
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("*********************<<servlet Add>>**************************");
		//String productIds=req.getParameter("productId");
		//System.out.println("productIds ::"+productIds);
		String productname=req.getParameter("pname");
		System.out.println("productname ::"+productname);
		double price=Double.parseDouble(req.getParameter("price"));
		System.out.println("price ::"+price);
		//int productId = Integer.parseInt(productIds);
		Product product=new Product();
		//product.setProductId(productId);
		product.setProductName(productname);
		product.setPrice(price);
		boolean boovar;
		try {
			boovar = productService.addPersonalDetailsDao(product);
			String list = String.valueOf(boovar);
			String jsonProductList=JsonUtil.convertJavaToJson(list);
			System.out.println("controller ::"+jsonProductList);
			res.setContentType("application/json");
			res.getWriter().write(jsonProductList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
