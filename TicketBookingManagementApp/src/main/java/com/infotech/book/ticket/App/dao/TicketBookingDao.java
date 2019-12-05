package com.infotech.book.ticket.App.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.infotech.book.ticket.App.entities.Ticket;

//@Repository
public interface TicketBookingDao extends CrudRepository<Ticket, Integer>{

	

}
