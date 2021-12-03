package com.app.model;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Entity;

@Entity
public class Cake extends Addon {
	
	private String imgUrl;
	private int minQuantity;
	
	@Override
	Map<Object, Object> getParticulars() {
		Map<Object, Object> map = new HashMap<>();
		map.put("Image URL", imgUrl);
		map.put("Min Quantity", minQuantity);
		return map;
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
