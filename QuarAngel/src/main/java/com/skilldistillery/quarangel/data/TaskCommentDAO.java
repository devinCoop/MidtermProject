package com.skilldistillery.quarangel.data;

import java.util.List;

import com.skilldistillery.quarangel.entities.TaskComment;

public interface TaskCommentDAO {
	
	public TaskComment findById(int id);

	public List<TaskComment> findAll();

	public TaskComment create(TaskComment tc);

	public TaskComment update(int id, TaskComment tc);

	public boolean delete(int id);

}
