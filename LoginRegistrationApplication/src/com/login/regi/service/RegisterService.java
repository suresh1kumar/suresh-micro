package com.login.regi.service;

import java.sql.SQLException;

import com.login.regi.bean.RegisterBean;

public interface RegisterService {
	public boolean getRegister(RegisterBean register) throws SQLException;

}
