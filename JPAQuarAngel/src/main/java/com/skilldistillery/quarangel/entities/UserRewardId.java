package com.skilldistillery.quarangel.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class UserRewardId implements Serializable {
	private static final long serialVersionUID = 1L;
		
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "reward_id")
	private int rewardId;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRewardId() {
		return rewardId;
	}

	public void setRewardId(int rewardId) {
		this.rewardId = rewardId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public UserRewardId() {
		super();
	}

	public UserRewardId(int userId, int rewardId) {
		super();
		this.userId = userId;
		this.rewardId = rewardId;
	}

	@Override
	public String toString() {
		return "UserRewardId [userId=" + userId + ", rewardId=" + rewardId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + rewardId;
		result = prime * result + userId;
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
		UserRewardId other = (UserRewardId) obj;
		if (rewardId != other.rewardId)
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}

        // Getters/setters, ctors, toString, equals/hashCode
	
	

}
