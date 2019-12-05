package com.login.regi.serviceImpl;

import java.sql.SQLException;

import com.login.regi.bean.RegisterBean;
import com.login.regi.dao.LoginDao;
import com.login.regi.daoImpl.LoginDaoImpl;
import com.login.regi.service.LoginService;

public class LoginServiceImpl implements LoginService {

	@Override
	public int loginService(RegisterBean login) throws SQLException {
		LoginDao log=new LoginDaoImpl();
		return log.loginDao(login);
	}

}
