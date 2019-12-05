package com.login.regi.service;

import java.sql.SQLException;

import com.login.regi.bean.RegisterBean;

public interface LoginService {
	public int loginService(RegisterBean login) throws SQLException;

}
