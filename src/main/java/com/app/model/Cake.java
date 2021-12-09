package com.app.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.app.service.EventService;

@Entity
public class Cake extends Addon {
	
	private String imgUrl;
	private int minQuantity;
	
	@OneToMany(mappedBy = "cake", fetch = FetchType.LAZY)
	private List<CakeTrans> cakeTrans;
	
	@Override
	public Map<Object, Object> getParticulars() {
		Map<Object, Object> map = new HashMap<>();
		map.put("Image URL", imgUrl);
		map.put("Min Quantity", minQuantity);
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

	public int getMinQuantity() {
		return minQuantity;
	}

	public void setMinQuantity(int minQuantity) {
		this.minQuantity = minQuantity;
	}

	@Override
	public String toString() {
		return  super.toString() + " Cake [minQuantity=" + minQuantity + "]";
	}
}
