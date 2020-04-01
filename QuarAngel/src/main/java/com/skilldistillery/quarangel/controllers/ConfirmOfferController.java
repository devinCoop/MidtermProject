package com.skilldistillery.quarangel.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.quarangel.data.NotificationDAO;
import com.skilldistillery.quarangel.data.TaskDAO;
import com.skilldistillery.quarangel.entities.Notification;
import com.skilldistillery.quarangel.entities.Task;
import com.skilldistillery.quarangel.entities.User;

@Controller
public class ConfirmOfferController {

	@Autowired
	private NotificationDAO notifDAO;

	@Autowired
	private TaskDAO taskDAO;

	@RequestMapping(path = "ShowConfirm.do", method = RequestMethod.GET)
	public String showConfirm(HttpSession session, Model model) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		List<Task> currentUserTasks = taskDAO.findTaskByRequestorUserId(currentUser.getId());
		model.addAttribute("tasks", currentUserTasks);
		for (Task currentUserTask : currentUserTasks) {
			if (currentUserTask == null) {

			}
		}
		return "ConfirmOffer";
	}

	@RequestMapping(path = "confirmOffer.do", method = RequestMethod.GET)
	public String confirm(int taskId, int sendingUserId, HttpSession session, Model model) {
		System.out.println("Task" + taskId + "Sending User" + sendingUserId);
		User currentUser = (User) session.getAttribute("loggedInUser");
		List<Task> currentUserTasks = taskDAO.findTaskByRequestorUserId(currentUser.getId());
		model.addAttribute("tasks", currentUserTasks);
		Task task = taskDAO.findById(taskId);
		List<Notification> notifs = task.getNotifications();
		// Get notification for current task and confirm offer
//		task.setVolunteer();
		model.addAttribute("notifs", notifs);

		return "ConfirmOffer";
	}

}


