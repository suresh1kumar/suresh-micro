package com.microservice.app;

import java.util.List;

public interface ProductService {

	public Iterable<Product> findAll();
	public List<Product> getAllProducts();

}