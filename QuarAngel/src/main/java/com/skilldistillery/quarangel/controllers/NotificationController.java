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
public class NotificationController {

	@Autowired
	TaskDAO taskdao;
	@Autowired
	NotificationDAO notifDAO;

	@RequestMapping(path = "viewNotifications.do", method = RequestMethod.GET)
	public String viewNotifications(Model model, HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		//System.out.println(currentUser.getUserReward().size());
		//currentUser.getReceiverNotifications();
		List<Notification> sentNotif = notifDAO.senderNotificationsFindByUser(currentUser);
		List<Notification> receiveNotif = notifDAO.receiverNotificationsFindByUser(currentUser);
		model.addAttribute("sentNotifications", sentNotif);
		model.addAttribute("receiveNotifications", receiveNotif);
		return "showNotifications";
	}

}
