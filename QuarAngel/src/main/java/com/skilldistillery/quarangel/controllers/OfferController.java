package com.skilldistillery.quarangel.controllers;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@RequestMapping(path = "offerHelp.do")
	public String offerHelp(@RequestParam Integer taskid, HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser != null) {
			Task task = taskDAO.findById(taskid);
			User requestUser = task.getRequestor();
			Notification notif = new Notification();
			notif.setReceivingUser(requestUser);
			notif.setSendingUser(currentUser);
			notif.setTask(task);
			notif.setNotificationDate(LocalDateTime.now());
			notifDAO.create(notif);
			return "redirect:ShowOffers.do";
		} else {
			return "index";
		}

	}

	@RequestMapping(path = "ShowOffers.do")
	public String showOffers(HttpSession session, Model model) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser != null) {
			//List<Task> taskList = taskDAO.findTaskWithNoVolunteer();
			List<Task> openTaskList = taskDAO.findOpenTaskWithCategory(currentUser);
			//List<Task> taskByCategory = taskDAO.findTaskWithCategory(currentUser);
			//List<Task> taskToShow = new ArrayList<>();
			//List<Task> notifTaskList = notifDAO.findAllNotificationTaskByUserId(currentUser.getId());
			// no volunteerid and no notification with no taskid
//			for (Task taskWithNoVolunteer : taskList) {
//				for (Task pendingTask : notifTaskList) {
//					
//				}
//			}
			model.addAttribute("tasks", openTaskList);
			//model.addAttribute("pendingOffers", notifTaskList);
			return "Offer";
		}
		return "index";

	}

}
