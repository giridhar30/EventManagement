package com.app.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.app.dao.CakeDAO;
import com.app.dao.DecorationDAO;
import com.app.dao.EventDAO;
import com.app.dao.PhotographyDAO;
import com.app.model.Cake;
import com.app.model.Decoration;
import com.app.model.Event;
import com.app.model.Photography;
import com.app.model.User;

@Service
public class EventService {
	@Autowired
	DecorationDAO decorDao;
	@Autowired
	CakeDAO cakeDao;
	@Autowired
	PhotographyDAO photoDao;
	
	@Autowired
	private EventDAO eventDao;
	
	public String fetchAddon(Decoration decor, HttpSession session) {
		List<Decoration> decors = decorDao.findAll();
		session.setAttribute("addon", decors);
		return "decorationPage";
	}
	
	public String fetchAddon(Cake decor, HttpSession session) {
		List<Cake> cakes = cakeDao.findAll();
		session.setAttribute("addon", cakes);
		return "cakePage";
		
	}
	
	public String fetchAddon(Photography decor, HttpSession session) {
		List<Photography> photos = photoDao.findAll();
		session.setAttribute("addon", photos);
		return "photoPage";
	}
	
	public List<Event> findByUser(User user) {
		return eventDao.findByUser(user);
	}
}
