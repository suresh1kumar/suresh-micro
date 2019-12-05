package com.microservice.app.service;

import java.util.List;

import com.microservice.app.dto.User;
public interface UserService {
	
	public List<User> getUser();
	
	
	
   /* public void createUser(User user);
    public User findById(long id);
    public User update(User user, long l);
    public void deleteUserById(long id);
    public User updatePartially(User user, long id);*/
}