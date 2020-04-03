package com.skilldistillery.quarangel.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.quarangel.data.CategoryDAO;
import com.skilldistillery.quarangel.data.TaskDAO;
import com.skilldistillery.quarangel.entities.Task;
import com.skilldistillery.quarangel.entities.User;

@Controller
public class HomeController {

	@Autowired
	TaskDAO taskdao;

	@Autowired
	CategoryDAO catdao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model, HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser != null) {
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
					if (task.getRequestor().getId() != currentUser.getId()) {
						newTaskList.add(task);
					}
				}
				model.addAttribute("tasks", newTaskList);
			}

//			model.addAttribute("tasks", tasks);
			model.addAttribute("categories", catdao.findAll());
			return "loginLandingPage";
		} else {
			List<Task> tasks = taskdao.findTaskWithNoVolunteer();
			model.addAttribute("tasks", tasks);
			return "index";
		}
	}

	@RequestMapping(path = "dashboard.do")
	public String dashboardPage(HttpSession session, Model model) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		// Category curCategory = catDAO.findById(categoryid);
		if (currentUser != null) {
			List<Task> allTasks = taskdao.findAll();
			List<Task> userTasks = taskdao.findTaskByRequestorUserId(currentUser.getId());
			List<Task> volunteerTasks = taskdao.findTaskByVolunteerUserId(currentUser.getId());
			List<Task> noVolunteerTasks = taskdao.findTaskWithNoVolunteer();
			System.out.println(noVolunteerTasks);
			model.addAttribute("tasks", allTasks);
			model.addAttribute("userTasks", userTasks);
			model.addAttribute("volunteerTasks", volunteerTasks);
			model.addAttribute("noVolunteerTasks", noVolunteerTasks);

			return "dashboard";
		} else {
			return "index";
		}

	}


}
