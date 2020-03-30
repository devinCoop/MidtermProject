package com.skilldistillery.quarangel.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.quarangel.entities.User;

@Controller
public class HomeController {
	
	@RequestMapping(path = {"/", "home.do"})
	public String home(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "index";
		
	}

}
