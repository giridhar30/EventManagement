package com.app.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(getAuthProvider());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	http.csrf()
    		.disable()
    		.authorizeRequests()
	    	.antMatchers("/").permitAll()
	    	.antMatchers("/user/events", "/payment", "/payment/response", 
	    			"/event/hall", "/event/addon", "/event/addon/*/*").hasRole("USER")
	    	.antMatchers("/admin", "/admin/**", "/admin/*/add").hasRole("ADMIN")
	    	.and()
	    	.formLogin()
	    	.loginPage("/user/login")
	    	.defaultSuccessUrl("/home?login")
	    	.failureUrl("/user/login?error")
	    	.usernameParameter("mailId")
	    	.passwordParameter("password")
	    	.and()
	    	.logout().logoutUrl("/user/logout").logoutSuccessUrl("/home?logout");
    	
    }
    
    @Bean
    public PasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    public DaoAuthenticationProvider getAuthProvider() {
    	DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(getPasswordEncoder());
        return authProvider;
    }
}
