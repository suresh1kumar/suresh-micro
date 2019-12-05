package com.springboot.registration.app.configuration;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import com.springboot.registration.app.UserAccountRegistrationApplication;

public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		System.out.println("SpringApplicationBuilder ---::"+application);
		return application.sources(UserAccountRegistrationApplication.class);
	}

}
