package com.microservice.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImp implements UserService {
	
    @Autowired
    UserRepository userRepository;
    
    public List<User> getUser() {
        return (List<User>) userRepository.findAll();
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*public void createUser(User user) {
        userRepository.save(user);
    }

    public User findById(long id) {
    	User User=new User();
      //  return userRepository.findById(id);
    	return User;
    }

    public User update(User user, long l) {
        return userRepository.save(user);
    }

    public void deleteUserById(long id) {
        userRepository.deleteById(id);
    }

    public User updatePartially(User user, long id) {
        User usr = findById(id);
        usr.setCountry(user.getCountry());
        return userRepository.save(usr);
    }*/
}