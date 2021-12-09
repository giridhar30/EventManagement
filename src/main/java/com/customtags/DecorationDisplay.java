package com.customtags;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.app.model.Decoration;

public class DecorationDisplay extends TagSupport {
	
	List<Decoration> decor;
	
	public List<Decoration> getDecor() {
		return decor;
	}
	
	public void setDecor(List<Decoration> decor) {
		this.decor = decor;
	}

	@Override
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		try {
			for(Decoration d : decor) {
				System.out.println(d);
				out.write("<li>");
				out.write("<div>");
				out.write("<img src='http://localhost:8080/" + d.getImgUrl() + "' alt='" + d.getName() + "' />");
				out.write("<p>" + d.getName() + "</p>");
				out.write("<p>Price: &#x20b9;" + d.getPrice() + "</p>");
				out.write("<a href='/event/addon/decoration/add?id=" + d.getId() + "'");
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
