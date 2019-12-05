package com.springboot.admissions.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableDiscoveryClient
@ComponentScan({ "com.springboot.admissions.app.dao,com.springboot.admissions.app.service,com.springboot.admissions.app.controller,com.springboot.admissions.app.model" } )
public class AdmissionsResourceServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(AdmissionsResourceServiceApplication.class, args);
	}

}
