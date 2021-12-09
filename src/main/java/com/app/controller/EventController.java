package com.app.controller;

import java.net.http.HttpRequest;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.app.dao.CakeDAO;
import com.app.dao.DecorationDAO;
import com.app.dao.EventTypeDAO;
import com.app.dao.HallDAO;
import com.app.dao.PhotographyDAO;
import com.app.model.Addon;
import com.app.model.Cake;
import com.app.model.CakeTrans;
import com.app.model.Decoration;
import com.app.model.Event;
import com.app.model.Hall;
import com.app.model.Photography;
import com.app.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	EventTypeDAO eventTypeDao;
	@Autowired
	HallDAO hallDao;
	@Autowired
	EventService eventService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView eventGet(ModelAndView mv) {
		mv.addObject("eventTypes", eventTypeDao.findAll());
		mv.setViewName("eventPage");
		return mv;
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ModelAndView eventPost(@RequestParam(name="event") String eventName, ModelAndView mv, HttpSession session) {
		Event event = new Event();
		event.setType(eventName);
		session.setAttribute("event", event);
		mv.setViewName("hallSelectPage");
		return mv;
	}
	
	@RequestMapping(value = "/hall", method = RequestMethod.POST)
	public ModelAndView hallGet(@RequestParam(name="hall_id") Integer hallId, @RequestParam(name="from") String from, 
			@RequestParam(name = "to") String to, ModelAndView mv, HttpSession session) {
		Event event = (Event)session.getAttribute("event");
		Hall hall = hallDao.getById(hallId);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate fromDate = LocalDate.parse(from, formatter);
		LocalDate toDate = LocalDate.parse(to, formatter);
		event.setHall(hall);
		event.setFromDate(fromDate);
		event.setToDate(toDate);
		event.setAddons(new ArrayList<>());
		int days = toDate.getDayOfMonth() - fromDate.getDayOfMonth() + 1;
		event.setNoOfDays(days);
		event.setTotalPrice(hall.getPrice() * days);
		mv.setViewName("addonPage");
		return mv;
	}
}
