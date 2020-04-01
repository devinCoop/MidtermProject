package com.skilldistillery.quarangel.controllers;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.quarangel.data.CategoryDAO;
import com.skilldistillery.quarangel.data.TaskDAO;
import com.skilldistillery.quarangel.entities.Category;
import com.skilldistillery.quarangel.entities.Task;
import com.skilldistillery.quarangel.entities.User;

@Controller
public class RequestController {

	@Autowired
	private TaskDAO dao;
	@Autowired
	private CategoryDAO catDAO;

	@RequestMapping(path = "requestSave.do", method = RequestMethod.POST)
	public String request(@RequestParam Integer categoryid, Task task, HttpSession session, Model model) {
		User currentUser = getCurrentUserFromSession(session);
		Category curCategory = catDAO.findById(categoryid);
		if (currentUser != null) {
			dao.create(task, currentUser, curCategory);// task, current user id, category id)
			List<Task> allTasks = dao.findAll();
			model.addAttribute("tasks", allTasks);
			return "dashboard";
		} else {
			return "index";
		}
	}

	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		dateFormat.setLenient(true);
		// webDataBinder.registerCustomEditor(Date.class, new
		// CustomDateEditor(dateFormat, true));
		webDataBinder.registerCustomEditor(LocalDateTime.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalDateTime.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm").format((LocalDateTime) getValue());
			}
		});
	}

	private User getCurrentUserFromSession(HttpSession session) {
		User current = (User) session.getAttribute("loggedInUser");
		return current;
	}

}
