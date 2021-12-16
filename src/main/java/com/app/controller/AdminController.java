package com.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.app.dao.AddonDAO;
import com.app.dao.CakeDAO;
import com.app.dao.CakeTransDAO;
import com.app.dao.DecorationDAO;
import com.app.dao.EventDAO;
import com.app.dao.EventTypeDAO;
import com.app.dao.HallDAO;
import com.app.dao.PhotographyDAO;
import com.app.dao.UserDAO;
import com.app.model.Cake;
import com.app.model.Decoration;
import com.app.model.Event;
import com.app.model.EventType;
import com.app.model.Hall;
import com.app.model.Photography;
import com.app.model.User;
import com.app.service.FileStorageService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	UserDAO userDao; 
	@Autowired
	HallDAO hallDao; 
	@Autowired
	DecorationDAO decorDao;
	@Autowired
	CakeDAO cakeDao;
	@Autowired
	CakeTransDAO cakeTransDAO;
	@Autowired
	PhotographyDAO photoDao;
	@Autowired
	EventDAO eventDao;
	@Autowired
	EventTypeDAO eventTypeDao;
	
	@Autowired
	FileStorageService fileService;
	
	@GetMapping("")
	public String getHome() {
		return "admin/adminHome";
	}
	
	@GetMapping("/user")
	public ModelAndView getUsers(ModelAndView mv) {
		List<User> users = userDao.findAll();
		mv.addObject("list", users);
		mv.addObject("modelClass", User.class);
		mv.addObject("modelName", "User");
		mv.setViewName("admin/modelDisplay");
		return mv;
	}
	
	@GetMapping("/hall")
	public ModelAndView getHalls(ModelAndView mv) {
		List<Hall> hall = hallDao.findAll();
		mv.addObject("list", hall);
		mv.addObject("modelClass", Hall.class);
		mv.addObject("modelName", "Hall");
		mv.setViewName("admin/modelDisplay");
		return mv;
	}
	
	@GetMapping("/decoration")
	public ModelAndView getDecorations(ModelAndView mv) {
		List<Decoration> decor = decorDao.findAll();
		mv.addObject("list", decor);
		mv.addObject("modelClass", Decoration.class);
		mv.addObject("modelName", "Decoration");
		mv.setViewName("admin/modelDisplay");
		return mv;
	}
	
	@GetMapping("/cake")
	public ModelAndView getCakes(ModelAndView mv) {
		List<Cake> cake = cakeDao.findAll();
		mv.addObject("list", cake);
		mv.addObject("modelClass", Cake.class);
		mv.addObject("modelName", "Cake");
		mv.setViewName("admin/modelDisplay");
		return mv;
	}
	
	@GetMapping("/event")
	public ModelAndView getEvents(ModelAndView mv) {
		List<Event> event = eventDao.findAll();
		mv.addObject("list", event);
		mv.addObject("modelClass", Event.class);
		mv.addObject("modelName", "Event");
		mv.setViewName("admin/modelDisplay");
		return mv;
	}
	
	@GetMapping("/eventtype")
	public ModelAndView getEventTypes(ModelAndView mv) {
		List<EventType> eventType = eventTypeDao.findAll();
		mv.addObject("list", eventType);
		mv.addObject("modelClass", EventType.class);
		mv.addObject("modelName", "EventType");
		mv.setViewName("admin/modelDisplay");
		return mv;
	}
	
	@GetMapping("/photography")
	public ModelAndView getPhotography(ModelAndView mv) {
		List<Photography> photo = photoDao.findAll();
		mv.addObject("list", photo);
		mv.addObject("modelClass", Photography.class);
		mv.addObject("modelName", "Photography");
		mv.setViewName("admin/modelDisplay");
		return mv;
	}

	@RequestMapping(value = "/eventtype/add", method=RequestMethod.GET)
	public ModelAndView getEventTypeForm(ModelAndView mv, @RequestParam(required = false) String added) {
		mv.addObject("eventTypeBean", new EventType());
		mv.setViewName("admin/addEventType");
		if(added != null) {
			mv.addObject("added", true);
		}
		return mv;
	}
	
	@RequestMapping(value = "/decoration/add", method=RequestMethod.GET)
	public ModelAndView getDecorationForm(ModelAndView mv, @RequestParam(required = false) String added) {
		mv.addObject("decorBean", new Decoration());
		mv.setViewName("admin/addDecor");
		if(added != null) {
			mv.addObject("added", true);
		}
		return mv;
	}
	
	@RequestMapping(value = "/hall/add", method=RequestMethod.GET)
	public ModelAndView getHallForm(ModelAndView mv, @RequestParam(required = false) String added) {
		mv.addObject("hallBean", new Hall());
		mv.setViewName("admin/addHall");
		if(added != null) {
			mv.addObject("added", true);
		}
		return mv;
	}
	
	@RequestMapping(value = "/cake/add", method=RequestMethod.GET)
	public ModelAndView getCakeForm(ModelAndView mv, 
			@RequestParam(required = false) String added) {
		mv.addObject("cakeBean", new Cake());
		mv.setViewName("admin/addCake");
		if(added != null) {
			mv.addObject("added", true);
		}
		return mv;
	}
	
	@RequestMapping(value = "/photography/add", method=RequestMethod.GET)
	public ModelAndView getPhotographyForm(ModelAndView mv, @RequestParam(required = false) String added) {
		mv.addObject("photoBean", new Photography());
		mv.setViewName("admin/addPhoto");
		if(added != null) {
			mv.addObject("added", true);
		}
		return mv;
	}
	
	@RequestMapping(value = "/decoration/add", method = RequestMethod.POST)
	public String addDecoration(@Valid Decoration decor, @RequestParam("file") MultipartFile file, 
			@RequestParam(required = false, value = "edit") String edit) {
		if(file != null) {
			String imgUrl = fileService.save(file, "decor");
			decor.setImgUrl(imgUrl);
		}
		decorDao.save(decor);
		if(edit != null) {
			return "redirect:/admin/decoration";
		}
		return "redirect:/admin/decoration/add?added";
		
	}
	
	@RequestMapping(value = "/hall/add", method = RequestMethod.POST)
	public String addHall(@Valid Hall hall, @RequestParam("file") MultipartFile file,
			@RequestParam(required = false, value = "edit") String edit) {
		if(file != null ) {
			String imgUrl = fileService.save(file, "hall");
			hall.setImgUrl(imgUrl);
		}
		hallDao.save(hall);
		if(edit != null) {
			return "redirect:/admin/hall";
		}
		return "redirect:/admin/hall/add?added";
	}
	
	@RequestMapping(value = "/cake/add", method = RequestMethod.POST)
	public String addCake(@Valid Cake cake, @RequestParam("file") MultipartFile file,
			@RequestParam(required = false, value = "edit") String edit) {
		if(file != null) {
			String imgUrl = fileService.save(file, "cake");
			cake.setImgUrl(imgUrl);
		}
		cakeDao.save(cake);
		if(edit != null) {
			return "redirect:/admin/cake";
		}
		return "redirect:/admin/cake/add?added";
	}
	
	@RequestMapping(value = "/photography/add", method = RequestMethod.POST)
	public String addPhotography(@Valid Photography photo, 
			@RequestParam(required = false, value = "edit") String edit) {
		photoDao.save(photo);
		if(edit != null) {
			return "redirect:/admin/photography";
		}
		return "redirect:/admin/photography/add?added";
	}
	
	
	@RequestMapping(value = "/eventtype/add", method = RequestMethod.POST)
	public String addEventType(@Valid EventType eventType, @RequestParam("file") MultipartFile file) {
		String imgUrl = fileService.save(file, "event-type");
		eventType.setImgUrl(imgUrl);
		eventTypeDao.save(eventType);
		return "redirect:/admin/eventtype/add?added";
	}
	
	@RequestMapping(value = "/eventtype/edit", method=RequestMethod.GET)
	public ModelAndView editEventTypeForm(ModelAndView mv, @RequestParam("id") int id) {
		mv.addObject("eventTypeBean", eventTypeDao.getById(id));
		mv.addObject("edit", true);
		mv.setViewName("admin/addEventType");
		return mv;
	}
	
	@RequestMapping(value = "/decoration/edit", method=RequestMethod.GET)
	public ModelAndView editDecorationForm(ModelAndView mv, @RequestParam("id") int id) {
		mv.addObject("decorBean", decorDao.getById(id));
		mv.addObject("edit", true);
		mv.setViewName("admin/addDecor");
		return mv;
	}
	
	@RequestMapping(value = "/hall/edit", method=RequestMethod.GET)
	public ModelAndView editHallForm(ModelAndView mv, @RequestParam("id") int id) {
		mv.addObject("hallBean", hallDao.getById(id));
		mv.setViewName("admin/addHall");
		return mv;
	}
	
	@RequestMapping(value = "/cake/edit", method=RequestMethod.GET)
	public ModelAndView editCakeForm(ModelAndView mv, @RequestParam("id") int id) {
		mv.addObject("cakeBean", cakeDao.getById(id));
		mv.setViewName("admin/addCake");
		return mv;
	}
	
	@RequestMapping(value = "/photography/edit", method=RequestMethod.GET)
	public ModelAndView editPhotographyForm(ModelAndView mv, @RequestParam("id") int id) {
		mv.addObject("photoBean", photoDao.getById(id));
		mv.setViewName("admin/addPhoto");
		return mv;
	}
	

	
	@RequestMapping(value = "/eventtype/delete", method=RequestMethod.GET)
	public String deleteEventType(ModelAndView mv, @RequestParam("id") int id) {
		eventTypeDao.deleteById(id);
		return "redirect:/admin/eventtype";
	}
	
	@RequestMapping(value = "/decoration/delete", method=RequestMethod.GET)
	public String deleteDecoration(ModelAndView mv, @RequestParam("id") int id) {
		try {
			decorDao.deleteById(id);
		} catch(Exception ex) {}
		return "redirect:/admin/decoration";
	}
	
	
	@RequestMapping(value = "/hall/delete", method=RequestMethod.GET)
	public String deleteHall(ModelAndView mv, @RequestParam("id") int id) {
		try {
			hallDao.deleteById(id);
		} catch(Exception ex) {}
		return "redirect:/admin/hall";
	}
	
	
	@RequestMapping(value = "/cake/delete", method=RequestMethod.GET)
	public String deleteCake(ModelAndView mv, @RequestParam("id") int id) {
		try {
			cakeDao.deleteById(id);	
		} catch(Exception ex) {}
		return "redirect:/admin/cake";
	}
	
	
	@RequestMapping(value = "/photography/delete", method=RequestMethod.GET)
	public String deletePhotography(ModelAndView mv, @RequestParam("id") int id) {
		try {
			photoDao.deleteById(id);
		} catch(Exception ex) {}
		return "redirect:/admin/photography";
	}
	
	@RequestMapping(value = "/user/delete", method=RequestMethod.GET)
	public String deleteUser(ModelAndView mv, @RequestParam("id") int id) {
		try {
			userDao.deleteById(id);
		} catch(Exception ex) {}
		return "redirect:/admin/user";
	}
	
	@RequestMapping(value = "/event/delete", method=RequestMethod.GET)
	public String deleteEvent(ModelAndView mv, @RequestParam("id") int id) {
		try {
			eventDao.deleteById(id);
		} catch(Exception ex) {}
		return "redirect:/admin/event";
	}
	

}
