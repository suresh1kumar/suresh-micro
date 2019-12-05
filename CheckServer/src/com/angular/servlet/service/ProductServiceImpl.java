package com.angular.servlet.service;

import java.sql.SQLException;
import java.util.List;

import com.angular.servlet.bean.Product;
import com.angular.servlet.dao.ProductDao;
import com.angular.servlet.dao.ProductDaoImpl;
import com.angular.servlet.util.JsonUtil;

public class ProductServiceImpl implements ProductService{

	public String addProductDetails(Product product) throws SQLException{
		ProductDao productDao= new ProductDaoImpl();
		boolean s=productDao.addProductDetails(product);
		String str = String.valueOf(s);
		String convertjavatojson=JsonUtil.convertJavaToJson(str);
		return convertjavatojson;
		
	}
	@Override
	public String getProductDetails() {
		
		ProductDao productDao= new ProductDaoImpl();
		List<Product> list=productDao.getProductDetails();
		String convertjavatojson=JsonUtil.convertJavaToJson(list);
		
		return convertjavatojson;
	}
	//public String updateProductDetails(Product product) throws SQLException {
		public String updateProductDetails(String pname,double price,int pid) throws SQLException {
		ProductDao productDao= new ProductDaoImpl();
		boolean s=productDao.updateProductDetails(pname, price, pid);
		String str = String.valueOf(s);
		String convertjavatojson=JsonUtil.convertJavaToJson(str);
		return convertjavatojson;
		
	}
	public String deleteProductDao(int pid)throws SQLException{
		ProductDao productDao= new ProductDaoImpl();
		int s=productDao.deleteProductDao(pid);
		String strI = Integer.toString(s);
		String convertjavatojson=JsonUtil.convertJavaToJson(strI);
		return convertjavatojson;
		
	}
}
