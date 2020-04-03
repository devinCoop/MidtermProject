package com.skilldistillery.quarangel.data;

import java.util.List;

import com.skilldistillery.quarangel.entities.Address;
import com.skilldistillery.quarangel.entities.Reward;
import com.skilldistillery.quarangel.entities.Task;
import com.skilldistillery.quarangel.entities.User;
import com.skilldistillery.quarangel.entities.UserReward;

public interface UserRewardDAO {

	UserReward create(User user, Task task, Reward reward);

	UserReward findById(int id);

	List<UserReward> findAll();

	UserReward updateUserReward(UserReward userReward);

	boolean destroyUserReward(int id);

}
