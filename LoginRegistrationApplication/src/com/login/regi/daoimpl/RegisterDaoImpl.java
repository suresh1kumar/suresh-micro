package com.login.regi.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.login.regi.bean.RegisterBean;
import com.login.regi.dao.RegisterDao;
import com.login.regi.util.DBConnection;
import com.login.regi.util.SQLQuery;

public class RegisterDaoImpl implements RegisterDao {
	Connection con=null;
	PreparedStatement ps=null;
    boolean flag=false;
	@Override
	public boolean getRegister(RegisterBean register) throws SQLException {
		con=DBConnection.createConnection();
		ps=con.prepareStatement(SQLQuery.REGISTER_USER);
		ps.setString(1, register.getUname());
		ps.setString(2, register.getEmail());
		ps.setString(3, register.getMobile());
		int count=ps.executeUpdate();
		if(count !=0) {
			System.out.println("register successfull............");
			//RequestDispatcher rd=req.
			flag=true;
		}else {
			System.out.println("register falure..............");
		}
		
		return flag;
	}

}
