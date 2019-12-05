package com.angular.servlet.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angular.servlet.bean.Product;
import com.angular.servlet.dao.ProductDao;
import com.angular.servlet.dao.ProductDaoImpl;
import com.angular.servlet.service.ProductService;
import com.angular.servlet.service.ProductServiceImpl;

public class ProductServiceUpdate extends HttpServlet{
	
	ProductService productService=null;
	public void init(){
		productService=new ProductServiceImpl();
		
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("*********************<<servlet Update>>**************************");
		boolean flag=false;
		int pid=Integer.parseInt(req.getParameter("pid"));
		String pname=req.getParameter("name");
		double price=Double.parseDouble(req.getParameter("minPrice"));
		System.out.println("pid ::"+pid);
		System.out.println("pname ::"+pname);
		System.out.println("price ::"+price);
		
		Product product=new Product();
		product.setProductId(pid);
		product.setProductName(pname);
		product.setPrice(price);
		
		String jsonProductList;
		/*try {
			jsonProductList = productService.updateProductDetails(product);
			System.out.println("controller ::"+jsonProductList);
			res.setContentType("application/json");
			res.getWriter().write(jsonProductList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
	}

}
