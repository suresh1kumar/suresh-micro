package com.login.regi.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.login.regi.bean.RegisterBean;
import com.login.regi.dao.LoginDao;
import com.login.regi.util.DBConnection;
import com.login.regi.util.SQLQuery;

public class LoginDaoImpl implements LoginDao {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	@Override
	public int loginDao(RegisterBean login) throws SQLException {
		int flag=0;
		con=DBConnection.createConnection();
		ps=con.prepareStatement(SQLQuery.LOGIN_USER);
		ps.setString(1, login.getEmail());
		ps.setString(2, login.getMobile());
		 rs=ps.executeQuery();
		while (rs.next()) {
			flag=rs.getInt(1);
			
		}
		
		
		
		return flag;
	}

	

}
