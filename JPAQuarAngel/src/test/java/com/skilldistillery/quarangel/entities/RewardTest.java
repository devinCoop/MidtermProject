package com.skilldistillery.quarangel.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class RewardTest {
	private EntityManager em;
	static EntityManagerFactory emf;
	private Reward reward;

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
		reward = em.find(Reward.class, 2);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		reward = null;
	}

	@Test
	@DisplayName("reward entity test")
	void test() {
		assertEquals(10, reward.getNumOfTasksCompleted());
		//fail("Not yet implemented");
	}

}
