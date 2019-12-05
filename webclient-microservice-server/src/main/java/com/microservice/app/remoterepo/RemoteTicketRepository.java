package com.microservice.app.remoterepo;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.client.RestTemplate;

import com.microservice.app.dto.Ticket;
import com.microservice.app.service.TicketBookingService;

public class RemoteTicketRepository implements TicketBookingService{

	@Autowired
	protected RestTemplate restTemplate;
	
	protected String serviceUrl;
	
	public RemoteTicketRepository(String serviceUrl) {
		this.serviceUrl = serviceUrl.startsWith("http") ? serviceUrl: "http://" + serviceUrl;
	}
	
	@Override
	public List<Ticket> getTicket() {
		System.out.println("\n\n\n******************************<< Ticket RemoteAccountRepository >>*****************\n\n\n");
		System.out.println("serviceUrl  ::"+serviceUrl);
		System.out.println(serviceUrl.startsWith("http") ? serviceUrl: "http://" + serviceUrl);
		Ticket[] ticket = restTemplate.getForObject(serviceUrl+"/ticket/getTicket", Ticket[].class);
		return Arrays.asList(ticket);
	}

	
}
