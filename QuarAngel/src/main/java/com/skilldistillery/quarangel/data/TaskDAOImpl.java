package com.skilldistillery.quarangel.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.quarangel.entities.Category;
import com.skilldistillery.quarangel.entities.Task;
import com.skilldistillery.quarangel.entities.User;

@Transactional
@Service
public class TaskDAOImpl implements TaskDAO {
	
	// F i e l d s
	
	@PersistenceContext
	private EntityManager em;
	
	// M e t h o d s

	@Override
	public Task findById(int id) {
		return em.find(Task.class, id);
	}
	@Override
	public List<Task> findTaskByRequestorUserId(int id) {
		String jpql = "SELECT task from Task task where requestor_userid = :userid";
		List<Task> tasks = em.createQuery(jpql, Task.class).setParameter("userid", id).getResultList();
		return tasks;
	}

	@Override
	public List<Task> findAll() {
		String jpql = "SELECT task from Task task";
		List<Task> tasks = em.createQuery(jpql, Task.class).getResultList();
		System.out.println(tasks);
		return tasks;
	}

	@Override
	public Task create(Task task, User requestor, Category cat) {
		task.setCategory(cat);
		task.setRequestor(requestor);
		em.persist(task);	
		em.flush();	
		em.close();
		
		return task;
	}

	@Override
	public Task update(int id, Task task) {
		Task managed = em.find(Task.class, id);
		
		managed.setDescription(task.getDescription());
		managed.setDateCreated(task.getDateCreated());
		managed.setDateDeadline(task.getDateDeadline());
		managed.setDateCompleted(task.getDateCompleted());
		managed.setRequestorComment(task.getRequestorComment());
		managed.setVolunteerComment(task.getVolunteerComment());
		managed.setCategory(task.getCategory());
		managed.setUserRewards(task.getUserRewards());
		managed.setRequestor(task.getRequestor());
		managed.setVolunteer(task.getVolunteer());
		managed.setNotifications(task.getNotifications());
		managed.setTaskComments(task.getTaskComments());
		
		em.flush();	
		em.close();	
		return managed;
	}

	@Override
	public boolean delete(int id) {
		Task task = em.find(Task.class, id);
		if (task == null) {
			return false;
		}
		
		em.remove(task);
		em.flush();		
		boolean removedWorked = !em.contains(task);
		
		em.close();
		return removedWorked;
		

	}


}
