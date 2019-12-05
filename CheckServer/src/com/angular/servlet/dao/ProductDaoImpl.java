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
	
	public boolean addProductDetails(Product product) throws SQLException{
		System.out.println("*********************<<ProductDaoImpl addProduct Dao>>**************************");
		boolean flag=false;
		Connection con=null;
		PreparedStatement ps=null;
		con=DBConnection.createConnection();
		System.out.println("Connection Established:"+con);
		String query="insert into product values(default,?,?)";
		ps=con.prepareStatement(query);
		
		//ps.setInt(1, student.getSid());
		//ps.setString(1, product.getName());
		ps.setString(1, product.getProductName());
		ps.setDouble(2, product.getPrice());

		int count=ps.executeUpdate();
		if(count>0){
			flag=true;
		}
		return flag;
		
	}
	@Override
	public List<Product> getProductDetails() {
		System.out.println("*********************<<ProductDaoImpl viewProduct Dao>>**************************");
		List<Product> list=new ArrayList<>();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=DBConnection.createConnection();
			String query="select productId,productName,price from product ";
			ps=con.prepareStatement(query);
			//ps.setDouble(1, meiprice);
			//ps.setDouble(2, maxprice);
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
	
	public List<Product> getAllPersonalDetailsDao(int pid)throws SQLException{
		System.out.println("*********************<<ProductDaoImpl viewAllProduct Dao>>**************************");
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet resultSet=null;
		List<Product> list=new ArrayList<Product>();
		try {
			con=DBConnection.createConnection();
			System.out.println("Connection Established:"+con);
			String query="select * from product where productId=?";
			
			ps=con.prepareStatement(query);
			ps.setInt(1, pid);
			resultSet=ps.executeQuery();
			
			while(resultSet.next()){
				Product product=new Product();
				
				product.setProductId(resultSet.getInt(1));
				product.setProductName(resultSet.getString(2));
				product.setPrice(resultSet.getDouble(3));
				
				list.add(product);
			}
		}catch(SQLException e) {
			
		}
		return list;
		
		
	}
	
		public boolean updateProductDetails(String pname,double price,int pid) {
			System.out.println("*********************<<ProductDaoImpl updateProduct Dao>>**************************");
			Connection con=null;
			PreparedStatement ps=null;
			boolean flag=false;
			try {
				con=DBConnection.createConnection();
				System.out.println("Connection Established:"+con);//'" + un + "'
				String query="update product set productName='" + pname + "',price=" + price + " where productId=" + pid + " ";
				ps=con.prepareStatement(query);
					
				//ps.setString(1, product.getProductName());
				//ps.setDouble(2, product.getPrice());
				int count=ps.executeUpdate();
				if(count>0){
					flag=true;
				}
				return flag;
			}catch(Exception e) {
				
			}
			return flag;
		
	}
	public int deleteProductDao(int pid)throws SQLException{
		System.out.println("*********************<<ProductDaoImpl deleteProduct Dao>>**************************");
		Connection con=null;
		PreparedStatement ps=null;
		boolean flag=false;
		int count=0;
		con=DBConnection.createConnection();
		System.out.println("Connection Established:"+con);
		String query="delete from product where productId=?";
		try{
			ps=con.prepareStatement(query);
			ps.setInt(1,pid);
			 count=ps.executeUpdate();
			System.out.println("Deleted id >> ::"+count);
				if(count>0){
				flag=true;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return count;
		
	}


}
