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

	@RequestMapping(path = "showConfirm.do", method = RequestMethod.GET)
	public String showConfirm(HttpSession session, Model model) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		List<Task> currentUserTasks = taskDAO.findTaskByRequestorUserId(currentUser.getId());
		model.addAttribute("tasks", currentUserTasks);
		for (Task currentUserTask : currentUserTasks) {
			if (currentUserTask == null) {

			}
		}
		return "confirmOffer";
	}

	@RequestMapping(path = "confirmOffer.do", method = RequestMethod.GET)
	public String confirm(Integer taskid, HttpSession session, Integer notificationId, Model model) {
		System.out.println("HHHHHHHHHHH" + taskid);// good test
		Task task = taskDAO.findById(taskid);
		User currentUser = task.getRequestor();
		System.out.println("This is the current user " + currentUser);//good test
		List<Task> currentUserTasks = taskDAO.findTaskByRequestorUserId(currentUser.getId());
		System.out.println("This is the current user tasks " + currentUserTasks);
		model.addAttribute("userTasks", currentUserTasks);
		Notification notif = notifDAO.findById(notificationId);
		System.out.println(notif.getSendingUser());
		task.setVolunteer(notif.getSendingUser());
		taskDAO.update(task.getId(), task);
		System.out.println("This prints out the volunteer first name" + task.getVolunteer());
		return "dashboard";

	}

}
