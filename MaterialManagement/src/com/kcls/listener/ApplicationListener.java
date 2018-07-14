package com.kcls.listener;


import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ApplicationListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent context) {
		
		
	}

	@Override
	public void contextInitialized(ServletContextEvent context) {
		System.out.println("applicationListener ¼àÌýÆ÷");
		
	}

}
