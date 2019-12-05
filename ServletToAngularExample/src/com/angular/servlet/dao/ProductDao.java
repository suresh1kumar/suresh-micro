package com.angular.servlet.dao;

import java.util.List;

import com.angular.servlet.bean.Product;

public interface ProductDao {
	public List<Product> getProductDetails(double meiprice,double maxprice);

}