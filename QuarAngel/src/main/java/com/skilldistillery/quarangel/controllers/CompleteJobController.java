package com.skilldistillery.quarangel.controllers;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.quarangel.data.TaskDAO;
import com.skilldistillery.quarangel.entities.Task;
import com.skilldistillery.quarangel.entities.User;

@Controller
public class CompleteJobController {

	@Autowired
	private TaskDAO dao;

	@RequestMapping(path = "ShowCompleteJob.do", method = RequestMethod.POST)
	public String request(HttpSession session, Model model) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser != null) {
			List<Task> taskList = dao.findTaskByRequestorUserId(currentUser.getId());
			List<Task> taskNotCompletedList = new ArrayList<>();
			for (Task task : taskList) {
				if (task.getDateCompleted() == null) {
					taskNotCompletedList.add(task);
				}
			}
			model.addAttribute("tasksNotComplete", taskNotCompletedList);
			return "ShowCanComplete";
		} else {
			return "index";
		}
	}

	@RequestMapping(path = "CompleteJob.do", method = RequestMethod.GET)
	public String completeTaskButton(@RequestParam int taskid, Model model, HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser != null) {
			dao.findById(taskid).setDateCompleted(LocalDateTime.now());
			return "";
		}else {
			return "index";
		}
	}

}
