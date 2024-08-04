package com.niranjan.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.niranjan.entities.Todo;

@Controller
public class MainController {
	
	@Autowired
	ServletContext servletContext;
	
	private Boolean flagBoolean = false;

	@RequestMapping("Home")
	public String all(ModelMap map) {
		String string="Home";
		map.addAttribute("str", string);
		
		List<Todo> list = (List<Todo>) servletContext.getAttribute("list");
		
		if(flagBoolean) map.addAttribute("msg","All Task Done");
		
		map.addAttribute("todos", list);
		return "home";
	}
	
	@RequestMapping("Add")
	public String add(ModelMap map) {
		Todo todo = new Todo();
		flagBoolean=false;
		map.addAttribute("str", "Add");
		map.addAttribute("todo", todo);
		return "home";
	}
	
	@RequestMapping(value = "saveToDo" , method = RequestMethod.POST)
	public String saveToDo(@ModelAttribute("todo") Todo todo,ModelMap map) {
		todo.setDate(new Date());
		List<Todo> list = (List<Todo>) servletContext.getAttribute("list");
		list.add(todo);
		return "redirect:/Home";
	}
	
	@RequestMapping("done")
	public String done(@RequestParam("title") String title,@RequestParam("content") String content,ModelMap map) {
		
		List<Todo> list = (List<Todo>)servletContext.getAttribute("list");
		int index=-1;
		
		for(Todo todo:list) {
			if(todo.getTitle().equals(title) && todo.getContent().equals(content)) index=list.indexOf(todo);
		}
		
		list.remove(index);
		
		if(list.isEmpty()) flagBoolean=true;
		
		return "redirect:/Home";
	}
}
