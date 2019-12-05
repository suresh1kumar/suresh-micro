/*package com.microservice.app.configuration;

import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

import com.microservice.app.remoterepo.RemoteAccountRepository;
import com.microservice.app.remoterepo.RemoteBookRepository;
import com.microservice.app.remoterepo.RemoteTicketRepository;
import com.microservice.app.remoterepo.UserServiceImp;
import com.microservice.app.resturl.MicroserviceRestURL;
import com.microservice.app.service.AccountRepository;
import com.microservice.app.service.BookRepository;
import com.microservice.app.service.TicketBookingService;
import com.microservice.app.service.UserService;

@Configuration
public class MicroserviceConfiguration {
	
	@Bean
	 @LoadBalanced
	 public RestTemplate restTemplate() {
	  return new RestTemplate();
	 }
	
	 @Bean
	 public AccountRepository accountRepository(){
	  return new RemoteAccountRepository(MicroserviceRestURL.ACCOUNTS_SERVICE_URL);
	 }
	 
	 @Bean
	 public UserService productRepository(){
	  return new UserServiceImp(MicroserviceRestURL.PRODUCT_SERVICE_URL);
	 }
	 
	 @Bean
	 public TicketBookingService ticketRepository(){
	  return new RemoteTicketRepository(MicroserviceRestURL.TICKET_SERVICE_URL);
	 }
	 
	 @Bean
	 public BookRepository bookRepository(){
	  return new RemoteBookRepository(MicroserviceRestURL.BOOK_SERVICE_URL);
	 }

}
*/