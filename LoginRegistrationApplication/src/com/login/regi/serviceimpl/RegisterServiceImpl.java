package com.login.regi.serviceimpl;

import java.sql.SQLException;

import com.login.regi.bean.RegisterBean;
import com.login.regi.dao.RegisterDao;
import com.login.regi.daoimpl.RegisterDaoImpl;
import com.login.regi.service.RegisterService;

public class RegisterServiceImpl implements RegisterService {

	@Override
	public boolean getRegister(RegisterBean register) throws SQLException {
		RegisterDao registerDao=new RegisterDaoImpl();
		return registerDao.getRegister(register);
	}

}
