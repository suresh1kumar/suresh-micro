package com.microservice.app.remoterepo;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.client.RestTemplate;

import com.microservice.app.dto.Account;
import com.microservice.app.dto.Book;
import com.microservice.app.dto.Ticket;
import com.microservice.app.service.BookRepository;


public class RemoteBookRepository implements BookRepository { 

	@Autowired
	protected RestTemplate restTemplate;
	
	protected String serviceUrl;
	
	public RemoteBookRepository(String serviceUrl) {
		this.serviceUrl = serviceUrl.startsWith("http") ? serviceUrl: "http://" + serviceUrl;
	}

	@Override
	public List<Book> getEmployees() {
		System.out.println("\n\n\n******************************<< getEmployees RemoteBookRepository >>*****************\n\n\n");
		System.out.println("serviceUrl  ::"+serviceUrl);
		System.out.println(serviceUrl.startsWith("http") ? serviceUrl: "http://" + serviceUrl);
		Book[] book = restTemplate.getForObject(serviceUrl+"/book-management/employee/all", Book[].class);
		return Arrays.asList(book);
	}

	@Override
	public Book saveUser(Book book) {
		System.out.println("\n\n\n******************************<< addNewEmployee RemoteBookRepository >>*****************\n\n\n");
		System.out.println("serviceUrl  ::"+serviceUrl);
		System.out.println(serviceUrl.startsWith("http") ? serviceUrl: "http://" + serviceUrl);
		//return restTemplate.getForObject(serviceUrl + "/book-management/accounts/{id}", Book.class, emp);
		//Book book = restTemplate.getForObject(serviceUrl+"/book-management/employee/add", Book[].class);
		System.out.println("addNewEmployee   RemoteBook Repose::"+book);
		return restTemplate.getForObject(serviceUrl + "/book-management/employee/add", Book.class, book);
	}

	@Override
	public Book updateUser(Book book) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book deleteUserById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book findById(int id) {
		System.out.println("\n\n\n******************************<< addNewEmployee RemoteBookRepository >>*****************\n\n\n");
		System.out.println("serviceUrl  ::"+serviceUrl);
		System.out.println(serviceUrl.startsWith("http") ? serviceUrl: "http://" + serviceUrl);
		//return restTemplate.getForObject(serviceUrl + "/book-management/accounts/{id}", Book.class, emp);
		//Book book = restTemplate.getForObject(serviceUrl+"/book-management/employee/add", Book[].class);
		System.out.println("addNewEmployee   RemoteBook Repose::"+id);
		return restTemplate.getForObject(serviceUrl + "/book-management/employeeId/{id}", Book.class, id);
	}

	

	/*@Override
	public Book getEmployeeById(int empid) {
		System.out.println("\n\n\n******************************<< getEmployeeById RemoteBookRepository >>*****************\n\n\n");
		System.out.println("serviceUrl  ::"+serviceUrl);
		System.out.println(serviceUrl.startsWith("http") ? serviceUrl: "http://" + serviceUrl);
		return restTemplate.getForObject(serviceUrl + "/book-management/employeeId/{id}", Book.class, empid);
		//return restTemplate.getForObject(serviceUrl + "/accounts/{id}", Book.class);
	}

	@Override
	public List<Book> addNewEmployee(Book emp) {
		System.out.println("\n\n\n******************************<< addNewEmployee RemoteBookRepository >>*****************\n\n\n");
		System.out.println("serviceUrl  ::"+serviceUrl);
		System.out.println(serviceUrl.startsWith("http") ? serviceUrl: "http://" + serviceUrl);
		//return restTemplate.getForObject(serviceUrl + "/book-management/accounts/{id}", Book.class, emp);
		Book[] book = restTemplate.getForObject(serviceUrl+"/book-management/employee/add", Book[].class);
		System.out.println("addNewEmployee   RemoteBook Repose::"+book);
		return  Arrays.asList(book);
	}

	@Override
	public List<Book> updateEmployee(Book emp) {
		
		System.out.println("\n\n\n******************************<< updateEmployee RemoteBookRepository >>*****************\n\n\n");
		System.out.println("serviceUrl  ::"+serviceUrl);
		System.out.println(serviceUrl.startsWith("http") ? serviceUrl: "http://" + serviceUrl);
		int id=emp.getId();
		//return restTemplate.getForObject(serviceUrl + "/book-management/accounts/{id}", Book.class, emp);
		Book[] book = restTemplate.getForObject(serviceUrl+"/book-management/employee/update/{id}", Book[].class,id);
		return Arrays.asList(book);
	}

	@Override
	public void deleteEmployeeById(int empid) {
		System.out.println("\n\n\n******************************<< deleteEmployeeById RemoteBookRepository >>*****************\n\n\n");
		System.out.println("serviceUrl  ::"+serviceUrl);
		System.out.println(serviceUrl.startsWith("http") ? serviceUrl: "http://" + serviceUrl);
		
		restTemplate.getForObject(serviceUrl + "/book-management/employee/delete/{empid}", Book.class, empid);
		
	}

	@Override
	public void deleteAllEmployees() {
		
		restTemplate.getForObject(serviceUrl + "/book-management/accounts", Book.class);
		
	}
	*/
	

}
