package com.springboot.admissions.app.controller;

import java.util.List;

import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.admissions.app.model.Patient;
import com.springboot.admissions.app.service.AdmissionsService;


@RestController
@RequestMapping(value = "/patients-management", produces = {MediaType.APPLICATION_JSON })
public class AdmissionsController {
	
	@Autowired
	private AdmissionsService admissionsService;
	
	@RequestMapping(value= "/getAllPatient", method= RequestMethod.GET)
	public List<Patient> getPatients() {
		System.out.println("\n*********************************<<getAllPatient>>**********************************");
		System.out.println("\n\n"+this.getClass().getSimpleName() + " - Get all getPatients service is invoked.");
		System.out.println(" \n- getAllPatient ::"+admissionsService.getPatients());
		
		return admissionsService.getPatients();
	}
	
	@RequestMapping(value = "/api/newPatient",method = RequestMethod.POST)
	public @ResponseBody Patient addPatient(@RequestBody Patient patient) {	// Hashing the password using BCrypt of Spring Security 
		System.out.println("\n=================<<addPatient>>==================="+patient);
		Patient newPatient = new Patient();
		newPatient.setName(patient.getName());
		newPatient.setAddress(patient.getAddress());
		return admissionsService.savePatients(newPatient);
	}
	
	 //-------------------Retrieve Single User--------------------------------------------------------
		
	@RequestMapping(value= "/getAllPatient/{id}", method= RequestMethod.GET)
	public @ResponseBody Patient getPatientById(@PathVariable("id") long id) {	// Hashing the password using BCrypt of Spring Security 
		System.out.println("\n***************************<<getPatientById>>***************************"+id);
		Patient p=admissionsService.getPatientById(id);
		System.out.println("\n=================getPatientById="+p);
		return p;
	}
	
		@RequestMapping(value = "/api/newPatientUpdate/{id}",method = RequestMethod.POST)
		public @ResponseBody Patient updatePatient(@PathVariable("id") long id,@RequestBody Patient patient) {	// Hashing the password using BCrypt of Spring Security 
			System.out.println("\n***************************<<UpdatingPatient>>***************************"+patient);
			Patient currentPatient = admissionsService.getPatientById(id);
			
			currentPatient.setName(patient.getName());
        	currentPatient.setAddress(patient.getAddress());
        	Patient p=admissionsService.updatePatient(currentPatient);
        	System.out.println(" updatePatient admissionsService ::"+p);
			return p;
		}

		@DeleteMapping(value="/deleteUser/{id}", headers="Accept=application/json")
	    public ResponseEntity<Patient> deleteUser(@PathVariable("id") long id) {
			System.out.println("\n***************************<<deleteUser>>***************************"+id);
	        System.out.println("Fetching & Deleting User with id " + id);
	        
	        Patient user = admissionsService.getPatientById(id);
	        if (user == null) {
	            System.out.println("Unable to delete. User with id " + id + " not found");
	            return new ResponseEntity<Patient>(HttpStatus.NOT_FOUND);
	        }
	        admissionsService.deletePatient(id);
	        return new ResponseEntity<Patient>(HttpStatus.NO_CONTENT);
	    }
		
		
		
		
		
		
		
		
		
		
	//000000000000000000000000000000000000000000000000000000000000	
		
		//-------------------Retrieve All Users--------------------------------------------------------
		/*@GetMapping(value="/getUserData", headers="Accept=application/json")
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
		 
		        if (userService.isUserExist(user)) {
		            System.out.println("A User with name " + user.getUserName() + " already exist");
		            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		        }
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
	    }*/
		 
}
