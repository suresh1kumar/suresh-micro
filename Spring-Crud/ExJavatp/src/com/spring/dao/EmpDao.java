package com.spring.dao;

import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;  
import org.springframework.jdbc.core.JdbcTemplate;  
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.bean.User;  
  
@Repository
public class EmpDao {
	@Autowired
	JdbcTemplate template;  

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int save(User p) {
		String sql = "insert into EEMPLOYEES(ID,name,age,dept) values(" + p.getID() + ",'" + p.getNAME() + "',"
				+ p.getAGE() + ",'" + p.getDEPT() + "')";
		return template.update(sql);
	}

	public int update(User p) {
		String sql = "update EEMPLOYEES set name='" + p.getNAME() + "', age=" + p.getAGE() + ", dept='" + p.getDEPT()
				+ "' where id=" + p.getID() + "";
		System.out.println("update query ::"+sql);
		return template.update(sql);
	}

	public int delete(int id) {
		String sql = "delete from EEMPLOYEES where id=" + id + "";
		return template.update(sql);
	}

	public User getEmpById(int id) {
		String sql = "select * from EEMPLOYEES where id=?";
		return template.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<User>(User.class));
	}

	public List<User> getEmployees() {
		return template.query("select * from EEMPLOYEES", new RowMapper<User>() {
			public User mapRow(ResultSet rs, int row) throws SQLException {
				User e = new User();
				e.setID(rs.getInt(1));
				e.setNAME(rs.getString(2));
				e.setAGE(rs.getInt(3));
				e.setDEPT(rs.getString(4));
				return e;
			}
		});
	}
}  