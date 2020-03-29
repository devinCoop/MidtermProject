package com.skilldistillery.quarangel.entities;

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
public class User {
	
	// F i e l d s 
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String username;
	
	private String password;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	private String phone;
	
	@ManyToOne
	@JoinColumn(name="address_id")
	private Address address;
	
	private Boolean enabled;
	
	private String role;
	
	private String biography;
	
	@OneToMany(mappedBy = "user")
	private List<UserReward> userReward;
	
	@OneToMany(mappedBy = "requestor")
	private List<Task> requestorTasks;
	
	@OneToMany(mappedBy = "volunteer")
	private List<Task> volunteerTasks;
	
	@OneToMany(mappedBy = "poster")
	private List<TaskComment> taskComments;
	
	// M e t h o d s
	
	
	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<UserReward> getUserReward() {
		return userReward;
	}

	public void setUserReward(List<UserReward> userReward) {
		this.userReward = userReward;
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

	public List<Task> getVolunteerTasks() {
		return volunteerTasks;
	}

	public void setVolunteerTasks(List<Task> volunteerTasks) {
		this.volunteerTasks = volunteerTasks;
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
				+ ", lastName=" + lastName + ", phone=" + phone + ", address=" + address + ", enabled=" + enabled
				+ ", role=" + role + ", biography=" + biography + ", userReward=" + userReward + ", requestorTasks=" + requestorTasks
				+ ", volunteerTasks=" + volunteerTasks + "]";
	}


	

}
