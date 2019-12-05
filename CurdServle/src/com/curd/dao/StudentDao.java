package com.curd.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.curd.bean.Student;

public interface StudentDao {
public boolean addPersonalDetailsDao(Student pdd) throws  SQLException;
	
	public List<Student> getAllPersonalDetailsDao(int uid)throws SQLException;
	
	public boolean updatePersonalDeatilsDao(Student personalDetailsDto) throws SQLException;
	public void deleteContact(String sid);
	//public boolean deletePersonalDetailsDao(int sid)throws SQLException;
	public List<Student> getAllStudentDetails()throws SQLException ;
	//public boolean deleteStudentDao(int sid)throws SQLException;
	
	//public void updateContact(String sid, String name, String mobile, String email,String sdate);
	//public Map<Integer, Student> getContactById(String id);

}
