package com.skilldistillery.quarangel.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.quarangel.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	EntityManager em;
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("QuarAngelPU");

	public User create(User user) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();

		em.persist(user);
		em.flush();
		em.getTransaction().commit();
		em.close();
		return user;
	}

	@Override
	public User updateUser(int id, User user) {
		EntityManager em = emf.createEntityManager();
		User userToBeChangedInDb = em.find(User.class, id);
		em.getTransaction().begin();

		userToBeChangedInDb.setUsername(user.getUsername());
		userToBeChangedInDb.setPassword(user.getPassword());
		userToBeChangedInDb.setFirstName(user.getFirstName());
		userToBeChangedInDb.setLastName(user.getLastName());
		userToBeChangedInDb.setPhone(user.getPhone());
		userToBeChangedInDb.setAddress(user.getAddress());
		userToBeChangedInDb.setEnabled(user.getEnabled());
		userToBeChangedInDb.setRole(user.getRole());
		userToBeChangedInDb.setBiography(user.getBiography());

		em.flush();
		em.getTransaction().commit();
		em.close();
		return userToBeChangedInDb;
	}

	@Override
	public boolean destroyUser(int id) {
		EntityManager em = emf.createEntityManager();
		User user = em.find(User.class, id);

		em.getTransaction().begin();
		em.remove(user);

		em.flush();
		em.getTransaction().commit();
		boolean rmUser = !em.contains(user);
		em.close();
		return rmUser;
	}

	@Override
	public List<User> findAll() {
		String jpql = "SELECT u FROM User u";
		List<User> users = em.createQuery(jpql, User.class).getResultList();
		return users;
	}

	@Override
	public User findById(int id) {
		return em.find(User.class, id);
	}

}
