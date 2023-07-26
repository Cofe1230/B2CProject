package com.group5.b2c.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SecurityConfig {
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http)throws Exception{
		http.csrf().disable()
		.authorizeHttpRequests()
		.antMatchers("/user/*").authenticated()
		.mvcMatchers("/rent/**").authenticated()
		.mvcMatchers("/admin/**").hasRole("ADMIN")
		.anyRequest()
		.permitAll()
		.and()
		.formLogin()
		.loginPage("/member/login")
		.defaultSuccessUrl("/")
		.failureUrl("/member/login/error")
		.and()
		.logout()
		.logoutUrl("/member/logout")
		.logoutSuccessUrl("/")
		.invalidateHttpSession(true);
		
		return http.build();
		
	}
}
