package com.servlet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.servlet.bean.Product;
import com.servlet.bean.Zone;
import com.servlet.util.DBConnection;

public class ZoneDaoImpl implements ZoneDao{

	@Override
	public List<Zone> getProductDetails(double meiprice, double maxprice) {
		List<Zone> list=new ArrayList<>();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			
			con=DBConnection.getConnection();
			System.out.println("product daoimpl================");
			String query="select ZONEID,Z_SHORTNAME,Z_FULLNAME from product where price>=? and price<=?";
			ps=con.prepareStatement(query);
			ps.setDouble(1, meiprice);
			ps.setDouble(2, maxprice);
			rs=ps.executeQuery();
			while(rs.next()){
				Zone product=new Zone();
				/*product.setProductId(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setPrice(rs.getDouble(3));
				list.add(product);*/
				System.out.println("list dao ::"+list);
			}
		}catch(SQLException se){
			se.printStackTrace();
		}
		return list;
	}

}







