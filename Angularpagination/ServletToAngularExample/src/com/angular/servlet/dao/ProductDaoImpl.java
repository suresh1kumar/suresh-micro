package com.angular.servlet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.angular.servlet.bean.Product;
import com.angular.servlet.util.DBConnection;

public class ProductDaoImpl implements ProductDao{

	@Override
	public List<Product> getProductDetails(double meiprice, double maxprice) {
		List<Product> list=new ArrayList<>();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=DBConnection.createConnection();
			System.out.println("product daoimpl================");
			String query="select productId,productName,price from product where price>=? and price<=?";
			ps=con.prepareStatement(query);
			ps.setDouble(1, meiprice);
			ps.setDouble(2, maxprice);
			rs=ps.executeQuery();
			while(rs.next()){
				Product product=new Product();
				product.setProductId(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setPrice(rs.getDouble(3));
				list.add(product);
			}
		}catch(SQLException se){
			se.printStackTrace();
		}
		return list;
	}

}
