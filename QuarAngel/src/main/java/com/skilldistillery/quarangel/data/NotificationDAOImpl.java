package com.skilldistillery.quarangel.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.quarangel.entities.Notification;

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
	public List<Notification> findAll() {
		String jpql = "SELECT noti FROM Notification noti";
		return em.createQuery(jpql, Notification.class).getResultList();
	}

	@Override
	public boolean delete(int id) {
		EntityManager em = emf.createEntityManager();
		Notification notification = em.find(Notification.class, id);
		if (notification == null) {
			return false;
		}
		em.getTransaction().begin();

		em.remove(notification); // performs the delete on the managed entity
		em.flush();

		em.getTransaction().commit();

		boolean removedWorked = !em.contains(notification);

		em.close();
		return removedWorked;
	}

	@Override
	public Notification create(Notification notification) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();

		// write the notification to the database
		em.persist(notification);
		// update the "local" notification object
		em.flush();
		em.getTransaction().commit();

		em.close();

		// return the notification object
		return notification;
	}

	@Override
	public Notification update(int id, Notification notification) {
		EntityManager em = emf.createEntityManager();
		Notification managed = em.find(Notification.class, id);
		em.getTransaction().begin();

		managed.setMessage(notification.getMessage());
		managed.setNotificationDate(notification.getNotificationDate());
		managed.setReceivingUser(notification.getReceivingUser());
		managed.setSendingUser(notification.getSendingUser());
		managed.setTask(notification.getTask());

		em.flush();
		em.getTransaction().commit();

		// open a transaction
		em.close();

		return managed;
	}

}
