package com.skilldistillery.quarangel.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class CategoryTest {
	private EntityManager em;
	static EntityManagerFactory emf;
	private Category category;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("QuarAngelPU");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		category = em.find(Category.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		category = null;
	}

	@Test
	@DisplayName("Category test")
	void test() {
		assertEquals("House chore", category.getName());
	}
	
	@Test
	@DisplayName("Category mappings test to task")
	void test1() {
		assertTrue(category.getTasks().size() > 0);
		assertEquals("Please hurry", category.getTasks().get(0).getRequestorComment());
	}
	
	@Test
	@DisplayName("Category mappings test to User")
	void test2() {
	assertEquals("1234567891", category.getUsers().get(0).getPhone());
	assertTrue(category.getUsers().size() > 0);
	}

}
