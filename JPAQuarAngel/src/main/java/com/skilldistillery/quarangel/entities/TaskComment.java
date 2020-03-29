package com.skilldistillery.quarangel.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "task_comment")
public class TaskComment {

	// FIELDS
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

//	@Column(name = "poster_id")
//	private int posterId;

//	@Column(name = "task_id")
//	private int taskId;

	@Column(name = "comment_text")
	private String commentText;

	@Column(name = "comment_date_posted")
	private LocalDateTime commentDatePosted;

	@ManyToOne
	@JoinColumn(name = "task_id")
	private Task task;

	@ManyToOne
	@JoinColumn(name = "poster_id")
	private User poster;

	// METHODS BEGIN:

	public TaskComment() {

	}

	public User getPoster() {
		return poster;
	}

	public void setPoster(User poster) {
		this.poster = poster;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
		TaskComment other = (TaskComment) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "TaskComment [id=" + id + ", commentText=" + commentText + ", commentDatePosted=" + commentDatePosted
				+ ", task=" + task + ", poster=" + poster + "]";
	}



}
