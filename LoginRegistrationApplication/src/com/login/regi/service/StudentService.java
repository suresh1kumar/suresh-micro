package com.login.regi.service;

import java.sql.SQLException;
import java.util.List;

import com.login.regi.bean.StudentBean;

public interface StudentService {
	public boolean addStudent(StudentBean studentBean) throws SQLException;

	public List<StudentBean> getStudentDetails(int studentId) throws SQLException;
}
