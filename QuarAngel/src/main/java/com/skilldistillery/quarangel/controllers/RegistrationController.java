package com.skilldistillery.quarangel.controllers;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.quarangel.data.UserDAO;
import com.skilldistillery.quarangel.entities.Address;
import com.skilldistillery.quarangel.entities.Task;
import com.skilldistillery.quarangel.entities.User;

@Controller
public class RegistrationController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = "registration.do", method = RequestMethod.POST)
	public String registerUser(User user, Address address, Model model, HttpSession session) {
		User createdUser = userDao.create(user, address);
		session.setAttribute("loggedInUser", createdUser);
		return "loginLandingPage";
		
	}

}

//@RequestMapping(path = "loggingIn.do", method = RequestMethod.POST)
//public String loggingIn(User user, Model model, HttpSession session) {
//	System.out.println(user.getUsername() + "      " + user.getPassword());
//	User userObj = dao.findByUsernameAndPassword(user.getUsername(), user.getPassword());
//	if (userObj == null) {
//		return "index";
//	} else {
//		session.setAttribute("loggedInUser", userObj);
//	}
//	Task task = new Task();
//	model.addAttribute("categories", catDAO.findAll());
//	task.setDateDeadline(LocalDateTime.now());
//	task.setDateCreated(LocalDateTime.now());
//	model.addAttribute("task", task);
//	return "loginLandingPage";
//
//}
