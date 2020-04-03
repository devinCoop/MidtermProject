package com.skilldistillery.quarangel.controllers;

import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.quarangel.data.CategoryDAO;
import com.skilldistillery.quarangel.data.NotificationDAO;
import com.skilldistillery.quarangel.data.TaskDAO;
import com.skilldistillery.quarangel.entities.Notification;
import com.skilldistillery.quarangel.entities.Task;
import com.skilldistillery.quarangel.entities.User;

@Controller
public class OfferController {

	@Autowired
	private NotificationDAO notifDAO;

	@Autowired
	private TaskDAO taskDAO;

	@Autowired
	private CategoryDAO catDAO;

	@RequestMapping(path = "offerHelp.do")
	public String offerHelp(@RequestParam Integer taskid, Model model, HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser != null) {
			Task task = taskDAO.findById(taskid);
			User requestorUser = task.getRequestor();
			Notification notif = new Notification();
			notif.setReceivingUser(requestorUser);
			notif.setSendingUser(currentUser);
			notif.setTask(task);
			notif.setNotificationDate(LocalDateTime.now());
			notif.setMessage(currentUser.getFirstName()+" would like to volunteer for taskid: "+taskid  );
			notifDAO.create(notif);
			model.addAttribute("userId", currentUser.getId());
			return "redirect:landingPage.do";
		} else {
			return "index";
		}

	}

	@RequestMapping(path = "landingPage.do")
	public String showLanding(Model model, HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser != null) {
			List<Task> tasks = taskDAO.findUnnotifiedWithTaskCategory(currentUser);
			model.addAttribute("categories", catDAO.findAll());
			model.addAttribute("tasks", tasks);
			model.addAttribute("userId", currentUser.getId());
			List<Task> volunteerTasks = taskDAO.findTaskByVolunteerUserId(currentUser.getId());
			List<Task> currentUserTasks = taskDAO.findTaskByRequestorUserId(currentUser.getId());
			model.addAttribute("volunteerTasks", volunteerTasks);
			model.addAttribute("userTasks", currentUserTasks);
			return "dashboard";
		} else {
			return "index";
		}
	}

	@RequestMapping(path = "displayOffers.do")
	public String showOffers(HttpSession session, Model model) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser != null) {
			// List<Task> taskList = taskDAO.findTaskWithNoVolunteer();
			List<Task> openTaskList = taskDAO.findUnnotifiedWithTaskCategory(currentUser);
			model.addAttribute("tasks", openTaskList);
			model.addAttribute("userId", currentUser.getId());
			System.out.println("CURRENT USER" + currentUser.getId());
			// model.addAttribute("pendingOffers", notifTaskList);
			return "offer";
		}
		return "index";

	}

}
