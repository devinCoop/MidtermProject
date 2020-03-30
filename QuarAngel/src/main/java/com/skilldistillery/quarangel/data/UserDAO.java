package com.skilldistillery.quarangel.data;

import java.util.List;

import com.skilldistillery.quarangel.entities.Address;
import com.skilldistillery.quarangel.entities.User;

public interface UserDAO {

	User create(User user, Address address);

	User findById(int id);

	List<User> findAll();

	User updateUser(int id, User user, Address address);

	boolean destroyUser(int id);
	
	User findByUsernameAndPassword (String username, String password);

}
