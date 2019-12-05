package com.infotech.book.ticket.App.searvice;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infotech.book.ticket.App.dao.TicketBookingDao;
import com.infotech.book.ticket.App.entities.Ticket;

@Service
public class TicketBookingService {
	
	@Autowired
	private TicketBookingDao ticketBookingDao;
	
	public Ticket createTicket(Ticket ticket) {
		
		return ticketBookingDao.save(ticket);
	}
	
	public Optional<Ticket> getTicketById(Integer ticketId) {
		return ticketBookingDao.findById(ticketId);
	}
	
	public Iterable<Ticket> getAllBookTickets(){
		return ticketBookingDao.findAll();
	}
	public void deleteTicket(Integer ticketId) {
		System.out.println("sssssssssssssssssssssssssssssssssssssssssss\n\n\n\n");
		 ticketBookingDao.deleteById(ticketId);
	}

	/*public Ticket updateTicket(Integer ticketId, String newEmail) {
		
		Ticket ticketFromDb= ticketBookingDao.findById(ticketId);
		ticketFromDb.setEmail(newEmail);
		Ticket updateTicket=ticketBookingDao.save(ticketFromDb);
		return updateTicket;
	}*/

}
