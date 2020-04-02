package com.skilldistillery.quarangel.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.quarangel.entities.Notification;
import com.skilldistillery.quarangel.entities.Task;

@Service
@Transactional
public class NotificationDAOImpl implements NotificationDAO {

	@PersistenceContext
	EntityManager em;
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("QuarAngelPU");

	@Override
	public Notification findById(int id) {
		return em.find(Notification.class, id);
	}
	
	@Override
	public List<Notification> senderNotificationsFindByUser(User user) {
		String jpql = "SELECT noti FROM Notification noti WHERE sender_id = :senderID";
		List<Notification> notifList = em.createQuery(jpql, Notification.class).setParameter("senderID", user.getId()).getResultList();
		return notifList;
	}
	@Override
	public List<Notification> receiverNotificationsFindByUser(User user) {
		String jpql = "SELECT noti FROM Notification noti WHERE receiver_id = :receiverID";
		List<Notification> notifList = em.createQuery(jpql, Notification.class).setParameter("receiverID", user.getId()).getResultList();
		return notifList;
	}

	@Override
	public List<Notification> findAll() {
		String jpql = "SELECT noti FROM Notification noti";
		return em.createQuery(jpql, Notification.class).getResultList();
	}
	
	@Override
	public List<Task> findAllNotificationTaskByUserId(int id) {
		String jpql = "SELECT noti.task FROM Notification noti WHERE sender_id = :senderID ";
		return em.createQuery(jpql, Task.class).setParameter("senderID", id).getResultList();
	}

	@Override
	public boolean delete(int id) {
		Notification notification = em.find(Notification.class, id);
		if (notification == null) {
			return false;
		}

		em.remove(notification); // performs the delete on the managed entity
		em.flush();
		boolean removedWorked = !em.contains(notification);

		em.close();
		return removedWorked;
	}

	@Override
	public Notification create(Notification notification) {

		// write the notification to the database
		em.persist(notification);
		// update the "local" notification object
		em.flush();

		em.close();

		// return the notification object
		return notification;
	}

	@Override
	public Notification update(int id, Notification notification) {
		Notification managed = em.find(Notification.class, id);

		managed.setMessage(notification.getMessage());
		managed.setNotificationDate(notification.getNotificationDate());
		managed.setReceivingUser(notification.getReceivingUser());
		managed.setSendingUser(notification.getSendingUser());
		managed.setTask(notification.getTask());

		em.flush();

		// open a transaction
		em.close();

		return managed;
	}

}
