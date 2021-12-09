package com.customtags;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.app.model.Cake;
import com.app.model.Decoration;

public class CakeDisplay extends TagSupport {
	
	List<Cake> cake;
	
	public List<Cake> getCake() {
		return cake;
	}

	public void setCake(List<Cake> cake) {
		this.cake = cake;
	}

	@Override
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		try {
			for(Cake c : cake) {
				out.write("<li>");
				out.write("<div>");
				out.write("<img src='http://localhost:8080/" + c.getImgUrl() + "' alt='" + c.getName() + "' />");
				out.write("<p>" + c.getName() + "</p>");
				out.write("<p>Price: &#x20b9;" + c.getPrice() + "/kg</p>");
				out.write("<p>Min Order(kg): " + c.getMinQuantity() + "</p>");
				out.write("<form action='cake/add' method='post'>");
				out.write("<input name='weight' type='number' step='0.25' min='" + c.getMinQuantity() + "' value=" + c.getMinQuantity() + " />");
				out.write("<input type='hidden' name='qty' value=1 />");
				out.write("<input type='hidden' name='id' value=" + c.getId() + "/>");
				out.write("<input type='submit' name='Add' value='Add' />");
				out.write("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}' />");
				out.write("</form>");
				out.write("</div>");
				out.write("</li>");
			}
		} catch (Exception e) {
			
		}
		return super.doEndTag();
	}
}
