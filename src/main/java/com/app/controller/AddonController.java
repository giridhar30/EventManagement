package com.app.controller;

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
import com.app.model.Photography;
import com.app.service.EventService;

@Controller
@RequestMapping("event/addon")
public class AddonController {
	
	@Autowired
	DecorationDAO decorDao;
	@Autowired
	CakeDAO cakeDao;
	@Autowired
	PhotographyDAO photoDao;
	@Autowired
	EventService eventService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String addOn() {
		System.out.println("HERE");
		return "addonPage";
	}
	
	@RequestMapping(value = "{add_on}", method = RequestMethod.GET)
	public String getAddon(@PathVariable(name = "add_on") String addon, HttpSession session) {
		try {
			String className = "com.app.model." + Character.toUpperCase(addon.charAt(0)) + addon.substring(1);
			
			Addon addOn = (Addon)Class.forName(className).newInstance();
			return addOn.visit(session, eventService);
		} catch (Exception e) {
			e.printStackTrace();
			return "addonPage";
		} 
	}
	
	@RequestMapping(value = "/decoration/add", method = RequestMethod.POST)
	public ModelAndView addDecor(@RequestParam(name = "id") int id, ModelAndView mv, HttpSession session) {
		System.out.println("In decor");
		Decoration decor = decorDao.getById(id);
		Event event = (Event)session.getAttribute("event");
		event.getAddons().add(decor);
		float price = event.getTotalPrice() + decor.getPrice();
		event.setTotalPrice(price);
		mv.setViewName("decorationPage");
		return mv;
	}
	
	@RequestMapping(value = "/cake/add", method = RequestMethod.POST)
	public ModelAndView addCake(@RequestParam(name = "id") int id, @RequestParam(name = "weight") float weight, @RequestParam(name = "qty") int quantity, ModelAndView mv, HttpSession session) {
		Cake cake = cakeDao.getById(id);
		Event event = (Event)session.getAttribute("event");
		System.out.println(event);
		CakeTrans cakeTrans = new CakeTrans();
		
		cakeTrans.setCake(cake);
		cakeTrans.setWeight(weight);
		cakeTrans.setQuantity(quantity);
		event.getAddons().add(cakeTrans);
		float price = event.getTotalPrice() + (cake.getPrice() * weight * quantity);
		event.setTotalPrice(price);
		mv.setViewName("cakePage");
		return mv;
	}
	
	@RequestMapping(value = "/photography/add", method = RequestMethod.POST)
	public ModelAndView addPhoto(@RequestParam(name = "id") int id, ModelAndView mv, HttpSession session) {
		Photography photo = photoDao.getById(id);
		Event event = (Event)session.getAttribute("event");
		event.getAddons().add(photo);
		float price = event.getTotalPrice() + photo.getPrice();
		event.setTotalPrice(price);
		mv.setViewName("photoPage");
		return mv;
	}
	
}
