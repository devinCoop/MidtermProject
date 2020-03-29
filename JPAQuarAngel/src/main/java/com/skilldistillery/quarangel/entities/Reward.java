package com.skilldistillery.quarangel.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Reward {

	// FIELDS

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "reward_level")
	private String rewardLevel;

	@Column(name = "num_of_tasks_completed")
	private int numOfTasksCompleted;

	@OneToMany(mappedBy = "reward")
	private List<UserReward> userRewards;

	// METHODS BEGIN:

	public Reward() {

	}

	public List<UserReward> getUserRewards() {
		return userRewards;
	}

	public void setUserRewards(List<UserReward> userRewards) {
		this.userRewards = userRewards;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRewardLevel() {
		return rewardLevel;
	}

	public void setRewardLevel(String rewardLevel) {
		this.rewardLevel = rewardLevel;
	}

	public int getNumOfTasksCompleted() {
		return numOfTasksCompleted;
	}

	public void setNumOfTasksCompleted(int numOfTasksCompleted) {
		this.numOfTasksCompleted = numOfTasksCompleted;
	}

	@Override
	public String toString() {
		return "Reward [id=" + id + ", rewardLevel=" + rewardLevel + ", numOfTasksCompleted=" + numOfTasksCompleted
				+ ", userRewards=" + userRewards + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Reward other = (Reward) obj;
		if (id != other.id)
			return false;
		return true;
	}

}
