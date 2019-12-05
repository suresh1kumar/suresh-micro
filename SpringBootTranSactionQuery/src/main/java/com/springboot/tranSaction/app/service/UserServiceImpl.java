package com.springboot.tranSaction.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.tranSaction.app.dao.UserDaos;
import com.springboot.tranSaction.app.model.User;

@Service
//@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDaos userDao;


	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return (List<User>) userDao.findAll();
	}

	@Override
	public User getUserById(long id) {
		// TODO Auto-generated method stub
		return userDao.findById(id).get();
	}

	@Override
	public void saveOrUpdate(User user) {
		userDao.save(user);
		
	}

	@Override
	public void deleteUser(long id) {
		userDao.deleteById(id);
		
	}
	
	

}
