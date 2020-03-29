package com.skilldistillery.quarangel.data;

import java.util.List;

import com.skilldistillery.quarangel.entities.User;

public interface UserDAO {

	User create(User user);

	User findById(int id);

	List<User> findAll();

	User updateUser(int id, User user);

	boolean destroyUser(int id);

}
