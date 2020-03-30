package com.skilldistillery.quarangel.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.skilldistillery.quarangel.data.UserDAO;
import com.skilldistillery.quarangel.entities.User;

@Controller
public class HomeController {
	
	  @Autowired
	  private UserDAO userDAO;
	
	@RequestMapping(path = {"/", "home.do"})
	public String home(HttpSession session) {
		User u = userDAO.findById(1);
		session.setAttribute("user", u );
	public String home(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "index";
		
	}

}
