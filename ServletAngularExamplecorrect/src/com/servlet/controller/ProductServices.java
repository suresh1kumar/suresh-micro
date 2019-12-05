package com.servlet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.service.ProductService;
import com.servlet.service.ProductServiceImpl;

//@WebServlet("/ProductServices")
public class ProductServices extends HttpServlet {

	/********** This is jar File ************
	 *    jack son-annotations-2.8.4.jar    *
	 *    jack son-core-2.8.4.jar           *
	 *    jack son-data bind-2.8.4.jar      *
	 ***************************************/

	// private ProductService ProductService;
	ProductService productService = null;

	public void init() {
		productService = new ProductServiceImpl();

	}

	// @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("*********************servlet**************************");
		double minprice = Double.parseDouble(req.getParameter("minPrice"));
		System.out.println("minprice ::" + minprice);
		double maxPrice = Double.parseDouble(req.getParameter("maxPrice"));
		// double maxprice=Double.parseDouble(req.getParameter("maxPrice"));
		System.out.println("maxprice ::" + maxPrice);
		String jsonProductList = productService.getProductDetails(minprice, maxPrice);
		System.out.println("controller ::" + jsonProductList);
		res.setContentType("application/json");
		res.getWriter().write(jsonProductList);
	}

}