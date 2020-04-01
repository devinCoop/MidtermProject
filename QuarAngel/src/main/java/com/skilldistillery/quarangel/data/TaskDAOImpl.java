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
	public List<Task> findTaskWithNoVolunteer() {
		String jpql = "SELECT task from Task task where volunteer_userid IS NULL";
		List<Task> tasks = em.createQuery(jpql, Task.class).getResultList();
		System.out.println(tasks);
		return tasks;
	}
	
	@Override
	public List<Task> findTaskWithCategory(User user){
		String jpql = "SELECT task from Task task join task.category cat join cat.users u where u.id = :id";
		List<Task> tasks = em.createQuery(jpql, Task.class).setParameter("id", user.getId()).getResultList();
		System.out.println(tasks);
		return tasks;
	}
	
	@Override
	public List<Task> findOpenTaskWithCategory(User user){
		String jpql = "SELECT task from Task task join task.category cat join cat.users u where u.id = :id and task.volunteer is null";
		List<Task> tasks = em.createQuery(jpql, Task.class).setParameter("id", user.getId()).getResultList();
		System.out.println(tasks);
		return tasks;
	}
	
	@Override
	public List<Task> findUnnotifiedWithTaskCategory(User user){
//		String jpql = "SELECT task from Task task join task.notifications offers join task.category cat "+ 
//				"join cat.users u left join u.senderNotifications n where u.id = :id and " + 
//				"task.volunteer is null and n.id is null";
		String jpql = "SELECT task FROM Task task LEFT JOIN task.notifications offers JOIN task.category cat "+ 
					  " JOIN cat.users u WHERE u.id = :id AND " + 
					  " task.volunteer IS NULL AND NOT EXISTS (SELECT n FROM Notification n WHERE n.task.id = task.id AND n.sendingUser.id = u.id)";
		List<Task> tasks = em.createQuery(jpql, Task.class).setParameter("id", user.getId()).getResultList();
		System.out.println(tasks);
		return tasks;
	}
	
//	@Override
//	public List<Task> findTaskWithPendingVolunteer(int id) {
//		String jpql = "select task from Task task join Notification on task.id = notification.task_id where notification.sender_id = :userId";
//		List<Task> tasks = em.createQuery(jpql, Task.class).setParameter("userId", id).getResultList();
//		return tasks;
//	}

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
