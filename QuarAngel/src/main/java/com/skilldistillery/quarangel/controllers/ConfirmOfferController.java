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
	
	@RequestMapping(path = "confirmOffer.do", method = RequestMethod.GET)
	public String confirm(Task task, HttpSession session, Model model) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		List<Task> currentUserTasks = taskDAO.findTaskByRequestorUserId(currentUser.getId());
		model.addAttribute("tasks", currentUserTasks);
		for (Task currentUserTask : currentUserTasks) {
			if (currentUserTask == null) {
				
			}
		}
		return "ConfirmOffer";
	}

}


//First display all tasks where requestor.id = currentUser id

//Then if task.notification is not null 

