package com.skilldistillery.quarangel.data;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.quarangel.entities.Category;
import com.skilldistillery.quarangel.entities.User;

public class CategoryDAOImpl implements CategoryDAO {
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("QuarAngelPU");

	

}
