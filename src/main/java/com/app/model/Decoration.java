package com.app.model;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@PrimaryKeyJoinColumn(name = "id")
public class Decoration extends Addon {
	
	private String imgUrl;
	
	@Override
	public String toString() {
		return super.toString() + " Decoration [imageUrl=" + imgUrl + "]";
	}

	@Override
	Map<Object, Object> getParticulars() {
		Map<Object, Object> map = new HashMap<>();
		map.put("Image URL", imgUrl);
		return map;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	
}
