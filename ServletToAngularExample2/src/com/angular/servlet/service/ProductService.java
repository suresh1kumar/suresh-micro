package com.angular.servlet.service;

import java.sql.SQLException;

import com.angular.servlet.bean.Product;


public interface ProductService {
	public String getProductDetails(double meiprice,double maxprice);
	public boolean addPersonalDetailsDao(Product product) throws  SQLException;
	//public String getProductDetails();
	public String deleteProductDetails(int productId)throws SQLException;
	

}
