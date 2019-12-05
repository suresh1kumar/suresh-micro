package com.angularjs.report.mvoucher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class ProductDaoImpl implements ProductDao{

	@Override
	public boolean addPersonalDetailsDao(Product product) throws SQLException {
		//List<Product> list=new ArrayList<>();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		boolean flag=false;
		con=DBConnection.createConnection();
		System.out.println("Connection Established:"+con);
		String query="insert into product values(default,?,?)";
		//insert into register values(default,?,?,?)";
		ps=con.prepareStatement(query);
		
		//ps.setInt(1, student.getSid());
		//ps.setInt(1, product.getProductId());
		ps.setString(1, product.getProductName());
		ps.setDouble(2, product.getPrice());

		int count=ps.executeUpdate();
		if(count>0){
			flag=true;
		}
		return flag;
	}
	@Override
	public List<Product> getProductDetails(double meiprice,double maxprice) {
		List<Product> list=new ArrayList<>();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=DBConnection.createConnection();
			System.out.println("product daoimpl================");
			//String query="select productId,productName,price from product ";
			String query="select productId,productName,price from SURESHNAGULAR where price>=? and price<=?";
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
	public int deleteProductDetails(int productId) throws SQLException{
		System.out.println("**************************Delete Record Dao **************************");
		Connection con=null;
		PreparedStatement ps=null;
		DBConnection db = null;
		boolean flag=false;
		int count=0;
		try{
		     db = new DBConnection();
		     con=DBConnection.createConnection();
		     String query="delete from product where productId=?";
		     //st.executeUpdate("delete from TBL_BSNL_PLANS where productId='"+productId+"'"); 
		     ps=con.prepareStatement(query); 
		     ps.setInt(1, productId);
		     count=ps.executeUpdate();
		     System.out.println("Record is deleted!");
			
		}catch(SQLException e){
			e.printStackTrace();
		}catch(Exception e){
			
		}finally{
			con.close();
			ps.close();
		}
		//return flag;
		return count;
	}

}
