package com.infotech.book.ticket.App.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.infotech.book.ticket.App.entities.Ticket;
import com.infotech.book.ticket.App.searvice.TicketBookingService;

@RestController
@RequestMapping(value="/api/tickets")
public class TicketBookingController {

	@Autowired
	private TicketBookingService ticketBookingService;
	
	@PostMapping(value="/create")
	public Ticket createTicket(@RequestBody Ticket ticket) {
		
		return ticketBookingService.createTicket(ticket);
	}
	
	@GetMapping(value="/ticket/{ticketId}")
	public Optional<Ticket> getTicketById(@PathVariable("ticketId") Integer ticketId) {
		return ticketBookingService.getTicketById(ticketId);
	}
	
	@GetMapping(value="/ticket/alltickets")
	public Iterable<Ticket> getAllBookTickets(){
		
		return ticketBookingService.getAllBookTickets();
	}
	
	@DeleteMapping(value="/dticket/{ticketId}")
	public void deleteTicket(@PathVariable("ticketId") Integer ticketId){
		System.out.println("00000000000000000000000000000000000000000000000000000\n\n\n\n\n");
		 ticketBookingService.deleteTicket(ticketId);
	}
	
	/*@PutMapping(value="/ticket/{ticketId}/{newEmail:.+}")
	public Ticket updateTicket(@PathVariable("ticketId") Integer ticketId,@PathVariable("newEmail")String newEmail) {
		
		return ticketBookingService.updateTicket(ticketId,newEmail);
	}*/
	
	
	
}
