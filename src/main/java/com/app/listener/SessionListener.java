package com.app.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class SessionListener implements HttpSessionListener {
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}
}
