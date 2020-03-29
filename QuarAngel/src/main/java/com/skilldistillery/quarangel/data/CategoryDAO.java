package com.skilldistillery.quarangel.data;

import java.util.List;

import com.skilldistillery.quarangel.entities.Category;

public interface CategoryDAO {
	
	Category findById(int id);
	List<Category> findAll();
	boolean delete(int id);
	Category create(Category category);
	Category update(int id, Category category);

}
