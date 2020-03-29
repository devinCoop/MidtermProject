package com.skilldistillery.quarangel.data;

import java.util.List;

import com.skilldistillery.quarangel.entities.Notification;

public interface NotificationDAO {
	
	Notification findById(int id);
	List<Notification> findAll();
	boolean delete(int id);
	Notification create(Notification notification);
	Notification update(int id, Notification notification);

}
