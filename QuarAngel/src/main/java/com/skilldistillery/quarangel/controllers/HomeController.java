package com.skilldistillery.quarangel.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
<<<<<<< Updated upstream
	@RequestMapping(path = {"/", "home.do"})
	public String home() {
		return "index";
		
=======
	@Autowired
	CategoryDAO catdao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model, HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser != null) {
			List<Task> tasks = taskdao.findUnnotifiedWithTaskCategory(currentUser);
			if (tasks.size() == 0) {
				//no tasks to display
				Task testTask = new Task();
				testTask.setDescription("No tasks to display");
				tasks.add(testTask);
				model.addAttribute("tasks", tasks);
			}
			model.addAttribute("tasks", tasks);
			model.addAttribute("categories", catdao.findAll());
			return "loginLandingPage";
		}else {
			List<Task> tasks = taskdao.findTaskWithNoVolunteer();
			model.addAttribute("tasks", tasks);	
			return "index";
		}
	}

	@RequestMapping(path = "loginLandingPage.do")
	public String loginLandingPage() {
		return "loginLandingPage";
	}
	@RequestMapping(path = "dashboard.do")
	public String dashboardPage(HttpSession session, Model model) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		//Category curCategory = catDAO.findById(categoryid);
		if (currentUser != null) {
			List<Task> allTasks = taskdao.findAll();
			List<Task>userTasks = taskdao.findTaskByRequestorUserId(currentUser.getId());
			List<Task>volunteerTasks = taskdao.findTaskByVolunteerUserId(currentUser.getId());
			List<Task>noVolunteerTasks = taskdao.findTaskWithNoVolunteer();
			System.out.println(noVolunteerTasks);
			model.addAttribute("tasks", allTasks);
			model.addAttribute("userTasks", userTasks);
			model.addAttribute("volunteerTasks", volunteerTasks);
			model.addAttribute("noVolunteerTasks", noVolunteerTasks);
			return "dashboard";
		}else {
			return "index";
		}
>>>>>>> Stashed changes
	}

}
