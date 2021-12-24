package com.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.app.model.Event;
import com.app.service.PaymentService;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	@PostMapping("/payment")
	public ModelAndView processPayment(HttpSession session) throws Exception {
		Event event = (Event) session.getAttribute("event");
		
		return paymentService.blockHallAndReceivePayment(event);
	}
	
	@PostMapping("/payment/response")
	public RedirectView loadPostPaymentReport(HttpServletRequest req, RedirectAttributes ras, HttpSession session) {
		Event event = (Event) session.getAttribute("event");
		session.removeAttribute("addedSet");
		return paymentService.respondToPayment(req.getParameterMap(), ras, event);
	}
	
}
