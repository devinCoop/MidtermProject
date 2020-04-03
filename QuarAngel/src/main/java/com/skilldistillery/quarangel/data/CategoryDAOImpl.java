package com.skilldistillery.quarangel.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.quarangel.entities.Category;

@Service
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

	@PersistenceContext
	EntityManager em;
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("QuarAngelPU");

	@Override
	public Category findById(int id) {
		return em.find(Category.class, id);
	}

	@Override
	public List<Category> findAll() {
		String jpql = "SELECT c FROM Category c";
		List<Category> categories = em.createQuery(jpql, Category.class).getResultList();
		return categories;
	}


	@Override
	public Category create(Category category) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();

		em.persist(category);
		em.flush();
		em.getTransaction().commit();
		em.close();
		return category;
	}

	@Override
	public Category update(int id, Category category) {
		EntityManager em = emf.createEntityManager();
		Category categoryToBeChangedInDb = em.find(Category.class, id);
		em.getTransaction().begin();

		categoryToBeChangedInDb.setName(category.getName());
		categoryToBeChangedInDb.setDescription(category.getDescription());

		em.flush();
		em.getTransaction().commit();
		em.close();
		return categoryToBeChangedInDb;
	}

	@Override
	public boolean delete(int id) {
		EntityManager em = emf.createEntityManager();
		Category category = em.find(Category.class, id);

		em.getTransaction().begin();
		em.remove(category);

		em.flush();
		em.getTransaction().commit();
		boolean rmCategory = !em.contains(category);
		em.close();
		return rmCategory;
	}
}
