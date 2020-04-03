package com.skilldistillery.quarangel.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.quarangel.data.CategoryDAO;

import com.skilldistillery.quarangel.data.NotificationDAO;

import com.skilldistillery.quarangel.data.TaskDAO;
import com.skilldistillery.quarangel.data.UserDAO;
import com.skilldistillery.quarangel.entities.Task;
import com.skilldistillery.quarangel.entities.User;

@Controller
public class LoginController {

	@Autowired
	private UserDAO dao;

	@Autowired
	private TaskDAO taskdao;

	@Autowired
	private CategoryDAO catDAO;

	@Autowired
	private NotificationDAO notifDAO;

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(User user, Model model, HttpSession session) {
		System.out.println(user.getUsername() + "      " + user.getPassword());
		User userObj = dao.findByUsernameAndPassword(user.getUsername(), user.getPassword());
		if (userObj == null) {
			return "index";
		} else {
			session.setAttribute("loggedInUser", userObj);
		}
		return "loginLandingPage";

	}

	@RequestMapping(path = "loggingIn.do", method = RequestMethod.POST)
	public String loggingIn(User user, Model model, HttpSession session) {
		System.out.println(user.getUsername() + "      " + user.getPassword());
		User userObj = dao.findByUsernameAndPassword(user.getUsername(), user.getPassword());
		if (userObj == null) {
			return "index";
		} else {
			session.setAttribute("loggedInUser", userObj);

			session.setAttribute("numNotifications", notifDAO.receiverNotificationsFindByUser(userObj).size());
			session.setAttribute("numRewards", dao.findUserCompletedVolunteerByUserid(userObj).size());
		}
		List<Task> tasks = taskdao.findTaskWithNoVolunteer();

		if (tasks.size() == 0) {
			// no tasks to display
			Task testTask = new Task();
			testTask.setDescription("No tasks to display");
			tasks.add(testTask);
			model.addAttribute("tasks", tasks);
		} else {
			List<Task> newTaskList = new ArrayList<>();
			for (Task task : tasks) {
				if (task.getRequestor().getId() != userObj.getId()) {
					newTaskList.add(task);
				}
			}
			model.addAttribute("tasks", newTaskList);
		}

		System.out.println("Hello Friend" + userObj.getId());
		model.addAttribute("categories", catDAO.findAll());

		return "loginLandingPage";

	}
//	@RequestMapping(path = "loggedIn.do", method = RequestMethod.GET)
//	public String loggedIn(HttpSession session) {
//		return "loginLandingPage";
//		
//	}

	@RequestMapping(path = "logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		if (session.getAttribute("loggedInUser") != null) {
			System.out.println("Inside of logout, logged in user found.");
			session.removeAttribute("loggedInUser");
		}
		List<Task> tasks = taskdao.findTaskWithNoVolunteer();
		model.addAttribute("tasks", tasks);
		return "index";
	}

}
