package com.skilldistillery.quarangel.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Task {

	// FIELDS
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String description;

	@Column(name = "requestor_userid")
	private int requestorUserId;

	@Column(name = "volunteer_userid")
	private int volunteerUserId;

	@Column(name = "category_id")
	private int categoryId;

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

	// METHODS BEGIN:

	public Task() {

	}

	public int getId() {
		return id;
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

	public int getRequestorUserId() {
		return requestorUserId;
	}

	public void setRequestorUserId(int requestorUserId) {
		this.requestorUserId = requestorUserId;
	}

	public int getVolunteerUserId() {
		return volunteerUserId;
	}

	public void setVolunteerUserId(int volunteerUserId) {
		this.volunteerUserId = volunteerUserId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
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
		return "Task [id=" + id + ", description=" + description + ", requestorUserId=" + requestorUserId
				+ ", volunteerUserId=" + volunteerUserId + ", categoryId=" + categoryId + ", dateCreated=" + dateCreated
				+ ", dateDeadline=" + dateDeadline + ", dateCompleted=" + dateCompleted + ", requestorComment="
				+ requestorComment + ", volunteerComment=" + volunteerComment + "]";
	}

}