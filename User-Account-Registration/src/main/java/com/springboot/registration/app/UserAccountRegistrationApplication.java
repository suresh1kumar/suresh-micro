package com.springboot.registration.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
@ComponentScan({ "com.springboot.registration.app.configuration, com.springboot.registration.app.controller,com.springboot.registration.app.model,com.springboot.registration.app.repository,com.springboot.registration.app.service" }) // If our Controller class or Service class is not in the same packages we have //to add packages's name like this...directory(package) with main class

public class UserAccountRegistrationApplication {

	public static void main(String[] args) {
		SpringApplication.run(UserAccountRegistrationApplication.class, args);
	}

}
