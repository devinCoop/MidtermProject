package com.skilldistillery.quarangel.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.quarangel.data.UserDAO;
import com.skilldistillery.quarangel.entities.User;

@Controller
public class LoginController {

	@Autowired
	private UserDAO dao;

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(User user, Model model, HttpSession session) {
		System.out.println(user.getUsername() + "      " + user.getPassword());
		User userObj = dao.findByUsernameAndPassword(user.getUsername(), user.getPassword());
		if (userObj == null) {
			return "index";
		} else {
			session.setAttribute("loggedInUser", userObj);
		}
		return "dashboard";

	}

	@RequestMapping(path = "logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		if (session.getAttribute("loggedInUser") != null) {
			System.out.println("Inside of logout, logged in user found.");
			session.removeAttribute("loggedInUser");
		}
		return "logout";
	}

}
