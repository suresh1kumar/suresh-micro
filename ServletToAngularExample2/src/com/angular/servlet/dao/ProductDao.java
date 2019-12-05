package com.angular.servlet.dao;

import java.sql.SQLException;
import java.util.List;

import com.angular.servlet.bean.Product;

public interface ProductDao {
	public List<Product> getProductDetails(double meiprice,double maxprice);
	public boolean addPersonalDetailsDao(Product product) throws  SQLException;
	//public List<Product> getProductDetails();
	public int deleteProductDetails(int productId)throws SQLException;


}