package com.springboot.registration.app.configuration;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;


@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private CustomLoginSuccessHandler sucessHandler;

	@Autowired
	private DataSource dataSource;

	@Value("${spring.queries.users-query}")
	private String usersQuery;

	@Value("${spring.queries.roles-query}")
	private String rolesQuery;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		System.out.println("\n\nAuthenticationManagerBuilder -----------::"+auth);
		System.out.println("\n${spring.queries.users-query} -----------::"+usersQuery);
		System.out.println("\n${spring.queries.roles-query} -----------::"+rolesQuery);
		
		auth.jdbcAuthentication().usersByUsernameQuery(usersQuery).authoritiesByUsernameQuery(rolesQuery)
				.dataSource(dataSource).passwordEncoder(bCryptPasswordEncoder);
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		
		
		//http.authorizeRequests().antMatchers("/login", "/h2-console/**").permitAll()
		
		.antMatchers("/").permitAll()
		//.antMatchers("/h2-console").permitAll()//forgetPasswordConfirm
		.antMatchers("/login").permitAll()
		.antMatchers("/confirm").permitAll()
		.antMatchers("/admin").permitAll()
		.antMatchers("/register").permitAll() //forgetPassword
		.antMatchers("/forgetPassword").permitAll()
		.antMatchers("/forgetPasswordConfirm").permitAll()
		.antMatchers("/home/**").hasAnyAuthority("SUPER_USER", "ADMIN_USER", "SITE_USER")
		.antMatchers("/admin/**").hasAnyAuthority("SUPER_USER","ADMIN_USER")
		.anyRequest().authenticated()
		.and()
		// form login
		.csrf().disable().formLogin()
		.loginPage("/login")
		.failureUrl("/login?error=true")
		.successHandler(sucessHandler)
		.usernameParameter("email")
		.passwordParameter("password")
		.and()
		// logout
		.logout()
		.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
		.logoutSuccessUrl("/logout-success").permitAll()
		.and()
		.exceptionHandling()
		.accessDeniedPage("/access-denied");
		
		
		//.antMatchers("/").permitAll()
		//.antMatchers("/login").permitAll()
		//.antMatchers("/confirm").permitAll()
		//	.antMatchers("/register").permitAll();
			
		 
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**", "/static/**", "/css/**", "/js/**", "/images/**");
	}


}