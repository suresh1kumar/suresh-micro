package com.microservice.app.service;

import java.util.List;
import java.util.Optional;

import com.microservice.app.dto.Book;


public interface BookRepository {

	public List<Book> getEmployees();
	//public Optional<Book> getEmployeeById(int empid);
	/*public Book getEmployeeById(int empid);
	public List<Book> addNewEmployee(Book emp);
	public List<Book> updateEmployee(Book emp);
	public void deleteEmployeeById(int empid);
	public void deleteAllEmployees();*/
	//public Book getEmployeeByIds(int empid);
	public Book getUserById(int id);
	 
	 public void saveOrUpdate(Book user);
	 
	 public void deleteUser(int id);

}
