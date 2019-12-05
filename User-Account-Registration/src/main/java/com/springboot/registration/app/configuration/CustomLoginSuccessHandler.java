package com.springboot.registration.app.configuration;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

@Configuration
public class CustomLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler{

	@Override
	protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)throws IOException {
		String targetUrl = determineTargetUrl(authentication);
		if (response.isCommitted()) {
			return;
		}
		RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}
	
	protected String determineTargetUrl(Authentication authentication) {
		String url = "/login?error=true";
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities(); // Fetch the roles from Authentication object
		System.out.println("\n\n\n******************************<<determineTargetUrl>>**************************************");
		System.out.println("authorities ::"+authorities);
		List<String> roles = new ArrayList<String>();
		for (GrantedAuthority a : authorities) {
			System.out.println("authorities ::"+roles.add(a.getAuthority()));
			roles.add(a.getAuthority());
		}
		if (roles.contains("ADMIN_USER")) {    // check user role and decide the redirect URL
			System.out.println("ADMIN_USER--------------------------- ::");
			url = "/admin";
		} 
		else if (roles.contains("SITE_USER")) {
			System.out.println("SITE_USER--------------------------- ::");
			url = "/home";
		}
		return url;
	}
}
