package com.angularjs.report.mvoucher;

import java.sql.SQLException;



public interface ProductService {
	public String getProductDetails(double meiprice,double maxprice);
	public boolean addPersonalDetailsDao(Product product) throws  SQLException;
	//public String getProductDetails();
	public String deleteProductDetails(int productId)throws SQLException;
	

}
