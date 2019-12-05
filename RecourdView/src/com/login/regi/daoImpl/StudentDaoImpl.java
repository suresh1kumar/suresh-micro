package com.login.regi.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.login.regi.bean.StudentBean;
import com.login.regi.dao.StudentDao;
import com.login.regi.util.DBConnection;
import com.login.regi.util.SQLQuery;

public class StudentDaoImpl implements StudentDao {
	Connection con=null;
	PreparedStatement ps=null;
	boolean flag=false;

	@Override
	public boolean addStudent(StudentBean studentBean) throws SQLException {
	   con=DBConnection.createConnection();
	   ps=con.prepareStatement(SQLQuery.INSERT_PERSONAL_DETAILS);
	   ps.setString(1, studentBean.getStudentName());
	   ps.setString(2, studentBean.getQualification());
	   ps.setString(3, studentBean.getGender());
	   ps.setDate(4, studentBean.getJoinDate());
	   ps.setString(5, "Enable");
	   int count=ps.executeUpdate();
	   if(count>0) {
		   flag=true;
	   }
		
		return flag;
	}

	@Override
	public List<StudentBean> getAllStudentDetails() throws SQLException {
		boolean flag=false;
		con=DBConnection.createConnection();
		ps=con.prepareStatement(SQLQuery.GET_ALL_PERSONAL_DETAILS);


		ResultSet rs=ps.executeQuery();
		List<StudentBean> list=new ArrayList<StudentBean>();
		while(rs.next()) {
			StudentBean studentBean=new StudentBean();
			studentBean.setStudentId(rs.getInt(1));
			studentBean.setStudentName(rs.getString(2));
			studentBean.setQualification(rs.getString(3));
			studentBean.setGender(rs.getString(4));
			studentBean.setJoinDate(rs.getDate(5));
			studentBean.setAction(rs.getString(6));
			list.add(studentBean);
		}
		return list;
	}
	@Override
	public int updateAction(String saction, int id){
		int count=0;
		try {
			con=DBConnection.createConnection();
			   ps=con.prepareStatement(SQLQuery.Updale_User_Action);
			   	  ps.setString(1, saction); 
			   	  ps.setInt(2, id);
			   	count =ps.executeUpdate();
		}
		catch (Exception e) {
		}	
		return count;
	}
}
