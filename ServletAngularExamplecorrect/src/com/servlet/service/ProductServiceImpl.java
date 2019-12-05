package com.servlet.service;

import java.util.List;

import com.servlet.bean.Product;
import com.servlet.dao.ProductDao;
import com.servlet.dao.ProductDaoImpl;
import com.servlet.util.JsonUtil;


public class ProductServiceImpl implements ProductService{

	@Override
	public String getProductDetails(double meiprice, double maxprice) {
		
		ProductDao productDao= new ProductDaoImpl();
		List<Product> list=productDao.getProductDetails(meiprice, maxprice);
		String convertjavatojson=JsonUtil.convertJavaToJson(list);
		
		return convertjavatojson;
	}

}
