package com.skilldistillery.quarangel.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.quarangel.data.UserDAO;
import com.skilldistillery.quarangel.entities.Address;
import com.skilldistillery.quarangel.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;

	@RequestMapping(path = "viewProfile.do", method = RequestMethod.GET)
	public String userProfile(HttpSession session, Model model) {
		User current = (User) session.getAttribute("loggedInUser");
		model.addAttribute("user", current);
		if (current == null) {
			return "index";
		}
		return "profile";
	}

	@RequestMapping(path = "editProfile.do", method = RequestMethod.GET)
	public String editProfile(Model model, HttpSession session) {
		User current = (User) session.getAttribute("loggedInUser");
		if (current == null) {
			return "index";
		} else {
			model.addAttribute("user", current);
			return "editProfile";
		}
	}

	@RequestMapping(path = "editProfile.do", method = RequestMethod.POST)
	public String saveProfile(User user, Model model, Address address, HttpSession session) {
		User current = (User) session.getAttribute("loggedInUser");
		if (current == null) {
			return "index";
		} else {
			user = dao.updateUser(current.getId(), user, address);
			model.addAttribute("user", user);
			return "profile";
		}
	}
}
