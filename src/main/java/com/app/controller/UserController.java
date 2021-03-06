package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.model.User;
import com.app.security.MyUserDetails;
import com.app.service.EventService;
import com.app.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService us;
	
	@Autowired
	private EventService es;

	@GetMapping("/register")
	public String loadRegisterPage(ModelMap mm) {
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		if (obj instanceof MyUserDetails) { 
			return "redirect:/";
		} 
		
		return "register";
	}
	
	@PostMapping("/register")
	public String registerUser(@ModelAttribute("userData") User user, ModelMap mm) {
		boolean success = us.saveUser(user);
		if (!success) {
			mm.addAttribute("error", "Mail Id already registered!");
			return "register";
		}
		
		return "redirect:/user/login";
	}
	
	@GetMapping("/login")
	public String loadLoginPage(ModelMap mm, @RequestParam(value = "error", required = false) String error) {
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		if (obj instanceof MyUserDetails) { 
			return "redirect:/";
		} 
		
		if (error != null) {
            mm.addAttribute("error", "Invalid Credentials!");
        }
		return "login";
	}
	
	@GetMapping("/events")
	public String loadUserEventsPage(ModelMap mm) {
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();  
		if (obj instanceof MyUserDetails) { 
			User user = ((MyUserDetails) obj).getUser(); 
			mm.addAttribute("events", es.findByUser(user));
		} 
		return "myevents";
	}
	
}
