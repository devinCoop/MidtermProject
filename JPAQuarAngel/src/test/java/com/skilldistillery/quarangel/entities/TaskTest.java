package com.skilldistillery.quarangel.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDateTime;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class TaskTest {
	private EntityManager em;
	static EntityManagerFactory emf;
	private Task task;

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
		task = em.find(Task.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		task = null;
	}

	@Test
	@DisplayName("Task entity test")
	void test() {
		assertEquals("help me cross the road", task.getDescription());
		assertEquals("Please hurry", task.getRequestorComment());
		assertEquals("No problem i am on my way", task.getVolunteerComment());
		assertEquals(LocalDateTime.of(2020, 03, 15, 01, 00, 00), task.getDateCreated());
		assertEquals(LocalDateTime.of(2020, 03, 18, 01, 00, 00), task.getDateDeadline());
		assertEquals(LocalDateTime.of(2020, 03, 16, 01, 00, 00), task.getDateCompleted());

	}

	@Test
	@DisplayName("Task to Category @MTO test")
	void test2() {
		assertEquals("House chore", task.getCategory().getName());

	}

	@Test
	@DisplayName("Task to User @MTO test")
	void test3() {
		assertEquals("seth", task.getRequestor().getFirstName());
		assertEquals("bob", task.getVolunteer().getFirstName());

	}

	@Test
	@DisplayName("Task to UserReward @MTO test")
	void test4() {
		assertTrue(task.getUserRewards().size() > 0);

	}

	@Test
	@DisplayName("Task to Notification @MTO test")
	void test5() {
		assertTrue(task.getNotifications().size() > 0);

	}

	@Test
	@DisplayName("Task to TaskComment @MTO test")
	void test6() {
		assertTrue(task.getTaskComments().size() > 0);

	}
}
