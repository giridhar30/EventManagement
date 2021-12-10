package com.app.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.app.dao.AddonDAO;
import com.app.dao.CakeDAO;
import com.app.dao.CakeTransDAO;
import com.app.dao.DecorationDAO;
import com.app.dao.HallDAO;
import com.app.dao.PhotographyDAO;
import com.app.model.Cake;
import com.app.model.Decoration;
import com.app.model.Hall;
import com.app.model.Photography;
import com.app.service.FileStorageService;

@Controller
@RequestMapping("/admin")
public class AdminController {
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
	FileStorageService fileService;
	
	@RequestMapping(value = "/decoration", method=RequestMethod.GET)
	public ModelAndView getDecoration(ModelAndView mv) {
		mv.addObject("decorBean", new Decoration());
		mv.setViewName("admin/addDecor");
		return mv;
	}
	
	@RequestMapping(value = "/hall", method=RequestMethod.GET)
	public ModelAndView getHall(ModelAndView mv) {
		mv.addObject("hallBean", new Hall());
		mv.setViewName("admin/addHall");
		return mv;
	}
	
	@RequestMapping(value = "/cake", method=RequestMethod.GET)
	public ModelAndView getCake(ModelAndView mv) {
		mv.addObject("cakeBean", new Cake());
		mv.setViewName("admin/addCake");
		return mv;
	}
	
	@RequestMapping(value = "/photography", method=RequestMethod.GET)
	public ModelAndView getPhotography(ModelAndView mv) {
		mv.addObject("photoBean", new Photography());
		mv.setViewName("admin/addPhoto");
		return mv;
	}
	
	@RequestMapping(value = "/decoration/add", method = RequestMethod.POST)
	public ModelAndView addDecoration(@Valid Decoration decor, @RequestParam("file") MultipartFile file, ModelAndView mv) {
		String imgUrl = fileService.save(file, "decor");
		decor.setImgUrl(imgUrl);
		decorDao.save(decor);
//		mv.addObject("decorBean", new Decoration());
		mv.addObject("added", true);
		return getDecoration(mv);
	}
	
	@RequestMapping(value = "/hall/add", method = RequestMethod.POST)
	public ModelAndView addHall(@Valid Hall hall, @RequestParam("file") MultipartFile file, ModelAndView mv) {
		String imgUrl = fileService.save(file, "hall");
		hall.setImageUrl(imgUrl);
		hallDao.save(hall);
		mv.addObject("added", true);
		return getHall(mv);
	}
	
	@RequestMapping(value = "/cake/add", method = RequestMethod.POST)
	public ModelAndView addCake(@Valid Cake cake, @RequestParam("file") MultipartFile file, ModelAndView mv) {
		String imgUrl = fileService.save(file, "cake");
		cake.setImgUrl(imgUrl);
		cakeDao.save(cake);
		mv.addObject("added", true);
		return getCake(mv);
	}
	
	@RequestMapping(value = "/photography/add", method = RequestMethod.POST)
	public ModelAndView addDecoration(Photography photo, ModelAndView mv) {
		photoDao.save(photo);
		mv.addObject("added", true);
		return getPhotography(mv);
	}
}
