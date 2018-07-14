package com.kcls.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ApplicationListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("applicationÏú»Ù£¡¡¾¼àÌıÆ÷¡¿");
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("application´´½¨£¡¡¾¼àÌıÆ÷¡¿");
	}

}
