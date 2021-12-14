package com.app.model;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.app.service.EventService;

@Entity
@PrimaryKeyJoinColumn(name = "id")
public class Decoration extends Addon {
	
	private String imgUrl;
	
	@Override
	public String toString() {
		return super.toString() + " Decoration [imageUrl=" + imgUrl + "]";
	}

	@Override
	public Map<Object, Object> getParticulars() {
		Map<Object, Object> map = new HashMap<>();
//		map.put("Image URL", imgUrl);
		return map;
	}
	
	@Override
	public String visit(HttpSession session, EventService eventService) {
		return eventService.fetchAddon(this, session);
	}
	
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	
}
