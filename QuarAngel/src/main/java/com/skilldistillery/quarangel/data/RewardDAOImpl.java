package com.skilldistillery.quarangel.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.quarangel.entities.Reward;

@Service
@Transactional
public class RewardDAOImpl implements RewardDAO {

	@PersistenceContext
	EntityManager em;
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("QuarAngelPU");

	@Override
	public Reward findById(int id) {
		return em.find(Reward.class, id);
	}

	@Override
	public List<Reward> findAll() {
		String jpql = "SELECT reward FROM Reward reward";
		return em.createQuery(jpql, Reward.class).getResultList();
	}

	@Override
	public boolean delete(int id) {
		EntityManager em = emf.createEntityManager();
		Reward reward = em.find(Reward.class, id);
		if (reward == null) {
			return false;
		}
		em.getTransaction().begin();

		em.remove(reward); // performs the delete on the managed entity
		em.flush();

		em.getTransaction().commit();

		boolean removedWorked = !em.contains(reward);

		em.close();
		return removedWorked;
	}

	@Override
	public Reward create(Reward reward) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();

		// write the notification to the database
		em.persist(reward);
		// update the "local" notification object
		em.flush();
		em.getTransaction().commit();

		em.close();

		// return the notification object
		return reward;
	}

	@Override
	public Reward update(int id, Reward reward) {
		EntityManager em = emf.createEntityManager();
		Reward managed = em.find(Reward.class, id);
		em.getTransaction().begin();

		managed.setNumOfTasksCompleted(reward.getNumOfTasksCompleted());
		managed.setRewardLevel(reward.getRewardLevel());

		em.flush();
		em.getTransaction().commit();

		// open a transaction
		em.close();

		return managed;
	}
}
