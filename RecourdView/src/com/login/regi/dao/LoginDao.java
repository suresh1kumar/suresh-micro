package com.login.regi.dao;

import java.sql.SQLException;

import com.login.regi.bean.RegisterBean;

public interface LoginDao {
	public int loginDao(RegisterBean login) throws SQLException;

	

}
