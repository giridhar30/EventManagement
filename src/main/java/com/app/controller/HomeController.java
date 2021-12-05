package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@GetMapping({"/home"})
	public String loadHomePage(ModelMap mm, 
			@RequestParam(value = "logout", required = false) String logout,
			@RequestParam(value = "login", required = false) String login
			) {
		if (login != null) {
            mm.addAttribute("login", "Signed in successfully!");
        }
		if (logout != null) {
            mm.addAttribute("logout", "Logged out successfully!");
        }
		return "home";
	}
	
}
