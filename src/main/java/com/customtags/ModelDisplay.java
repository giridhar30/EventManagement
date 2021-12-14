package com.customtags;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.app.Utils;

public class ModelDisplay extends TagSupport {
	
	Class<Object> modelClass;
	List<Object> list;
	String modelName;
	
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName.toLowerCase();
	}
	public Class<Object> getModelClass() {
		return modelClass;
	}
	public void setModelClass(Class<Object> modelClass) {
		this.modelClass = modelClass;
	}
	public List<Object> getList() {
		return list;
	}
	public void setList(List<Object> list) {
		this.list = list;
	}
	
	private void displayHeader(Field[] fields, JspWriter out) throws IOException {
		for(Field field : fields) {
			String name = field.getName();
			if(field.getGenericType().getTypeName().contains("List")) continue;
			out.print("<th>");
			out.print(Utils.capitalize(name));
			out.print("</th>");
		}
	}
	
	private int id = 0;
	private void displayContent(Object obj, Field[] fields, JspWriter out) throws IOException, IllegalArgumentException, IllegalAccessException {
		for(Field field : fields) {
			field.setAccessible(true);
			if(field.getName().equals("id")) {
				id = field.getInt(obj);
			}
			
			if(field.getGenericType().getTypeName().contains("List")) continue;
			out.print("<td>");
			boolean isImg = field.getName().equals("imgUrl");
			if(isImg) {
				out.print("<a href='" + field.get(obj) + "' target='_blank'>");
			}
			out.print(field.get(obj));
			if(isImg) {
				out.print("</a>");
			}
			out.print("</td>");
		}
	}
	
	@Override
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		
		try {
			out.print("<tr>");
			Field[] fields = modelClass.getSuperclass().getDeclaredFields();
			displayHeader(fields, out);
			fields = modelClass.getDeclaredFields();
			displayHeader(fields, out);
			out.print("<th></th>");
			out.print("</tr>");
			
			for(Object obj : list) {
				out.print("<tr>");
				displayContent(obj, obj.getClass().getSuperclass().getDeclaredFields(), out);
				displayContent(obj, obj.getClass().getDeclaredFields(), out);
				out.print("<td style='text-align: right'>"
//						+ "		<a href='/admin/" + modelName +"/edit?id=" + id + "' class='btn btn-secondary'>"
//						+ "     	Edit"
//						+ "		</a>"
						+ "		<a href='/admin/" + modelName +"/delete?id=" + id + "' class='btn btn-danger' onclick='return confirmDelete()'>"
						+ "     	Delete"
						+ "		</a>"
						+" </td>");
				out.print("</tr>");
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		return super.doEndTag();
	}
	
	
}
