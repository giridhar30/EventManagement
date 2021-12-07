package com.app.util;

import javax.activation.DataSource;

public class MailDocument {
	
	private String title;
	private DataSource dataSource;
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

}
