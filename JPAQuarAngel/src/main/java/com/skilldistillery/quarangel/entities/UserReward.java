package com.skilldistillery.quarangel.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.MapsId;

import javax.persistence.Table;

@Entity
@Table(name = "user_reward")
public class UserReward {

	// FIELDS

	@EmbeddedId
	private UserRewardId id;

	@Column(name = "date_of_reward")
	private LocalDate dateOfReward;

	@ManyToOne
	@JoinColumn(name = "task_id")
	private Task task;

	@ManyToOne
	@JoinColumn(name = "reward_id")
	@MapsId(value = "rewardId")
	private Reward reward;

	@ManyToOne
	@JoinColumn(name = "user_id")
	@MapsId(value = "userId")
	private User user;

	// METHODS BEGIN:

	public UserReward() {
		super();
	}

	public UserReward(UserRewardId id, LocalDate dateOfReward, Task task, Reward reward, User user) {
		super();
		this.id = id;
		this.dateOfReward = dateOfReward;
		this.task = task;
		this.reward = reward;
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Reward getReward() {
		return reward;
	}

	public void setReward(Reward reward) {
		this.reward = reward;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public UserRewardId getId() {
		return id;
	}

	public void setId(UserRewardId id) {
		this.id = id;
	}

	public LocalDate getDateOfReward() {
		return dateOfReward;
	}

	public void setDateOfReward(LocalDate dateOfReward) {
		this.dateOfReward = dateOfReward;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		UserReward other = (UserReward) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserReward [id=" + id + ", dateOfReward=" + dateOfReward + ", taskId=" + task + ", reward=" + reward
				+ ", user=" + user + "]";
	}

}
