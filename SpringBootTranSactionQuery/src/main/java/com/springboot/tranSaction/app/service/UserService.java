package com.springboot.tranSaction.app.service;

import java.util.List;

import com.springboot.tranSaction.app.model.User;

public interface UserService {
	
//public List<User> getUsers();
	
	
	
	public List<User> getAllUser();
	 
	 public User getUserById(long id);
	 
	 public void saveOrUpdate(User user);
	 
	 public void deleteUser(long id);

}
