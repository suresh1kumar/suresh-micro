package com.microservice.app.controller;

import java.util.List;
import java.util.Optional;

import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.microservice.app.dto.Book;
import com.microservice.app.service.BookRepository;

@Controller
public class BookController {

	@Autowired
	BookRepository bookRepository;
	
	@RequestMapping(value = "/bookHome", method = RequestMethod.GET)
    public ModelAndView showBook() {
		ModelAndView model = new ModelAndView();
        model.setViewName("book");
        return model;
    }
	
	//-------------------Retrieve All Users--------------------------------------------------------
    
    @RequestMapping(value = "/getAllBooks", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON)
    public ResponseEntity<List<Book>> listAllUsers() {
        List<Book> books = bookRepository.getEmployees();
        System.out.println("\n\nbookRepository======================= ::"+books);
        if(books.isEmpty()){
            return new ResponseEntity<List<Book>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Book>>(books, HttpStatus.OK);
    }
 
    
    
    //-------------------Retrieve Single User--------------------------------------------------------
     
    @RequestMapping(value = "/getAllBooksId/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON)
    public ResponseEntity<Book> getUser(@PathVariable("id") int id) {
        System.out.println("Fetching User with id " + id);
     //   Book book = bookRepository.findById(id);
        Book book = bookRepository.getUserById(id);
        if (book == null) {
            System.out.println("Book with id " + id + " not found");
            return new ResponseEntity<Book>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Book>(book, HttpStatus.OK);
    }
 
     
     
    //-------------------Create a User--------------------------------------------------------
    
    //@PostMapping(value = "/getAllBooks",produces = MediaType.APPLICATION_JSON)
    @RequestMapping(value = "/getAllBooksCreate",  method = { RequestMethod.POST, RequestMethod.GET }, produces = MediaType.APPLICATION_JSON)
    public ResponseEntity<Void> createUser(@RequestBody Book book,UriComponentsBuilder ucBuilder) {
        System.out.println("Creating User " + book.getBookTitle());
 
        /*if (bookRepository.isUserExist(book)) {
            System.out.println("A User with name " + book.getBookTitle() + " already exist");
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }*/
        System.out.println("ucBuilder  ==:" + ucBuilder);
        System.out.println("getBook  :" + book.toString());
        System.out.println("getBook Title :" + book.getId());
        System.out.println("getBook Title :" + book.getBookTitle());
        System.out.println("getAuthor Name :" + book.getAuthorName());
        System.out.println("getBook Description :" + book.getBookDescription());
        System.out.println("getBook Price :" + book.getBookPrice());
        System.out.println("Creating Book :" + book.getIsbn());
        System.out.println("getCreate Date :" + book.getCreateDate());
        //System.out.println("bookRepository.saveUser(book) ==:" + bookRepository.saveOrUpdate(book));
        bookRepository.saveOrUpdate(book);
      //  System.out.println("bookRepository.saveUser(book) ==:" + bookRepository.saveOrUpdate(book));
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/getAllBooksId/{id}").buildAndExpand(book.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
    //------------------- Update a User --------------------------------------------------------
    
    @RequestMapping(value = "/getAllBooksCreateUpdate/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Book> updateUser(@PathVariable("id") int id, @RequestBody Book book) {
        System.out.println("Updating User " + id);
         
        Book currentUser = bookRepository.getUserById(id);
         
        if (currentUser==null) {
            System.out.println("Book with id " + id + " not found");
            return new ResponseEntity<Book>(HttpStatus.NOT_FOUND);
        }
 
        currentUser.setBookTitle(book.getBookTitle());
		currentUser.setAuthorName(book.getAuthorName());
		currentUser.setBookDescription(book.getBookDescription());
		currentUser.setBookPrice(book.getBookPrice());
		currentUser.setIsbn(book.getIsbn());
         
		bookRepository.saveOrUpdate(currentUser);
        return new ResponseEntity<Book>(currentUser, HttpStatus.OK);
    }
   /* @RequestMapping(value = "/updateBook/{id}", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON)
    public ResponseEntity<Book> updateUser(@PathVariable("id") int id, @RequestBody Book book) {
        System.out.println("Updating User " + id);
         
        Book currentUser = bookRepository.getEmployeeById(id);
        System.out.println("\n\nbookRepository.getEmployeeById ::" +bookRepository.getEmployeeById(id));
        if (currentUser==null) {
            System.out.println("Book with id " + id + " not found");
            return new ResponseEntity<Book>(HttpStatus.NOT_FOUND);
        }
		currentUser.setBookTitle(book.getBookTitle());
		currentUser.setAuthorName(book.getAuthorName());
		currentUser.setBookDescription(book.getBookDescription());
		currentUser.setBookPrice(book.getBookPrice());
		currentUser.setIsbn(book.getIsbn());

        bookRepository.updateEmployee(currentUser);
        System.out.println("\n\nBook with currentUser " +currentUser);
        System.out.println("\nBook with bookRepository " +bookRepository.updateEmployee(currentUser));
        return new ResponseEntity<Book>(currentUser, HttpStatus.OK);
    }
 
    
    
    //------------------- Delete a User --------------------------------------------------------
     
    @RequestMapping(value = "/book/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON)
    public ResponseEntity<Book> deleteUser(@PathVariable("id") int id) {
        System.out.println("Fetching & Deleting Book with id " + id);
 
        Book book = bookRepository.getEmployeeById(id);
        if (book == null) {
            System.out.println("Unable to delete. Book with id " + id + " not found");
            return new ResponseEntity<Book>(HttpStatus.NOT_FOUND);
        }
 
        bookRepository.deleteEmployeeById(id);
        return new ResponseEntity<Book>(HttpStatus.NO_CONTENT);
    }*/
 
     
    
    //------------------- Delete All Users --------------------------------------------------------
     
    /*@RequestMapping(value = "/book/", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON)
    public ResponseEntity<Book> deleteAllUsers() {
        System.out.println("Deleting All Book");
 
        bookRepository.deleteAllEmployees();
        return new ResponseEntity<Book>(HttpStatus.NO_CONTENT);
    }*/
	
	
}
