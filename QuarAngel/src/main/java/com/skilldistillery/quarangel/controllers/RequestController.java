package com.skilldistillery.quarangel.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.quarangel.data.TaskDAO;
import com.skilldistillery.quarangel.entities.Task;
import com.skilldistillery.quarangel.entities.User;

@Controller
public class RequestController {
	
	@Autowired
	private TaskDAO dao;
	
	@RequestMapping(path = "RequestSave.do",method=RequestMethod.POST )
	public String request(@ModelAttribute("task") Task task, HttpSession session) {
	    User current = getCurrentUserFromSession(session);
		dao.create(task, 1 , 1);//task, current user id, category id)
		return "usercards";	
	}
	@RequestMapping(path = "RequestForm.do",method=RequestMethod.GET )
	public String requestForm(Model model) {
	    Task task = new Task();
	    model.addAttribute("task", task);
		return "Request";	
	}
	
	  private User getCurrentUserFromSession(HttpSession session) {
		    User current = (User) session.getAttribute("user");		    
		    return current;
		  }

}
