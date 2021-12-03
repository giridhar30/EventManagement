package com.app.model;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Event {
	@Id
	@GeneratedValue
	private int id;
	private String type;
	private LocalDate fromDate, toDate;
	private boolean paymentStatus;
	private int totalPrice;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "hall_id")
	private Hall hall;
	
	@ManyToMany
	@JoinTable(name = "event_addon")
	private List<Addon> addons;
	
	@Override
	public String toString() {
		return "Event [id=" + id + ", type=" + type + ", from=" + fromDate + ", to=" + toDate + ", paymentStatus="
				+ paymentStatus + ", totalPrice=" + totalPrice + "]";
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(addons, fromDate, id, paymentStatus, toDate, totalPrice, type);
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Event other = (Event) obj;
		return Objects.equals(addons, other.addons) && Objects.equals(fromDate, other.fromDate) && id == other.id
				&& paymentStatus == other.paymentStatus && Objects.equals(toDate, other.toDate)
				&& totalPrice == other.totalPrice && Objects.equals(type, other.type);
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public LocalDate getFromDate() {
		return fromDate;
	}

	public void setFromDate(LocalDate from) {
		this.fromDate = from;
	}

	public LocalDate getToDate() {
		return toDate;
	}

	public void setToDate(LocalDate toDate) {
		this.toDate = toDate;
	}

	public boolean isPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(boolean paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Hall getHall() {
		return hall;
	}

	public void setHall(Hall hall) {
		this.hall = hall;
	}

	public List<Addon> getAddons() {
		return addons;
	}

	public void setAddons(List<Addon> addons) {
		this.addons = addons;
	}
	
	
	
}