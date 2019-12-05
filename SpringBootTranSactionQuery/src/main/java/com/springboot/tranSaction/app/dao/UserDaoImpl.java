/*package com.springboot.tranSaction.app.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springboot.tranSaction.app.model.User;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	
	@Override
	public List<User> getUsers() {
		System.out.println("Retrieve all Users List...");
        List<User> userList = jdbcTemplate.query("select Name, Dept, Salary from USER", (resultSet, i) -> new User(resultSet.getString("Name"),
                resultSet.getString("Dept"),
                resultSet.getLong("Salary")));

        return userList;
    
	}

	@Override
	public void insert(List<User> users) {
		for (User user : users) {
            System.out.println("Inserting Data for User name: " + user.getName());
            jdbcTemplate.update("insert into USER(Name, Dept, Salary) values (?, ?, ?)",
                    preparedStatement -> {
                        preparedStatement.setString(1, user.getName());
                        preparedStatement.setString(2, user.getDept());
                        preparedStatement.setLong(3, user.getSalary());
                    });
        }
		
	}

}
*/