package com.springboot.registration.app.controller;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.nulabinc.zxcvbn.Strength;
import com.nulabinc.zxcvbn.Zxcvbn;
import com.springboot.registration.app.model.Role;
import com.springboot.registration.app.model.User;
import com.springboot.registration.app.repository.RoleRepository;
import com.springboot.registration.app.service.EmailService;
import com.springboot.registration.app.service.UserService;

@Controller
public class RegisterController {
	
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	private UserService userService;
	private EmailService emailService;
	
	@Autowired
    private JavaMailSender sender;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private RoleRepository roleRepository;
	
	//protected String serviceUrl;
	
	@Autowired
	public RegisterController(BCryptPasswordEncoder bCryptPasswordEncoder,
			UserService userService, EmailService emailService) {
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
		this.userService = userService;
		this.emailService = emailService;
	}
	
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login"); // resources/template/login.html
		return modelAndView;
	}
	
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public ModelAndView login2() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login"); // resources/template/login.html
		return modelAndView;
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("home"); // resources/template/home.html
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView homeAdmin() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin"); // resources/template/home.html
		return modelAndView;
	}
	
	// Return registration form template
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public ModelAndView showRegistrationPage(ModelAndView modelAndView, User user){
		modelAndView.addObject("user", user);
		modelAndView.setViewName("register");
		return modelAndView;
	}
	
	
	// Return showForgetPasswordPage form template
		@RequestMapping(value="/forgetPassword", method = RequestMethod.GET)
		public ModelAndView showForgetPasswordForm(ModelAndView modelAndView, User user){
			modelAndView.addObject("user", user);
			modelAndView.setViewName("forgetPassword");
			return modelAndView;
		}

	@RequestMapping(value ="/logout-success", method = RequestMethod.GET)
	public ModelAndView logoutPage() {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("\n\nYou have been logged out successful!! \" );");
		modelAndView.setViewName("login"); // resources/template/login.html
		modelAndView.addObject("confirmationMessage", "You have been logged out successful!! " );
		
		return modelAndView;
	}
	
	// Process form input data
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView processRegistrationForm(ModelAndView modelAndView, @Valid User user, BindingResult bindingResult, HttpServletRequest request) throws MessagingException {
				System.out.println("\n\n*******************************************<<processRegistrationForm>>*******************************************");
		// Lookup user in database by e-mail
		User userExists = userService.findByEmail(user.getEmail());
		
		System.out.println("userExists = userService.findByEmail ::"+userExists);
		
		if (userExists != null) {
			modelAndView.addObject("alreadyRegisteredMessage", "Oops!  There is already a user registered with the email provided.");
			modelAndView.setViewName("register");
			bindingResult.reject("email");
		}
			
		if (bindingResult.hasErrors()) { 
			modelAndView.setViewName("register");		
		} else { // new user so we create user and send confirmation e-mail
		    user.setEnabled(false);  // Disable user until they click on confirmation link in email
		    String a=UUID.randomUUID().toString(); // Generate random 36-character string token for confirmation link
		    System.out.println("UUID.randomUUID().toString() ::"+a);
		    user.setConfirmationToken(a);
		    Role userRole = roleRepository.findByRole("SITE_USER");
		    System.out.println("\n\n userRole controller --------------------::"+userRole);
		    user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
		    userService.saveUser(user);
			String appUrl = request.getScheme() + "://" + request.getServerName() + ":8022";
			//String appUrl = request.getScheme() + "://" + "192.168.0.5" + ":8025";
			System.out.println("\n\n AppUrl --------------------::"+appUrl);
		
			System.out.println("email id ---------------:"+user.getEmail());
			MimeMessage message = sender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message);
	        try {
	            helper.setTo(user.getEmail());
	            helper.setText("To confirm your e-mail address, please click the link below <br>:\n"
										+ appUrl + "/confirm?token=" + user.getConfirmationToken());
	            helper.setSubject("Registration Confirmation");
	        } catch (MessagingException e) {
	            e.printStackTrace();
	            return modelAndView.addObject("confirmationMessage", "A confirmation e-mail Not been sent to " + user.getEmail());
	        }
	        sender.send(message);
			System.out.println("\nA confirmation e-mail has been sent to ::" + user.getEmail());
			modelAndView.addObject("confirmationMessage", "A confirmation e-mail has been sent to " + user.getEmail());
			modelAndView.setViewName("register");
		}
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/forgetPassword", method = RequestMethod.POST)
	public ModelAndView showForgetPasswordPage(ModelAndView modelAndView, @Valid User user, BindingResult bindingResult, HttpServletRequest request) throws MessagingException {
				System.out.println("\n\n*******************************************<<showForgetPasswordPage>>*******************************************");
		// Lookup user in database by e-mail
				User userExists = userService.findByEmail(user.getEmail());
				
		System.out.println("userExists = user.getEmail() ::"+user.getEmail());
		System.out.println("userExists = userService.findByEmail ::"+userExists);
		
		if (userExists == null) {
			modelAndView.addObject("alreadyRegisteredMessage", "Oops!  There is Not a user registered with the email provided.");
			modelAndView.setViewName("forgetPassword");
			bindingResult.reject("email");
		}
			
		/*if (bindingResult.hasErrors()) { 
			modelAndView.setViewName("forgetPassword");		
		} */else { 
			
			String appUrl = request.getScheme() + "://" + request.getServerName() + ":8022";
			//String appUrl = request.getScheme() + "://" + "192.168.0.5" + ":8025";
			System.out.println("\n\n AppUrl --------------------::"+appUrl);
		
			System.out.println("email id ---------------:"+user.getEmail());
			MimeMessage message = sender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message);
	        try {
	            helper.setTo(user.getEmail());
	            helper.setText("my text <img src='images/suraj.jpg' width='200' height='200' alt='Logo' />  <br><br>\nTo confirm your e-mail address, please click the link below:\n"
										+ appUrl + "/forgetPasswordConfirm?email=" + user.getEmail(), true);
	            helper.setSubject("Forgot Password Confirmation");
	            
	        } catch (MessagingException e) {
	            e.printStackTrace();
	            return modelAndView.addObject("confirmationMessage", "A confirmation e-mail Not been sent to " + user.getEmail());
	        }
	        sender.send(message);
			System.out.println("\nA confirmation e-mail has been sent to ::" + user.getEmail());
			modelAndView.addObject("confirmationMessage", "A confirmation e-mail has been sent to " + user.getEmail());
			modelAndView.setViewName("forgetPassword");
		}
		return modelAndView;
	}
	
	
	
	// Process confirmation link
	@RequestMapping(value="/confirm", method = RequestMethod.GET)
	public ModelAndView confirmRegistration(ModelAndView modelAndView, @RequestParam("token") String token) {
		User user = userService.findByConfirmationToken(token);
		if (user == null) { // No token found in DB
			modelAndView.addObject("invalidToken", "Oops!  This is an invalid confirmation link.");
		} else { // Token found
			modelAndView.addObject("confirmationToken", user.getConfirmationToken());
		}
		modelAndView.setViewName("confirm");
		return modelAndView;		
	}

	// Process confirmation link
	@RequestMapping(value="/confirm", method = RequestMethod.POST)
	public ModelAndView confirmRegistration(ModelAndView modelAndView, BindingResult bindingResult, @RequestParam Map<String, String> requestParams, RedirectAttributes redir) {
		modelAndView.setViewName("confirm");
		Zxcvbn passwordCheck = new Zxcvbn();
		Strength strength = passwordCheck.measure(requestParams.get("password"));
		System.out.println("\n\nconfirm password GUI ::"+strength);
		if (strength.getScore() < 3) {
			//modelAndView.addObject("errorMessage", "Your password is too weak.  Choose a stronger one.");
			bindingResult.reject("password");
			redir.addFlashAttribute("errorMessage", "Your password is too weak.  Choose a stronger one.");
			modelAndView.setViewName("redirect:confirm?token=" + requestParams.get("token"));
			System.out.println(requestParams.get("token"));
			return modelAndView;
		}
	
		// Find the user associated with the reset token
		User user = userService.findByConfirmationToken(requestParams.get("token"));
		System.out.println("userService.findByConfirmationToken ::"+user);
		// Set new password
		user.setPassword(bCryptPasswordEncoder.encode(requestParams.get("password")));
		System.out.println("confirm bCryptPasswordEncoder GUI ::"+strength);
		// Set user to enabled
		user.setEnabled(true);
		// Save user
		userService.saveUser(user);
		modelAndView.addObject("successMessage", "Your password has been set!");
		return modelAndView;		
	}
	
	
	// for get password --------------------
	
	@RequestMapping(value="/forgetPasswordConfirm", method = RequestMethod.GET)
	public ModelAndView confirmForgetPassword(ModelAndView modelAndView, @RequestParam("email") String email) {
		
		User user = userService.findByEmail(email);
		if (user == null) { // No token found in DB
			modelAndView.addObject("invalidToken", "Oops!  This is an invalid confirmation link.");
		} else { // Token found
			modelAndView.addObject("confirmationEmail", user.getEmail());
		}
		modelAndView.setViewName("confirmForgotpass");
		return modelAndView;		
	}
	
	
	// Process confirmation link
		@RequestMapping(value="/forgetPasswordConfirm", method = RequestMethod.POST)
		public ModelAndView confirmForget(ModelAndView modelAndView, BindingResult bindingResult, @RequestParam Map<String, String> requestParams, RedirectAttributes redir) {
			modelAndView.setViewName("confirmForgotpass");
			Zxcvbn passwordCheck = new Zxcvbn();
			Strength strength = passwordCheck.measure(requestParams.get("password"));
			System.out.println("\n\nconfirm password GUI ::"+strength);
			if (strength.getScore() < 3) {
				//modelAndView.addObject("errorMessage", "Your password is too weak.  Choose a stronger one.");
				bindingResult.reject("password");
				redir.addFlashAttribute("errorMessage", "Your password is too weak.  Choose a stronger one.");
				modelAndView.setViewName("redirect:forgetPassword?email=" + requestParams.get("email"));
				System.out.println(requestParams.get("email"));
				return modelAndView;
			}
		
			// Find the user associated with the reset token
			//User user = userService.findByConfirmationToken(requestParams.get("token"));
			
			User user=userService.findByEmail(requestParams.get("email"));
			System.out.println("userService.findByConfirmationToken ::"+user);
			// Set new password
			user.setPassword(bCryptPasswordEncoder.encode(requestParams.get("password")));
			System.out.println("confirm bCryptPasswordEncoder GUI ::"+strength);
			// Set user to enabled
			user.setEnabled(true);
			// Save user
			userService.saveUser(user);
			modelAndView.addObject("successMessage", "Your password has been Forgotton!");
			return modelAndView;		
		}
	
}