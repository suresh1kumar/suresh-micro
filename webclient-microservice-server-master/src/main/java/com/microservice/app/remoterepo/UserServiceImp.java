package com.microservice.app.remoterepo;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.microservice.app.dto.User;
import com.microservice.app.service.UserService;



public class UserServiceImp implements UserService {
    
    @Autowired
	protected RestTemplate restTemplate;
	
	protected String serviceUrl;
	
	public UserServiceImp(String serviceUrl) {
		this.serviceUrl = serviceUrl.startsWith("http") ? serviceUrl: "http://" + serviceUrl;
	}

	@Override
	public List<User> getUser() {
		System.out.println("\n\n\n******************************<< User RemoteAccountRepository >>*****************\n\n\n");
		System.out.println("serviceUrl  ::"+serviceUrl);
		System.out.println(serviceUrl.startsWith("http") ? serviceUrl: "http://" + serviceUrl);
		
		User[] user = restTemplate.getForObject(serviceUrl+"/user/get", User[].class);
		return Arrays.asList(user);
	}
    
    
    
    
    
}