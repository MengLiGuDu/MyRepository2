package com.kcls.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println("session --------->����");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		System.out.println("session --------->�ݻ�");
		
	}

	
}
