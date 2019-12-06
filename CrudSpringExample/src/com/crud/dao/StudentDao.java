package com.crud.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.crud.bean.StudentBean;

@Repository
public class StudentDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final String SELECT_QUERY = "SELECT ROLL, NAME, ADDRESS FROM str";
	
	// @Override
	    public void insertStudentRecord(StudentBean student) {
	    	System.out.println("******************<add Dao>>**********************");
		 String sql = "INSERT INTO STR (ROLL,name, address) VALUES (roll_seq.NEXTVAL, ?, ?)";
		 System.out.println("query ::"+sql);
		 System.out.println("name ::"+student.getName());
		 System.out.println("Address ::"+ student.getAddress());
     jdbcTemplate.update(sql, student.getName(), student.getAddress());
 }
	    
	// ====================================view

	public List<StudentBean> getStudentRecord() {
		String SELECT_QUERY = " select * from str  ";

		return jdbcTemplate.query(SELECT_QUERY, new StudentRowMapper());
	}

	private final class StudentRowMapper implements RowMapper<StudentBean> {
		@Override
		public StudentBean mapRow(ResultSet rs, int args) throws SQLException {
			System.out.println("*******************<< View Dao >>*****************8");
			System.out.println("ROLL ::" + rs.getInt("ROLL") + "NAME ::" + rs.getString("NAME") + "ADDRESS ::"
					+ rs.getString("ADDRESS"));
			return new StudentBean(rs.getInt("ROLL"), rs.getString("NAME"), rs.getString("ADDRESS"));
		}
	}

	// ==================================update

	//@SuppressWarnings("rawtypes")
	public StudentBean getEmpById(int id) {
		System.out.println("***********<< getElement By Id Dao >>**********************");
		System.out.println("id vaaaaaaa ::" + id);
		String sql = "select * from str where roll=?";
		System.out.println("get  id ::" + sql);
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new UserRowMapper());
	}

	class UserRowMapper implements RowMapper<StudentBean> {
		@Override
		public StudentBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			StudentBean user = new StudentBean();
			user.setRoll(rs.getInt("roll"));
			user.setName(rs.getString("name"));
			user.setAddress(rs.getString("address"));
			return user;
		}
	}
	
	public int update(StudentBean p) {
		System.out.println("**********************<< Update Dao >>**********************");
		String sql = "update str set name=?,address=? where roll=?";
		System.out.println("all student date ::" + p.toString());
		System.out.println("roll ::" + p.getRoll());
		System.out.println("name ::" + p.getName());
		System.out.println("Addres ::" + p.getAddress());
		System.out.println("query ::" + sql);
		return jdbcTemplate.update(sql, new Object[] { p.getName(), p.getAddress(), p.getRoll() });
	}

	/*public int deleteRow(StudentBean roll) {
		String sql = "Delete from str Where Id = ?";
		int rowCount = jdbcTemplate.update(sql, roll.getRoll());
		return rowCount;
	}*/

	public int delete(int id) {
		System.out.println("**************<< delete Dao >>****************");
		String sql = "delete from str where roll=" + id + "";
		return jdbcTemplate.update(sql);
	}

}