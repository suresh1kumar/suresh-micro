package com.login.regi.dao;

import java.sql.SQLException;
import java.util.List;

import com.login.regi.bean.StudentBean;

public interface StudentDao {
	public boolean addStudent(StudentBean studentBean) throws SQLException;

	public List<StudentBean> getAllStudentDetails(int studentId) throws SQLException;
}
