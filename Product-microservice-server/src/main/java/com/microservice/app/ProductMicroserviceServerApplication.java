package com.microservice.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
//@EnableDiscoveryClient
//@EnableAutoConfiguration(exclude= {ErrorMvcAutoConfiguration.class})
public class ProductMicroserviceServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProductMicroserviceServerApplication.class, args);
	}

}
