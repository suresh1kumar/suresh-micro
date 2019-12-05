package com.springboot.tranSaction.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.springboot.tranSaction.app,com.springboot.tranSaction.app.controller,"
		+ "com.springboot.tranSaction.app.dao,"
		+ "com.springboot.tranSaction.app.model,com.springboot.tranSaction.app.service")
public class SpringBootTranSactionQueryApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootTranSactionQueryApplication.class, args);
	}

}
