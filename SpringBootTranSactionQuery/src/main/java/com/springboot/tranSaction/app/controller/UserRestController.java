package com.springboot.tranSaction.app.controller;


import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.springboot.tranSaction.app.model.User;
import com.springboot.tranSaction.app.service.UserService;


@RestController
@RequestMapping(value={"/user"})
public class UserRestController {
	
	@Autowired
	UserService userService;
	
	/*@RequestMapping(value = "/userIndexPage", method = RequestMethod.GET)
    public ModelAndView showBook() {
		ModelAndView model = new ModelAndView();
        model.setViewName("user_form");
        return model;
    }*/
	
	//-------------------Retrieve All Users--------------------------------------------------------
	@GetMapping(value="/getUserData", headers="Accept=application/json")
    //@RequestMapping(value = "/getUserData/", method = RequestMethod.GET)
    public ResponseEntity<List<User>> listAllUsers() {
        List<User> users = userService.getAllUser();
        System.out.println("getAll User ::"+users);
        if(users.isEmpty()){
            return new ResponseEntity<List<User>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<User>>(users, HttpStatus.OK);
    }
 
	 
	 
	@PostMapping(value="/getUserData", headers="Accept=application/json")
	 //@RequestMapping(value = "/getUserData/", method = RequestMethod.POST)
	    public ResponseEntity<Void> createUser(@RequestBody User user,UriComponentsBuilder ucBuilder) {
	        System.out.println("Creating User " + user.getUserName());
	 
	        /*if (userService.isUserExist(user)) {
	            System.out.println("A User with name " + user.getUserName() + " already exist");
	            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	        }*/
	        System.out.println("saveOrUpdate11=================saveOrUpdate=11==================="+user);
	        userService.saveOrUpdate(user);
	        System.out.println("saveOrUpdate=22================saveOrUpdate======22=============="+user);
	        HttpHeaders headers = new HttpHeaders();
	        headers.setLocation(ucBuilder.path("/getUserData/{userId}").buildAndExpand(user.getUserId()).toUri());
	        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	    }
	 
	
	 //-------------------Retrieve Single User--------------------------------------------------------
	@GetMapping(value="/getUserData/{userId}", headers="Accept=application/json")
    //@RequestMapping(value = "/user/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> getUser(@PathVariable("userId") long userId) {
        System.out.println("Fetching User with id " + userId);
        User user = userService.getUserById(userId);
        if (user == null) {
            System.out.println("User with id " + userId + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }
	 
	
	@PutMapping(value="/getUserData/{userId}", headers="Accept=application/json")
	//@RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
    public ResponseEntity<User> updateUser(@PathVariable("userId") long id, @RequestBody User user) {
		System.out.println("***************************Updating User ************************************" );
        
        System.out.println("Updating User " + id);
         
        User currentUser = userService.getUserById(id);
        System.out.println("Updating currentUser ID :: " + currentUser);
        if (currentUser==null) {
            System.out.println("User with id " + id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }else {
	        currentUser.setUserName(user.getUserName());
	        currentUser.setBookingDate(user.getBookingDate());
	        currentUser.setSourceStation(user.getSourceStation());
	        currentUser.setDestStation(user.getDestStation());
	        currentUser.setEmail(user.getEmail());
	         
	        userService.saveOrUpdate(currentUser);
        }
        return new ResponseEntity<User>(currentUser, HttpStatus.OK);
    }
	 
	 
	 
	//------------------- Delete a User --------------------------------------------------------
    @DeleteMapping(value="/getUserData/{userId}", headers="Accept=application/json")
    //@RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<User> deleteUser(@PathVariable("userId") long id) {
        System.out.println("Fetching & Deleting User with id " + id);
        
        User user = userService.getUserById(id);
        if (user == null) {
            System.out.println("Unable to delete. User with id " + id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
 
        userService.deleteUser(id);
        return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
    }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 /*@RequestMapping(value="/addArticle/", method=RequestMethod.GET)
	 public ModelAndView addArticle() {
	  ModelAndView model = new ModelAndView();
	  
	  User article = new User();
	  model.addObject("articleForm", article);
	  model.setViewName("user_form");
	  
	  return model;
	 }
	 
	 @RequestMapping(value="/updateArticle/{id}", method=RequestMethod.GET)
	 public ModelAndView editArticle(@PathVariable long id) {
	  ModelAndView model = new ModelAndView();
	  
	  User article = userService.getUserById(id);
	  model.addObject("articleForm", article);
	  model.setViewName("user_form");
	  
	  return model;
	 }
	 
	 @RequestMapping(value="/saveArticle", method=RequestMethod.POST)
	 public ModelAndView save(@ModelAttribute("articleForm") User user) {
		 userService.saveOrUpdate(user);
	  
	  return new ModelAndView("redirect:/article/list");
	 }
	 
	 @RequestMapping(value="/deleteArticle/{id}", method=RequestMethod.GET)
	 public ModelAndView delete(@PathVariable("id") long id) {
		 userService.deleteUser(id);
	  
	  return new ModelAndView("redirect:/article/list");
	 }*/

}
