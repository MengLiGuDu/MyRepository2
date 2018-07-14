package com.kcls.listener;


import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent session) {
		System.out.println("sessionListener ¼àÌýÆ÷");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent session) {
		

	}
	public void remove(HttpSession sess){
		
		
	}
}
