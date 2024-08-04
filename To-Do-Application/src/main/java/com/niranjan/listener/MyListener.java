package com.niranjan.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.niranjan.entities.Todo;

public class MyListener implements ServletContextListener {

	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
	     System.out.println("Context Created...!!");
	     List<Todo> list = new ArrayList<Todo>();
	     ServletContext servletContext = sce.getServletContext();
	     servletContext.setAttribute("list", list);
	}

}
