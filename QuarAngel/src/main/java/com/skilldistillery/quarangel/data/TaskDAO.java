package com.skilldistillery.quarangel.data;

import java.util.List;

import com.skilldistillery.quarangel.entities.Category;
import com.skilldistillery.quarangel.entities.Task;
import com.skilldistillery.quarangel.entities.User;

public interface TaskDAO {

	public Task findById(int id);

	public List<Task> findAll();

	public Task update(int id, Task task);

	public boolean delete(int id);

	public Task create(Task task, User requestor, Category cat);


}
