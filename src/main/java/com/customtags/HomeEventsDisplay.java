package com.customtags;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.app.Constants;
import com.app.model.Event;
import com.app.model.EventType;

public class HomeEventsDisplay extends TagSupport {
	
	private List<EventType> eventList;
	
	public List<EventType> getEventList() {
		return eventList;
	}

	public void setEventList(List<EventType> eventList) {
		this.eventList = eventList;
	}

	@Override
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		try {
			for(EventType eventType : eventList) {
				System.out.println(Constants.IMG_URL + eventType.getImgUrl());
				out.write("<li>");
				out.write("<div><a href='/event?event=" + eventType.getEventName().toLowerCase() + "'>");
				out.write("<img src='" + Constants.IMG_URL + eventType.getImgUrl()  + "' alt='Event Image' width='100px' height='100px' />");
				out.write("<p>" + eventType.getEventName() + "</p>");
				out.write("</a></div>");
				out.write("</li>");
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return super.doEndTag();
	}
}
