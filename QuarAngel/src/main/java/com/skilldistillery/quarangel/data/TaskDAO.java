package com.skilldistillery.quarangel.data;

import java.util.List;

import com.skilldistillery.quarangel.entities.Task;

public interface TaskDAO {

	public Task findById(int id);

	public List<Task> findAll();

	public Task create(Task task);

	public Task update(int id, Task task);

	public boolean delete(int id);


}