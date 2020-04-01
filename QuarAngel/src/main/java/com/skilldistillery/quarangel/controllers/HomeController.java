package com.skilldistillery.quarangel.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.quarangel.data.TaskDAO;
import com.skilldistillery.quarangel.entities.Task;

@Controller
public class HomeController {

	@Autowired
	TaskDAO taskdao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		List<Task> tasks = taskdao.findTaskWithNoVolunteer();
		model.addAttribute("tasks", tasks);
		return "index";
	}

	@RequestMapping(path = "dashboard.do")
	public String dashboard() {
		return "dashboard";
	}

}
