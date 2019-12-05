package com.angular.servlet.service;

import java.sql.SQLException;

import com.angular.servlet.bean.Product;

public interface ProductService {
	public String addProductDetails(Product product) throws SQLException;
	public String getProductDetails();
	//public String updateProductDetails(Product product)  throws SQLException;
	public String updateProductDetails(String pname,double price,int pid) throws SQLException;
	public String deleteProductDao(int pid)throws SQLException;

}
