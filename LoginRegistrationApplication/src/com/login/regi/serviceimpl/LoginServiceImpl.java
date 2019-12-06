package com.login.regi.serviceimpl;

import java.sql.SQLException;

import com.login.regi.bean.RegisterBean;
import com.login.regi.dao.LoginDao;
import com.login.regi.daoimpl.LoginDaoImpl;
import com.login.regi.service.LoginService;

public class LoginServiceImpl implements LoginService {

	@Override
	public boolean loginService(RegisterBean login) throws SQLException {
		LoginDao log=new LoginDaoImpl();
		return log.loginDao(login);
	}

}
