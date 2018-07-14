package com.kcls.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DemoListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("application ´Ý»Ù");
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("application ´´½¨");
	}

}
