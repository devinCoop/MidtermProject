package com.skilldistillery.quarangel.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "task_comment")
public class TaskComment {

	// FIELDS
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "poster_id")
	private int posterId;

	@Column(name = "task_id")
	private int taskId;

	@Column(name = "comment_text")
	private String commentText;

	@Column(name = "comment_date_posted")
	private LocalDateTime commentDatePosted;

	// METHODS BEGIN:

	public TaskComment() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPosterId() {
		return posterId;
	}

	public void setPosterId(int posterId) {
		this.posterId = posterId;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

	public LocalDateTime getCommentDatePosted() {
		return commentDatePosted;
	}

	public void setCommentDatePosted(LocalDateTime commentDatePosted) {
		this.commentDatePosted = commentDatePosted;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((commentDatePosted == null) ? 0 : commentDatePosted.hashCode());
		result = prime * result + ((commentText == null) ? 0 : commentText.hashCode());
		result = prime * result + id;
		result = prime * result + posterId;
		result = prime * result + taskId;
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
		TaskComment other = (TaskComment) obj;
		if (commentDatePosted == null) {
			if (other.commentDatePosted != null)
				return false;
		} else if (!commentDatePosted.equals(other.commentDatePosted))
			return false;
		if (commentText == null) {
			if (other.commentText != null)
				return false;
		} else if (!commentText.equals(other.commentText))
			return false;
		if (id != other.id)
			return false;
		if (posterId != other.posterId)
			return false;
		if (taskId != other.taskId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "TaskComment [id=" + id + ", posterId=" + posterId + ", taskId=" + taskId + ", commentText="
				+ commentText + ", commentDatePosted=" + commentDatePosted + "]";
	}
	

}
