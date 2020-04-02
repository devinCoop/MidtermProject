package com.skilldistillery.quarangel.data;

import java.util.List;

import com.skilldistillery.quarangel.entities.Notification;
import com.skilldistillery.quarangel.entities.Task;

public interface NotificationDAO {
	
	Notification findById(int id);
	List<Notification> findAll();
	boolean delete(int id);
	Notification create(Notification notification);
	Notification update(int id, Notification notification);
	List<Notification> notificationsFindByUserId(int id);
	List<Task> findAllNotificationTaskByUserId(int id);

}
