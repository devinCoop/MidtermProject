package com.skilldistillery.quarangel.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.skilldistillery.quarangel.entities.TaskComment;

public class TaskCommentDAOImpl implements TaskCommentDAO {
	
	// F i e l d s 
	
	@PersistenceContext
	private EntityManager em;
	
	// M e t h o d s

	@Override
	public TaskComment findById(int id) {
		return em.find(TaskComment.class, id);
	}

	@Override
	public List<TaskComment> findAll() {
		String jpql = "SELECT tc from TaskComment tc";
		List<TaskComment> taskComments = em.createQuery(jpql, TaskComment.class).getResultList();
		System.out.println(taskComments);
		return taskComments;
	}

	@Override
	public TaskComment create(TaskComment tc) {
		em.persist(tc);
		em.flush();
		
		
		return tc;
	}

	@Override
	public TaskComment update(int id, TaskComment tc) {
		TaskComment managed = em.find(TaskComment.class, id);
		em.getTransaction().begin();
		
		managed.setCommentText(tc.getCommentText());
		managed.setCommentDatePosted(tc.getCommentDatePosted());
		managed.setTask(tc.getTask());
		managed.setPoster(tc.getPoster());
		
		em.flush();
		em.getTransaction().commit();
		
		em.close();
		
		return managed;
	}

	@Override
	public boolean delete(int id) {
		TaskComment tc = em.find(TaskComment.class, id);
		if (tc == null) {
			return false;
		}
		em.getTransaction().begin();
		
		em.remove(tc);
		em.flush();
		
		em.getTransaction().commit();
		
		boolean removedWorked = !em.contains(tc);
		
		em.close();
		return removedWorked;
		

	}

}
