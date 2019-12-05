package com.microservice.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class StudentMicroServiceServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(StudentMicroServiceServerApplication.class, args);
	}

}
