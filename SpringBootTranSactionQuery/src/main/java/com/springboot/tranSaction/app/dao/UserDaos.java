package com.springboot.tranSaction.app.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.springboot.tranSaction.app.model.User;


//public interface UserDao {
//@Repository
public interface UserDaos extends CrudRepository<User, Long> {

	//public List<User> getUsers();
	
	//public void insert(List<User> users);
	
	
	
	
}
/*public List<User> getAllUser();

public User getUserById(long id);

public void saveOrUpdate(User user);

public void deleteUser(long id);*/