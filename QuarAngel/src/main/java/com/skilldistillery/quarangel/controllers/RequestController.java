package com.skilldistillery.quarangel.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.quarangel.data.TaskDAO;
import com.skilldistillery.quarangel.entities.Task;

@Controller
public class RequestController {
	
	@Autowired
	private TaskDAO dao;
	
	@RequestMapping(path = "Request.do",method=RequestMethod.POST )
	public String request(@ModelAttribute("task") Task task, Model model) {
		Task taskObj = dao.create(task);
		model.addAttribute("task", taskObj);
		return "usercards";	
	}

}
