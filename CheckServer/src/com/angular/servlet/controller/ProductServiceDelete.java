package com.angular.servlet.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angular.servlet.dao.ProductDao;
import com.angular.servlet.dao.ProductDaoImpl;
import com.angular.servlet.service.ProductService;
import com.angular.servlet.service.ProductServiceImpl;



public class ProductServiceDelete extends HttpServlet{
	ProductService productService=null;
	public void init(){
		productService=new ProductServiceImpl();
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("*********************<<servlet DeleteProduct Controller>>**************************");
		String strI = req.getParameter("users_record_id");
		int productid = Integer.parseInt(strI);
		System.out.println("productid ::"+productid);
		
		String jsonProductList;
		try {
			jsonProductList = productService.deleteProductDao(productid);
			System.out.println("controller ::"+jsonProductList);
			res.setContentType("application/json");
			res.getWriter().write(jsonProductList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
