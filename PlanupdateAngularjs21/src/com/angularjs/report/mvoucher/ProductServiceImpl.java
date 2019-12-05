package com.angularjs.report.mvoucher;

import java.sql.SQLException;
import java.util.List;



public class ProductServiceImpl implements ProductService{

	public boolean addPersonalDetailsDao(Product product) throws  SQLException{
		ProductDao productDao= new ProductDaoImpl();
		boolean boovar=productDao.addPersonalDetailsDao(product);
		//String list = String.valueOf(boovar);
		//String convertjavatojson=JsonUtil.convertJavaToJson(list);
		
		return boovar;
	}
	@Override
	public String getProductDetails(double meiprice,double maxprice) {
		
		ProductDao productDao= new ProductDaoImpl();
		List<Product> list=productDao.getProductDetails( meiprice, maxprice);
		String convertjavatojson=JsonUtil.convertJavaToJson(list);
		
		return convertjavatojson;
	}
	public String deleteProductDetails(int productId) throws SQLException{
		ProductDao productDao= new ProductDaoImpl();
		int convertjavatojson=productDao.deleteProductDetails(productId);
		String numberAsString = Integer.toString(convertjavatojson);
		return numberAsString;
	}

}
