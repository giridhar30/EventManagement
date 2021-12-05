package com.app.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.app.dao.EventTypeDAO;
import com.app.dao.HallDAO;

@Controller
@RequestMapping({"/", "/event"})
public class EventController {
	
	@Autowired
	EventTypeDAO eventTypeDao;
	@Autowired
	HallDAO hallDao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		mv.addObject("eventTypes", eventTypeDao.findAll());
		mv.setViewName("homePage");
		return mv;
	}
	
	@RequestMapping(value = "/{event_name}", method = RequestMethod.GET)
	public ModelAndView eventGet(@PathVariable("event_name") String eventName, ModelAndView mv, HttpSession session) {
		session.setAttribute("eventName", eventName);
		mv.setViewName("hallSelectPage");
		return mv;
	}
	
	@RequestMapping(value = "/hall/{hall_id}", method = RequestMethod.GET)
	public ModelAndView hallGet(@PathVariable("hall_id") String hallId, ModelAndView mv, HttpSession session) {
		session.setAttribute("hallId", hallId);
		mv.setViewName("addonPage");
		return mv;
	}
}
