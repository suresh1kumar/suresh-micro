package com.angular.servlet.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.angular.servlet.bean.Product;
import com.angular.servlet.service.ProductService;
import com.angular.servlet.service.ProductServiceImpl;

public class ProductServiceAdd extends HttpServlet{
	
	ProductService productService=null;
	public void init(){
		productService=new ProductServiceImpl();
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("*********************<<servlet AddProduct & UpdateProduct Controller>>**************************");
		String productidgetPrameter=null;
		
		productidgetPrameter=req.getParameter("productid");
		System.out.println("productidgetPrameter::"+productidgetPrameter);
		int	productidconvertInt=0;
		if(productidgetPrameter!=null) {
			productidconvertInt=Integer.parseInt(productidgetPrameter);
		}
		String pname=req.getParameter("pname");
		String price=req.getParameter("price");
		System.out.println("price ::"+price);
		
		System.out.println("productidconvertInt::"+productidconvertInt);
		
		double priceadd=Double.parseDouble(price);
		System.out.println("pname ::"+pname);
		System.out.println("priceadd double ::"+priceadd);
		
		String jsonProductList=null;
		Product product=new Product();
		product.setProductName(pname);
		product.setPrice(priceadd);
		
		if(productidconvertInt !=0) {
			try {
				System.out.println("*********Update record block **********");
				jsonProductList = productService.updateProductDetails(pname, priceadd, productidconvertInt);
				System.out.println("controller ::"+jsonProductList);
				res.setContentType("application/json");
				res.getWriter().write(jsonProductList);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else {
			try {
				System.out.println("*********Add record block **********");
				jsonProductList=productService.addProductDetails(product);
				System.out.println("controller ::"+jsonProductList);
				res.setContentType("application/json");
				res.getWriter().write(jsonProductList);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}

}
