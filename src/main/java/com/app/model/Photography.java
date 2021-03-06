package com.app.model;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Entity;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.app.service.EventService;

@Entity
public class Photography extends Addon {
	
	private String type;
	
	@Override
	public Map<Object, Object> getParticulars() {
		Map<Object, Object> map = new HashMap<>();
		map.put("Type", type);
		return map;
	}
	
	@Override
	public String visit(HttpSession session, EventService eventService) {
		return eventService.fetchAddon(this, session);
	}
	
	@Override
	public String toString() {
		return super.toString() + " Photography [type=" + type + "]";
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
