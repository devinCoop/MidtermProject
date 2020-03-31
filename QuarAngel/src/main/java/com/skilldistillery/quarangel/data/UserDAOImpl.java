package com.skilldistillery.quarangel.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.quarangel.entities.Address;
import com.skilldistillery.quarangel.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@Autowired
	private AddressDAO addressDAO;

	@PersistenceContext
	EntityManager em;

	public User create(User user, Address address) {
		user.setEnabled(true);
		user.setRole("Default");
		user.setAddress(address);
		em.persist(address);
		em.persist(user);
		System.out.println("After persist" + user);
		em.flush();
		return user;
	}

	@Override
	public User updateUser(int id, User user, Address address) {
		System.out.println(address);
		addressDAO.update(address.getId(), address);
		User userToBeChangedInDb = em.find(User.class, id);
		userToBeChangedInDb.setUsername(user.getUsername());
		userToBeChangedInDb.setPassword(user.getPassword());
		userToBeChangedInDb.setFirstName(user.getFirstName());
		userToBeChangedInDb.setLastName(user.getLastName());
		userToBeChangedInDb.setPhone(user.getPhone());
		userToBeChangedInDb.setAddress(address);
		userToBeChangedInDb.setEnabled(user.getEnabled());
		userToBeChangedInDb.setRole(user.getRole());
		userToBeChangedInDb.setBiography(user.getBiography());

		em.flush();
		return userToBeChangedInDb;
	}

	@Override
	public boolean destroyUser(int id) {
		User user = em.find(User.class, id);
		em.remove(user);
		em.flush();
		boolean rmUser = !em.contains(user);
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

	@Override
	public User findByUsernameAndPassword(String username, String password) {
		String jpql = "SELECT u FROM User u WHERE u.username = :username AND u.password = :password";
		User user = null;
		try {
			user = em.createQuery(jpql, User.class).setParameter("username", username)
					.setParameter("password", password).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}
