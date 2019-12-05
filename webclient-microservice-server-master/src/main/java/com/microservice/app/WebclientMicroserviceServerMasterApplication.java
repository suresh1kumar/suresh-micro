package com.microservice.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

import com.microservice.app.remoterepo.RemoteAccountRepository;
import com.microservice.app.remoterepo.RemoteBookRepository;
import com.microservice.app.remoterepo.RemoteTicketRepository;
import com.microservice.app.remoterepo.UserServiceImp;
import com.microservice.app.service.AccountRepository;
import com.microservice.app.service.BookRepository;
import com.microservice.app.service.TicketBookingService;
import com.microservice.app.service.UserService;

@SpringBootApplication
@EnableDiscoveryClient
public class WebclientMicroserviceServerMasterApplication {
	
	public static final String PRODUCT_SERVICE_URL = "http://TEST-MICROSERVICE";
	
	public static final String ACCOUNTS_SERVICE_URL = "http://ACCOUNTS-MICROSERVICE";
	
	public static final String TICKET_SERVICE_URL = "http://TICKET-MICROSERVICE";
	
	public static final String BOOK_SERVICE_URL = "http://BOOK-MICROSERVICE";
	
	public static void main(String[] args) {
		SpringApplication.run(WebclientMicroserviceServerMasterApplication.class, args);
	}

	 @Bean
	 @LoadBalanced
	 public RestTemplate restTemplate() {
	  return new RestTemplate();
	 }
	
	 @Bean
	 public AccountRepository accountRepository(){
	  return new RemoteAccountRepository(ACCOUNTS_SERVICE_URL);
	 }
	 
	 @Bean
	 public UserService productRepository(){
	  return new UserServiceImp(PRODUCT_SERVICE_URL);
	 }
	 
	 @Bean
	 public TicketBookingService ticketRepository(){
	  return new RemoteTicketRepository(TICKET_SERVICE_URL);
	 }
	 
	 @Bean
	 public BookRepository bookRepository(){
	  return new RemoteBookRepository(BOOK_SERVICE_URL);
	 }
	
}
