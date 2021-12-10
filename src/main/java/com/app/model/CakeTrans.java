package com.app.model;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.ManyToAny;
import org.springframework.web.servlet.ModelAndView;

import com.app.service.EventService;

@Entity
public class CakeTrans extends Addon {
	@ManyToOne
	@JoinColumn(name = "cake_id")
	private Cake cake;
	private int quantity;
	private float weight;
	
	@Override
	public Map<Object, Object> getParticulars() {
		Map<Object, Object> map = cake.getParticulars();
		map.put("quantity", quantity );
		map.put("weight", weight);
		return map;
	}
	
	@Override
	public String visit(HttpSession session, EventService eventService) {
		return "";
	}
	
	

	@Override
	public String toString() {
		return cake.toString() + " CakeTrans [quantity=" + quantity + ", weight=" + weight + "]";
	}
	
	
	public Cake getCake() {
		return cake;
	}

	public void setCake(Cake cake) {
		this.cake = cake;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}
	
	
}
