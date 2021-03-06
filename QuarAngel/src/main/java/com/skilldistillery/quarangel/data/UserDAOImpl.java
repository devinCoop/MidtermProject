package com.skilldistillery.quarangel.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.quarangel.entities.Address;
import com.skilldistillery.quarangel.entities.Task;
import com.skilldistillery.quarangel.entities.User;
import com.skilldistillery.quarangel.entities.UserReward;

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

	public User updateUser(int id, User user, Address address, Integer addressId) {
		System.out.println("TESTING kaosjdfla KLJ:LKJ" + address);
		System.out.println("TESTING kaosjdfla KLJ:LKJ" + id + "TeStInG UsEr" + user.getLastName());
		

		Address managed = addressDAO.update(addressId, address);

		User userToBeChangedInDb = em.find(User.class, id);
		userToBeChangedInDb.setUsername(user.getUsername());
		userToBeChangedInDb.setPassword(user.getPassword());
		userToBeChangedInDb.setFirstName(user.getFirstName());
		userToBeChangedInDb.setLastName(user.getLastName());
		userToBeChangedInDb.setPhone(user.getPhone());

		userToBeChangedInDb.setAddress(managed);
		userToBeChangedInDb.setEnabled(userToBeChangedInDb.getEnabled());
		userToBeChangedInDb.setRole(userToBeChangedInDb.getRole());
		userToBeChangedInDb.setBiography(user.getBiography());
		em.persist(userToBeChangedInDb);
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
	public List<UserReward> findUserRewardsByUserid(User user) {
		User curUser = em.find(User.class, user.getId());
		List<UserReward> rewardList = curUser.getUserReward();
		return rewardList;
	}


	@Override
	public List<Task> findUserCompletedVolunteerByUserid(User user) {
		String jpql = "SELECT u.volunteerTasks FROM User u where u.id = :userID";
		List<Object> results = em.createQuery(jpql, Object.class).setParameter("userID", user.getId()).getResultList();
		List<Task> tasks = new ArrayList<>();
		results.stream().forEach(x -> tasks.add((Task) x));


		List<Task> newTaskList = new ArrayList<>();
		for (Task task : tasks) {
			if (task.getDateCompleted() != null) {
				newTaskList.add(task);

			}

		}
//		String jpql = "SELECT user.volunteerTasks FROM User user JOIN u.volunteerTasks task WHERE user.id = :userID and task.dateCompleted is not null"; //select from task where volunteer_userid = currentuser.id and dateCompleted is not null
//		List<Task> taskCompletedList = em.createQuery(jpql, Task.class).setParameter("userID", user.getId()).getResultList();
		return newTaskList;
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
