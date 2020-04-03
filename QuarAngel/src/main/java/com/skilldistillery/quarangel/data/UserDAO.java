package com.skilldistillery.quarangel.data;

import java.util.List;

import com.skilldistillery.quarangel.entities.Address;
import com.skilldistillery.quarangel.entities.Task;
import com.skilldistillery.quarangel.entities.User;
import com.skilldistillery.quarangel.entities.UserReward;

public interface UserDAO {

	User create(User user, Address address);

	User findById(int id);

	List<User> findAll();

	boolean destroyUser(int id);

	User findByUsernameAndPassword(String username, String password);

	List<UserReward> findUserRewardsByUserid(User user);

	List<Task> findUserCompletedVolunteerByUserid(User user);

	User updateUser(int id, User user, Address address, Integer Id);

}
