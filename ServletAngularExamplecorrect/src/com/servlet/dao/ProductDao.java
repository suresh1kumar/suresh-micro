package com.servlet.dao;

import java.util.List;

import com.servlet.bean.Product;

public interface ProductDao {
	public List<Product> getProductDetails(double meiprice,double maxprice);

}