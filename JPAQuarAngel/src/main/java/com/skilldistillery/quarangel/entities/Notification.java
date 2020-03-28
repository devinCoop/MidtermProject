package com.skilldistillery.quarangel.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Notification {

	// FIELDS
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "volunteer_userid")
	private int volunteerUserID;

	@Column(name = "task_id")
	private int taskId;

	private String message;

	@Column(name = "notification_date")
	private LocalDateTime notificationDate;

	// METHODS BEGIN:

	public Notification() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getVolunteerUserID() {
		return volunteerUserID;
	}

	public void setVolunteerUserID(int volunteerUserID) {
		this.volunteerUserID = volunteerUserID;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	

	public LocalDateTime getNotificationDate() {
		return notificationDate;
	}

	public void setNotificationDate(LocalDateTime notificationDate) {
		this.notificationDate = notificationDate;
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
		Notification other = (Notification) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Notification [id=" + id + ", volunteerUserID=" + volunteerUserID + ", taskId=" + taskId + ", message="
				+ message + ", notificationDate=" + notificationDate + "]";
	}

}
