package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.app.dao.EventTypeDAO;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	EventTypeDAO eventTypeDao;
	
	@RequestMapping(value = "/dummyHome", method = RequestMethod.GET)
	public String home() {
		return "home";
	}

	@GetMapping({"/home", "/"})
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
		return "homePage";
	}
	
	@GetMapping("/contact")
	public String loadContactPage() {
		return "contact";
	}
	
}
