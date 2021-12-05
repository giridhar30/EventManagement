package com.app.model;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class EventType {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String eventName;
	private String imgUrl;
	
	@Override
	public int hashCode() {
		return Objects.hash(eventName, id, imgUrl);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EventType other = (EventType) obj;
		return Objects.equals(eventName, other.eventName) && id == other.id && Objects.equals(imgUrl, other.imgUrl);
	}
	@Override
	public String toString() {
		return "EventTypes [id=" + id + ", eventName=" + eventName + ", imgUrl=" + imgUrl + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	
}
