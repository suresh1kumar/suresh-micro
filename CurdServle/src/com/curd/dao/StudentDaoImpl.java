package com.curd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.curd.bean.Student;
import com.curd.util.DBConnection;


public class StudentDaoImpl implements StudentDao{
	Connection con=null;
	PreparedStatement ps=null;

	@Override
	public boolean addPersonalDetailsDao(Student student) throws SQLException {
		boolean flag=false;
		//con=DBConnection.createConnection();
		con=DBConnection.getConnection();
		System.out.println("Connection Established:"+con);
		String query="insert into studentdata values(sid_1.NEXTVAL,?,?,?,?)";
		//insert into register values(default,?,?,?)";
		ps=con.prepareStatement(query);
		
		//ps.setInt(1, student.getSid());
		ps.setString(1, student.getName());
		ps.setString(2, student.getMobile());
		ps.setString(3, student.getEmail());
		ps.setDate(4, student.getSdate());

		int count=ps.executeUpdate();
		if(count>0){
			flag=true;
		}
		return flag;
	}
	@Override
	public List<Student> getAllStudentDetails() throws SQLException {
		boolean flag=false;
		con=DBConnection.getConnection();
		String query="select * from studentdata";
		ps=con.prepareStatement(query);
		ResultSet resultSet=ps.executeQuery();
		List<Student> list=new ArrayList<Student>();
		while(resultSet.next()) {
			Student student=new Student();
			
			student.setSid(resultSet.getInt(1));
			student.setName(resultSet.getString(2));
			student.setMobile(resultSet.getString(3));
			student.setEmail(resultSet.getString(4));
			student.setSdate(resultSet.getDate(5));
			
			list.add(student);
		}
		return list;
	}
	@Override
	public List<Student> getAllPersonalDetailsDao(int sid) throws SQLException {
		
		boolean flag=false;
		con=DBConnection.getConnection();
		System.out.println("Connection Established:"+con);
		String query="select * from studentdata where sid=?";//studentdata
		//select * from education_details where user_id=?"
		ps=con.prepareStatement(query);
		ps.setInt(1, sid);
		ResultSet resultSet=ps.executeQuery();
		List<Student> list=new ArrayList<Student>();
		
		while(resultSet.next()){
			Student student=new Student();
			
			student.setSid(resultSet.getInt(1));
			student.setName(resultSet.getString(2));
			student.setMobile(resultSet.getString(3));
			student.setEmail(resultSet.getString(4));
			student.setSdate(resultSet.getDate(5));
			
			list.add(student);
		}
		return list;
	}

	@Override
	public boolean updatePersonalDeatilsDao(Student student) throws SQLException {
		boolean flag=false;
		con=DBConnection.getConnection();
		System.out.println("Connection Established:"+con);
		String query="update studentdata set name=?,mobile=?,email=?,dat=? where sid=?";
		//update profession_details set empname=?,from_date=?,to_date=?,job_title=?,duties=? where pro_id=?";
		ps=con.prepareStatement(query);
			
		ps.setString(1, student.getName());
		ps.setString(2, student.getMobile());
		ps.setString(3, student.getEmail());
		ps.setDate(4, student.getSdate());
		int count=ps.executeUpdate();
		if(count>0){
			flag=true;
		}
		return flag;
	}

	//@Override
	//public boolean deletePersonalDetailsDao(Student student) throws SQLException {
		public boolean deleteStudentDao(int sid) throws SQLException {
			boolean flag=false;
			con=DBConnection.getConnection();
			System.out.println("Connection Established:"+con);
			String query="delete from studentdata where sid=?";
			try{
				ps=con.prepareStatement(query);
				ps.setInt(1,sid);
				int count=ps.executeUpdate();
					if(count>0){
					flag=true;
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
			return flag;
	}
		@Override
		public void deleteContact(String sid) {
			con=DBConnection.getConnection();
			System.out.println("Connection Established:"+con);
			String query="delete from studentdata where sid=?";
			try{
				ps = con.prepareStatement(query); // create a statement
				ps.setInt(1, Integer.parseInt(sid));
				// execute delete SQL stetement
				ps.executeUpdate();
				System.out.println("Record is deleted!");
				
			}catch(SQLException e){
				e.printStackTrace();
			}
			//return flag;
			
		}
		/*@Override
		public void updateContact(String sid, String name, String mobile, String email, String sdate) {
			try {
				con=DBConnection.getConnection();
				System.out.println("Connection Established:"+con);
				String query = "UPDATE studentdata SET name = ?, mobile = ?, email = ?,sdate = ? " + " WHERE sid = ?";
				ps = con.prepareStatement(query); // create a statement
				
				ps.setString(1, name);
				ps.setString(2, mobile);
				ps.setString(3, email);
				//ps.setDate(4, sdate);
				ps.setInt(4, Integer.parseInt(sid));
				ps.executeUpdate();
				
				System.out.println("Record is Updated!");
			} catch (SQLException se) {
				// Handle errors for JDBC
				se.printStackTrace();
			} catch (Exception e) {
				// Handle errors for Class.forName
				e.printStackTrace();
			} finally {
				// finally block used to close resources
				try {
					if (ps != null)
						con.close();
				} catch (SQLException se) {
				} // do nothing
				try {
					if (con != null)
						con.close();
				} catch (SQLException se) {
					se.printStackTrace();
				} // end finally try
			} // end try
			
		}*/
//=================
		public void updateStudent( Student student ) {
			try {
				con=DBConnection.getConnection();
				System.out.println("Connection Established:"+con);
				String query = "UPDATE studentdata SET name = ?, mobile = ?, email = ?,sdate = ? " + " WHERE sid = ?";
				ps = con.prepareStatement(query); // create a statement
				ps.setString(1, student.getName());
				ps.setString(2, student.getMobile());
				ps.setString(3, student.getEmail());
				ps.setDate(4, student.getSdate());
				
				ps.executeUpdate();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//===================
		/*@Override
		public Map<Integer, Student> getContactById(String sid) {
			try {
				Map<Integer, Student> mapWithId = new HashMap<>();
				con=DBConnection.getConnection();
				System.out.println("Connection Established:"+con);
				String query = "SELECT * FROM studentdata WHERE sid = ?";
				ps = con.prepareStatement(query); // create a statement
				ps.setString(1, sid);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Student contact = new Student(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4),rs.getDate(5));
					mapWithId.put(Integer.parseInt(sid), contact);
				}
				return mapWithId;

			} catch (SQLException se) {
				// Handle errors for JDBC
				se.printStackTrace();
			} catch (Exception e) {
				// Handle errors for Class.forName
				e.printStackTrace();
			} finally {
				// finally block used to close resources
				try {
					if (ps != null)
						con.close();
				} catch (SQLException se) {
				} // do nothing
				try {
					if (con != null)
						con.close();
				} catch (SQLException se) {
					se.printStackTrace();
				} // end finally try
			} // end try
			return null;
		}
		*/
}
