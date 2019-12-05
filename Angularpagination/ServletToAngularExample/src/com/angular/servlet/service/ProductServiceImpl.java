package com.angular.servlet.service;

import java.util.List;

import com.angular.servlet.bean.Product;
import com.angular.servlet.dao.ProductDao;
import com.angular.servlet.dao.ProductDaoImpl;
import com.angular.servlet.util.JsonUtil;

public class ProductServiceImpl implements ProductService{

	@Override
	public String getProductDetails(double meiprice, double maxprice) {
		
		ProductDao productDao= new ProductDaoImpl();
		List<Product> list=productDao.getProductDetails(meiprice, maxprice);
		String convertjavatojson=JsonUtil.convertJavaToJson(list);
		
		return convertjavatojson;
	}

}
