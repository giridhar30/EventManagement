package com.app.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.app.dao.AddonDAO;
import com.app.dao.CakeDAO;
import com.app.dao.CakeTransDAO;
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
import com.app.service.AddonService;
import com.app.service.EventService;

@Controller
@RequestMapping("event/addon")
public class AddonController {
	@Autowired
	AddonDAO addonDao;
	@Autowired
	DecorationDAO decorDao;
	@Autowired
	CakeDAO cakeDao;
	@Autowired
	CakeTransDAO cakeTransDAO;
	@Autowired
	PhotographyDAO photoDao;
	@Autowired
	EventService eventService;
	@Autowired
	AddonService addonService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String addOn() {
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
	public String addDecor(@RequestParam(name = "id") int id, ModelAndView mv, HttpSession session) {
		Decoration decor = decorDao.getById(id);
		Event event = (Event)session.getAttribute("event");
		addonService.addToSession(session, decor, event.getAddons().size());
		event.getAddons().add(decor);
		float price = event.getTotalPrice() + decor.getPrice();
		event.setTotalPrice(price);
		mv.setViewName("decorationPage");
		
		return "redirect:/event/addon/decoration";
	}
	
	@RequestMapping(value = "/cake/add", method = RequestMethod.POST)
	public String addCake(@RequestParam(name = "id") int id, @RequestParam(name = "weight") float weight, @RequestParam(name = "qty") int quantity, ModelAndView mv, HttpSession session) {
		Cake cake = cakeDao.getById(id);
		Event event = (Event)session.getAttribute("event");
		addonService.addToSession(session, cake, event.getAddons().size());
		CakeTrans cakeTrans = new CakeTrans();
		cakeTrans.setCake(cake);
		cakeTrans.setWeight(weight);
		cakeTrans.setQuantity(quantity);
		cakeTrans = cakeTransDAO.save(cakeTrans);
		event.getAddons().add(cakeTrans);
		float price = event.getTotalPrice() + (cake.getPrice() * weight * quantity);
		event.setTotalPrice(price);
		
		Set<Addon> addSet = (Set<Addon>) session.getAttribute("addonSet");
		return "redirect:/event/addon/cake";
	}
	
	@RequestMapping(value = "/photography/add", method = RequestMethod.POST)
	public String addPhoto(@RequestParam(name = "id") int id, ModelAndView mv, HttpSession session) {
		Photography photo = photoDao.getById(id);
		Event event = (Event)session.getAttribute("event");
		addonService.addToSession(session, photo, event.getAddons().size());
		event.getAddons().add(photo);
		float price = event.getTotalPrice() + photo.getPrice();
		event.setTotalPrice(price);
		mv.setViewName("photoPage");
		
		return "redirect:/event/addon/photography";
	}
	
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	public String deleteAddon(@RequestParam(name = "index") Integer index, @RequestParam(name = "currentUrl") String redirectUrl, HttpSession session) {
		Event event = (Event)session.getAttribute("event");
		List<Addon> addons = event.getAddons();
		Addon toDelete = addons.get(index);
		addons.remove(toDelete);
		addonService.removeFromSession(session, toDelete);
		if(toDelete instanceof CakeTrans) {
			cakeTransDAO.delete((CakeTrans)toDelete);
		}
		return "redirect:" + redirectUrl;
	}
	
}
