package com.infotech.book.ticket.App;

import java.util.Date;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

import com.infotech.book.ticket.App.entities.Ticket;
import com.infotech.book.ticket.App.searvice.TicketBookingService;

@SpringBootApplication
public class TicketBookingManagementAppApplication implements CommandLineRunner{

	@Autowired
	private TicketBookingService ticketBookingService;
	
	@Autowired
	private DataSource dataSource;
	
	public static void main(String[] args) {
		SpringApplication.run(TicketBookingManagementAppApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		
		Ticket ticket=new Ticket();
		ticket.setBookingDate(new Date());
		ticket.setDestStation("patna");
		ticket.setSourceStation("Hyd");
		ticket.setPassangerName("Raja");
		ticket.setEmail("raja@gmail.com");
		ticketBookingService.createTicket(ticket);
		System.out.println("Data source ====::"+dataSource);
	}

	
	
	
/*public class TicketBookingManagementAppApplication {
	@Autowired
	private TicketBookingService ticketBookingService;
	
	public static void main(String[] args) {
		ConfigurableApplicationContext configurableApplicationContext=SpringApplication.run(TicketBookingManagementAppApplication.class, args);
		TicketBookingService ticketBookingService =configurableApplicationContext.getBean("ticketBookingService", TicketBookingService.class);
	
		Ticket ticket=new Ticket();
		ticket.setBookingDate(new Date());
		ticket.setDestStation("patna");
		ticket.setSourceStation("Hyd");
		ticket.setPassangerName("Raja");
		ticket.setEmail("raja@gmail.com");
		
		ticketBookingService.createTicket(ticket);
	}*/

	
}


//http://localhost:8080/api/tickets/create
	//http://localhost:8080/api/tickets/ticket/3