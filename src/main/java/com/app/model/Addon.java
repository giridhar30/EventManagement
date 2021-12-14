package com.app.model;

import java.util.Map;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.app.service.EventService;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@Component
public abstract class Addon {
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	private int id;
	private String name;
	private int price;
	private String phone;
	
	public abstract Map<Object, Object> getParticulars();
	public abstract String visit(HttpSession session, EventService eventService);

	@Override
	public String toString() {
		return "Addon [id=" + id + ", name=" + name + ", price=" + price + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, name, price);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}


}
