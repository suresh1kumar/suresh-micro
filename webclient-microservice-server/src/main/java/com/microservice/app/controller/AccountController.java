package com.microservice.app.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.microservice.app.dto.Book;
import com.microservice.app.dto.Ticket;
import com.microservice.app.service.AccountRepository;
import com.microservice.app.service.BookRepository;
import com.microservice.app.service.TicketBookingService;
import com.microservice.app.service.UserService;
import com.microservice.app.serviceImpl.ResponseList;
import com.netflix.client.http.HttpResponse;

@Controller
public class AccountController {
	
	@Autowired
	AccountRepository accountRepository;
	
	@Autowired
	UserService userService;
	
	@Autowired
	TicketBookingService ticketBookingService;
	
	@Autowired
	BookRepository bookRepository;
	
	@RequestMapping("/")
	public String home(){
		return "index";
	}
	@RequestMapping("/accountList")
	public String accountList(Model model) {
		model.addAttribute("accounts", accountRepository.getAllAccounts());
		return "accountList";
	}
	
	@RequestMapping("/accountDetails")
	public String accountDetails(@RequestParam("number") String id, Model model) {
		model.addAttribute("account", accountRepository.getAccount(id));
		return "accountDetails";
	}
	
	@RequestMapping("/getProduct")
	public String productList(Model model) {
		System.out.println("\n\n\n userService controller ===================="+userService.getUser());
		model.addAttribute("userService", userService.getUser());
		return "country";
	}
	
	
	
	
	@RequestMapping(value = "/ticketHome", method = RequestMethod.GET)
    public ModelAndView showChannel() {
		ModelAndView model = new ModelAndView();
        model.setViewName("ticket2");
        return model;
    }
	
	/*@RequestMapping("/ticketHome")
	public String ticketHome(){
		return "ticket2";
	}*/
	
	@RequestMapping(value= "/getTicket", method = RequestMethod.GET)
	public ResponseEntity<List<Ticket>> getAllPersons() {
		System.out.println("========================home getTicket controller===================================");
    	
		List<Ticket> list = ticketBookingService.getTicket();
		System.out.println("ticketBookingService list :: "+list);
		return new ResponseEntity<List<Ticket>>(list, HttpStatus.OK);
	} 
	
/***********************   <<Get All Book Record>>************************/
	/*@RequestMapping(value = "/bookHome", method = RequestMethod.GET)
    public ModelAndView showBook() {
		ModelAndView model = new ModelAndView();
        model.setViewName("book");
        return model;
    }*/
	
	@RequestMapping(value= "/rest/getBook", method = RequestMethod.GET)
	public ResponseEntity<List<Book>> getAllBook() {
		System.out.println("========================<<home getBook controller>>===================================");
    	
		List<Book> list = bookRepository.getEmployees();
		System.out.println("ticketBookingService list :: "+list);
		return new ResponseEntity<List<Book>>(list, HttpStatus.OK);
	} 
	/*
	 * @RequestMapping(value = "/rest/addBook", method = RequestMethod.POST)
    public @ResponseBody String addBook(@RequestBody Book book) { 
        System.out.println("#########addBook()#########");
        bookService.addBook(book);
        return "OK";
    }
     
    @RequestMapping(value = "/rest/updateBook", method = RequestMethod.POST)
    public @ResponseBody String  updateBook(@RequestBody Book book) {
        System.out.println("#########updateBook()#########");
        bookService.updateBook(book); 
        return "OK";
    }
     
    @RequestMapping(value = "/rest/deleteBook", method = RequestMethod.POST)
    public @ResponseBody String  deleteBook(@RequestBody Book book) {
        System.out.println("#########deleteBook()#########");
        bookService.deleteBook(book.getId());
        return "OK";
    }
	 * */
}
