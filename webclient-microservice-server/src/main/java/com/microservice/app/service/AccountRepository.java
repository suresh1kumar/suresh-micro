package com.microservice.app.service;

import java.util.List;

import com.microservice.app.dto.Account;

public interface AccountRepository {
	
	List<Account> getAllAccounts();
	
	Account getAccount(String number);
}
