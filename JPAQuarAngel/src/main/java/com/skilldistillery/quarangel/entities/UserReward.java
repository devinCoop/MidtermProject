package com.skilldistillery.quarangel.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "user_reward")
public class UserReward {
	
	@EmbeddedId
	private UserRewardId id;
	
	@Column(name = "date_of_reward")
	private LocalDate dateOfReward;
	
	@Column(name = "task_id")
	private int taskId;
	
	
	public UserReward() {
		super();
	}


	public UserReward(UserRewardId id, LocalDate dateOfReward, int taskId) {
		super();
		this.id = id;
		this.dateOfReward = dateOfReward;
		this.taskId = taskId;
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


	public int getTaskId() {
		return taskId;
	}


	public void setTaskId(int taskId) {
		this.taskId = taskId;
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
		return "UserReward [id=" + id + ", dateOfReward=" + dateOfReward + ", taskId=" + taskId + "]";
	}









	
	
	

}
