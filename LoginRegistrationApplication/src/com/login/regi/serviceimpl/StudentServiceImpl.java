package com.login.regi.serviceimpl;

import java.sql.SQLException;
import java.util.List;

import com.login.regi.bean.StudentBean;
import com.login.regi.dao.StudentDao;
import com.login.regi.daoimpl.StudentDaoImpl;
import com.login.regi.service.StudentService;

public class StudentServiceImpl implements StudentService {

	@Override
	public boolean addStudent(StudentBean studentBean) throws SQLException {
		StudentDao studentDao=new StudentDaoImpl();
		return studentDao.addStudent(studentBean);
	}

	@Override
	public List<StudentBean> getStudentDetails(int studentId) throws SQLException {
		StudentDao studentDao=new StudentDaoImpl();
		
		return studentDao.getAllStudentDetails(studentId);
	}

}
