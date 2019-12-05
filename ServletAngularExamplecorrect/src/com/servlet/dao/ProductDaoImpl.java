package com.servlet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.servlet.bean.Product;
import com.servlet.util.DBConnection;


public class ProductDaoImpl implements ProductDao{

	@Override
	public List<Product> getProductDetails(double meiprice, double maxprice) {
		List<Product> list=new ArrayList<>();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=DBConnection.getConnection();
			System.out.println("product daoimpl================");
			//String query="select productId,productName,price from angular where price>=? and price<=?";
			String query1="select regionid, r_shortname,r_fullname from mvclient.tbl_region where regionid>=? and regionid<=?";
			ps=con.prepareStatement(query1);
			ps.setDouble(1, meiprice);
			ps.setDouble(2, maxprice);
			rs=ps.executeQuery();
			while(rs.next()){
				Product product=new Product();
				/*product.setProductId(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setPrice(rs.getDouble(3));*/
				
				product.setRegionid(rs.getInt(1));
				product.setR_shortname(rs.getString(2));
				product.setR_fullname(rs.getString(3));
				list.add(product);
				System.out.println("list dao ::"+list);
			}
		}catch(SQLException se){
			se.printStackTrace();
		}
		return list;
	}

}









