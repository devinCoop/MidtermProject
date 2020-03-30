package com.skilldistillery.quarangel.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.quarangel.data.UserDAO;
import com.skilldistillery.quarangel.entities.Address;
import com.skilldistillery.quarangel.entities.User;

@Controller
public class RegistrationController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = "registration.do", method = RequestMethod.POST)
	public ModelAndView registerUser(User user, Address address) {
		ModelAndView mv = new ModelAndView();
		System.out.println(user);
		userDao.create(user, address);
		mv.setViewName("loggedIn");
		return mv;
	}

}
