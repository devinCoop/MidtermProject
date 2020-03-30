package com.skilldistillery.quarangel.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class User {

	// F i e l d s

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String username;

	private String password;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	private String phone;

	private String email;

	@ManyToOne
	@JoinColumn(name = "address_id")
	private Address address;

	private Boolean enabled;

	private String role;

	private String biography;

	@OneToMany(mappedBy = "user")
	private List<UserReward> userRewards;

	@OneToMany(mappedBy = "requestor")
	private List<Task> requestorTasks;

	@OneToMany(mappedBy = "volunteer")
	private List<Task> volunteerTasks;

	@OneToMany(mappedBy = "poster")
	private List<TaskComment> taskComments;

	@OneToMany(mappedBy = "sendingUser")
	private List<Notification> senderNotifications;

	@OneToMany(mappedBy = "receivingUser")
	private List<Notification> receiverNotifications;

	@ManyToMany
	@JoinTable(name = "user_has_category", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
	private List<Category> categories;

	// M e t h o d s

	public void addTaskComment(TaskComment taskComment) {
		if (taskComments == null) {
			taskComments = new ArrayList<>();
		}

		if (!taskComments.contains(taskComment)) {
			taskComments.add(taskComment);
		}
	}

	public User(int id, String username, String password, String firstName, String lastName, String phone, String email,
			Address address, Boolean enabled, String role, String biography, List<UserReward> userRewards,
			List<Task> requestorTasks, List<Task> volunteerTasks, List<TaskComment> taskComments,
			List<Notification> senderNotifications, List<Notification> receiverNotifications,
			List<Category> categories) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.enabled = enabled;
		this.role = role;
		this.biography = biography;
		this.userRewards = userRewards;
		this.requestorTasks = requestorTasks;
		this.volunteerTasks = volunteerTasks;
		this.taskComments = taskComments;
		this.senderNotifications = senderNotifications;
		this.receiverNotifications = receiverNotifications;
		this.categories = categories;
	}

	public void removeTaskComment(TaskComment taskComment) {
		if (taskComments != null && taskComments.contains(taskComment)) {
			taskComments.remove(taskComment);
		}
	}

	public void addSenderNotification(Notification notification) {
		if (senderNotifications == null) {
			senderNotifications = new ArrayList<>();
		}

		if (!senderNotifications.contains(notification)) {
			senderNotifications.add(notification);
		}
	}

	public void removeSenderNotification(Notification notification) {
		if (senderNotifications != null && senderNotifications.contains(notification)) {
			senderNotifications.remove(notification);
		}
	}

	public void addReceiverNotification(Notification notification) {
		if (receiverNotifications == null) {
			receiverNotifications = new ArrayList<>();
		}

		if (!receiverNotifications.contains(notification)) {
			receiverNotifications.add(notification);
		}
	}

	public void removeReceiverNotification(Notification notification) {
		if (receiverNotifications != null && receiverNotifications.contains(notification)) {
			receiverNotifications.remove(notification);
		}
	}

	public void addCategory(Category category) {
		if (categories == null) {
			categories = new ArrayList<>();
		}

		if (!categories.contains(category)) {
			categories.add(category);
			category.addUser(this);
		}
	}

	public void removeCategory(Category category) {
		if (categories != null && categories.contains(category)) {
			categories.remove(category);
			category.removeUser(this);
		}
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Notification> getSenderNotifications() {
		return senderNotifications;
	}

	public void setSenderNotifications(List<Notification> senderNotifications) {
		this.senderNotifications = senderNotifications;
	}

	public List<Notification> getReceiverNotifications() {
		return receiverNotifications;
	}

	public void setReceiverNotifications(List<Notification> receiverNotifications) {
		this.receiverNotifications = receiverNotifications;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<UserReward> getUserReward() {
		return userRewards;
	}

	public void setUserReward(List<UserReward> userRewards) {
		this.userRewards = userRewards;
	}

	public void addUserReward(UserReward userReward) {
		if (userRewards == null) {
			userRewards = new ArrayList<UserReward>();
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

	public User() {
		super();
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

	public List<Task> getRequestorTasks() {
		return requestorTasks;
	}

	public void setRequestorTasks(List<Task> requestorTasks) {
		this.requestorTasks = requestorTasks;
	}

	public void addRequestorTask(Task requestorTask) {
		if (requestorTasks == null) {
			requestorTasks = new ArrayList<Task>();
		}
		if (!requestorTasks.contains(requestorTask)) {
			requestorTasks.add(requestorTask);

		}
	}

	public void removeRequestorTask(Task requestorTask) {
		if (requestorTasks != null && requestorTasks.contains(requestorTask)) {
			requestorTasks.remove(requestorTask);

		}
	}

	public List<Task> getVolunteerTasks() {
		return volunteerTasks;
	}

	public void setVolunteerTasks(List<Task> volunteerTasks) {
		this.volunteerTasks = volunteerTasks;
	}

	public void addVolunteerTask(Task volunteerTask) {
		if (volunteerTasks == null) {
			volunteerTasks = new ArrayList<Task>();
		}
		if (!volunteerTasks.contains(volunteerTask)) {
			volunteerTasks.add(volunteerTask);

		}
	}

	public void removeVolunteerTask(Task volunteerTask) {
		if (volunteerTasks != null && volunteerTasks.contains(volunteerTask)) {
			volunteerTasks.remove(volunteerTask);

		}
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Address getAddressId() {
		return address;
	}

	public void setAddressId(Address address) {
		this.address = address;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getBiography() {
		return biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
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
		User other = (User) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", phone=" + phone + ", email=" + email + ", address=" + address
				+ ", enabled=" + enabled + ", role=" + role + ", biography=" + biography + "]";
	}

}
