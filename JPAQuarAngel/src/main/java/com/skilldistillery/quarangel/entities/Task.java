package com.skilldistillery.quarangel.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Task {

	// FIELDS
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String description;

	@Column(name = "date_created")
	private LocalDateTime dateCreated;

	@Column(name = "date_deadline")
	private LocalDateTime dateDeadline;

	@Column(name = "date_completed")
	private LocalDateTime dateCompleted;

	@Column(name = "requestor_comment")
	private String requestorComment;

	@Column(name = "volunteer_comment")
	private String volunteerComment;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;

	@OneToMany(mappedBy = "task")
	private List<UserReward> userRewards;

	@ManyToOne
	@JoinColumn(name = "requestor_userid")
	private User requestor;

	@ManyToOne
	@JoinColumn(name = "volunteer_userid")
	private User volunteer;

	@OneToMany(mappedBy = "task")
	private List<Notification> notifications;

	@OneToMany(mappedBy = "task")
	private List<TaskComment> taskComments;

	// METHODS BEGIN:

	public Task() {

	}

	public void addUserReward(UserReward userReward) {
		if (userRewards == null) {
			userRewards = new ArrayList<>();
		}
		if (!userRewards.contains(userReward)) {
			userRewards.add(userReward);
		}
	}

	public void removeUserReward(UserReward userReward) {
		if (userRewards != null && userRewards.contains(userReward)) {
			userRewards.remove(userReward);
		}
	}

	public void addNotifications(Notification notification) {
		if (notifications == null) {
			notifications = new ArrayList<>();
		}
		if (!notifications.contains(notification)) {
			notifications.add(notification);
		}
	}

	public void removeNotifications(Notification notification) {
		if (notifications != null && notifications.contains(notification)) {
			notifications.remove(notification);
		}
	}

	public void addTaskComment(TaskComment tc) {
		if (taskComments == null) {
			taskComments = new ArrayList<>();
		}
		if (!taskComments.contains(tc)) {
			taskComments.add(tc);
		}
	}

	public void removeTaskComment(TaskComment tc) {
		if (taskComments != null && taskComments.contains(tc)) {
			taskComments.remove(tc);
		}
	}

	public int getId() {
		return id;
	}

	public List<TaskComment> getTaskComments() {
		return taskComments;
	}

	public void setTaskComments(List<TaskComment> taskComments) {
		this.taskComments = taskComments;
	}

	public List<Notification> getNotifications() {
		return notifications;
	}

	public void setNotifications(List<Notification> notifications) {
		this.notifications = notifications;
	}

	public List<UserReward> getUserRewards() {
		return userRewards;
	}

	public void setUserRewards(List<UserReward> userRewards) {
		this.userRewards = userRewards;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getRequestor() {
		return requestor;
	}

	public void setRequestor(User requestor) {
		this.requestor = requestor;
	}

	public User getVolunteer() {
		return volunteer;
	}

	public void setVolunteer(User volunteer) {
		this.volunteer = volunteer;
	}


	public LocalDateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

	public LocalDateTime getDateDeadline() {
		return dateDeadline;
	}

	public void setDateDeadline(LocalDateTime dateDeadline) {
		this.dateDeadline = dateDeadline;
	}

	public LocalDateTime getDateCompleted() {
		return dateCompleted;
	}

	public void setDateCompleted(LocalDateTime dateCompleted) {
		this.dateCompleted = dateCompleted;
	}

	public String getRequestorComment() {
		return requestorComment;
	}

	public void setRequestorComment(String requestorComment) {
		this.requestorComment = requestorComment;
	}

	public String getVolunteerComment() {
		return volunteerComment;
	}

	public void setVolunteerComment(String volunteerComment) {
		this.volunteerComment = volunteerComment;
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
		Task other = (Task) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Task [id=" + id + ", description=" + description + ", dateCreated=" + dateCreated + ", dateDeadline="
				+ dateDeadline + ", dateCompleted=" + dateCompleted + ", requestorComment=" + requestorComment
				+ ", volunteerComment=" + volunteerComment + ", category=" + category + ", userRewards=" + userRewards
				+ ", requestor=" + requestor + ", volunteer=" + volunteer + "]";
	}

}