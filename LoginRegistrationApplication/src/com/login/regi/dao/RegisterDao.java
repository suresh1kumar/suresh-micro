package com.login.regi.dao;

import java.sql.SQLException;

import com.login.regi.bean.RegisterBean;

public interface RegisterDao {
	public boolean getRegister(RegisterBean register) throws SQLException;

}
