package com.skilldistillery.quarangel.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class UserTest {
	private EntityManager em;
	static EntityManagerFactory emf;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	@DisplayName("user test")
	void test() {
		assertEquals("seths", user.getUsername());
	}
  
	@Test
	@DisplayName("testing user Many To One mappings to address")
	void test1() {
		Address address = user.getAddressId();
		assertEquals("123 test st", address.getStreet());
	}
  
  	@Test
	@DisplayName("User mappings to task")
	void test2() {
		assertTrue(user.getRequestorTasks().size() > 0);
		assertTrue(user.getVolunteerTasks().size() > 0);
	}
	
	

}
