package com.skilldistillery.quarangel.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;

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

class TaskCommentTest {
	private EntityManager em;
	static EntityManagerFactory emf;
	private TaskComment taskComment;

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
		taskComment = em.find(TaskComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		taskComment = null;
	}

	@Test
	@DisplayName("Task Comment entity test")
	void test() {
		assertEquals(LocalDateTime.of(2020, 03, 25, 01, 00, 00), taskComment.getCommentDatePosted());
		assertEquals("Thank you for helping me young lad", taskComment.getCommentText());
	}

	@Test
	@DisplayName("Task Comment to task")
	void test1() {
		assertEquals(1, taskComment.getTask().getId());
	}

	@Test
	@DisplayName("Task Comment to user")
	void test2() {
		assertEquals("seth", taskComment.getPoster().getFirstName());
	}
}
