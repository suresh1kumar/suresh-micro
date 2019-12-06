package com.login.regi.service;

import java.sql.SQLException;

import com.login.regi.bean.RegisterBean;

public interface LoginService {
	public boolean loginService(RegisterBean login) throws SQLException;

}
