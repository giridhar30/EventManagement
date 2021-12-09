package com.customtags;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.app.model.Decoration;
import com.app.model.Photography;

public class PhotographyDisplay extends TagSupport{
	
	List<Photography> photo;
	
	public List<Photography> getPhoto() {
		return photo;
	}

	public void setPhoto(List<Photography> photo) {
		this.photo = photo;
	}

	@Override
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		try {
			for(Photography p : photo) {
				out.write("<li>");
				out.write("<div>");
				out.write("<p>" + p.getName() + "</p>");
				out.write("<p>Type: " + p.getType() + "</p>");
				out.write("<p>Price: &#x20b9;" + p.getPrice() + "</p>");
				out.write("<a href='/event/addon/photography/add?id=" + p.getId() + "'");
				out.write("<button>Add</button>");
				out.write("</a>");
				out.write("</div>");
				out.write("</li>");
			}
		} catch (Exception e) {
			
		}
		return super.doEndTag();
	}
}
