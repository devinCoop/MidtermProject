package com.skilldistillery.quarangel.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.time.LocalDate;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class UserRewardTest {
	private EntityManager em;
	static EntityManagerFactory emf;
	private UserReward userReward;

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
		userReward = em.find(UserReward.class, new UserRewardId(1,1));
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		userReward = null;
	}

	@Test
	@DisplayName("user reward entity test")
	void test() {
		assertEquals(LocalDate.of(2020, 03, 10), userReward.getDateOfReward());
		assertEquals("help me cross the road", userReward.getTask().getDescription());
	}
	
	@Test
	@DisplayName("User Reward Entity @MTO to Reward Entity test")
	void test2() {
		assertNotNull(userReward.getReward());
		assertEquals("Beginner volunteer", userReward.getReward().getRewardLevel());
	}

}
