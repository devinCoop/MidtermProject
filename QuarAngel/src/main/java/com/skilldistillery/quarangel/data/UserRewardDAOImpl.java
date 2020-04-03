package com.skilldistillery.quarangel.data;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.quarangel.entities.Reward;
import com.skilldistillery.quarangel.entities.Task;
import com.skilldistillery.quarangel.entities.User;
import com.skilldistillery.quarangel.entities.UserReward;
import com.skilldistillery.quarangel.entities.UserRewardId;

@Service
@Transactional
public class UserRewardDAOImpl implements UserRewardDAO {

	@Autowired
	private TaskDAO taskDao;

	@Autowired
	private RewardDAO rewardDao;

	@PersistenceContext
	EntityManager em;

	public UserReward create(User user, Task task, Reward reward) {
		user = em.find(User.class, user.getId());
		UserReward urObj = new UserReward();
		UserRewardId id = new UserRewardId();
		id.setUserId(user.getId());
		id.setRewardId(reward.getId());
		urObj.setId(id);
		System.out.println(task);
		System.out.println(user);
		System.out.println(reward);
		urObj.setReward(reward);
		urObj.setTask(task);
		urObj.setUser(user);
		urObj.setDateOfReward(LocalDate.now());
		em.persist(urObj);
		System.out.println("After persist" + reward);
		em.flush();
		return urObj;
	}

	@Override
	public boolean destroyUserReward(int id) {
		UserReward userReward = em.find(UserReward.class, id);
		em.remove(userReward);
		em.flush();
		boolean rmUserReward = !em.contains(userReward);
		return rmUserReward;
	}

	@Override
	public List<UserReward> findAll() {
		String jpql = "SELECT u FROM User u";
		List<UserReward> users = em.createQuery(jpql, UserReward.class).getResultList();
		return users;
	}

	@Override
	public UserReward findById(int id) {
		return em.find(UserReward.class, id);
	}

	@Override
	public UserReward updateUserReward(UserReward userReward) {
		UserReward userRewardChanges = em.find(UserReward.class, userReward.getId());
		userRewardChanges.setReward(userReward.getReward());
		userRewardChanges.setTask(userReward.getTask());
		userRewardChanges.setUser(userReward.getUser());
		userRewardChanges.setDateOfReward(userReward.getDateOfReward());

		em.flush();
		return userRewardChanges;

	}

}
