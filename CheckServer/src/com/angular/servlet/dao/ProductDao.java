package com.angular.servlet.dao;

import java.sql.SQLException;
import java.util.List;

import com.angular.servlet.bean.Product;

public interface ProductDao {
	public List<Product> getProductDetails();
	//public List<Product> updateProductDetails(String pname,String price);
	public boolean addProductDetails(Product product) throws SQLException;
	public boolean updateProductDetails(String pname,double price,int pid) ;
	public List<Product> getAllPersonalDetailsDao(int pid)throws SQLException;
	//public boolean updateProductDetails(Product product) throws SQLException;
	public int deleteProductDao(int pid)throws SQLException;


}