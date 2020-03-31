package com.skilldistillery.quarangel.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.quarangel.entities.Task;
import com.skilldistillery.quarangel.entities.User;

@Controller
public class ConfirmOfferController {
	
	@RequestMapping(path = "confirmOffer.do", method = RequestMethod.POST)
	public String confirm(Task task, HttpSession session) {
		User current = (User) session.getAttribute("loggedInUser");
		return null;
	}

}
