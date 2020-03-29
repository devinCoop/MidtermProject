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

class NotificationTest {
	private EntityManager em;
	static EntityManagerFactory emf;
	private Notification notification;

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
		notification = em.find(Notification.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		notification = null;
	}

	@Test
	@DisplayName("Notification entity test")
	void test() {
		assertEquals("Thanks for helping me", notification.getMessage());
		assertEquals(LocalDateTime.of(2020, 03, 28, 01, 00, 00), notification.getNotificationDate());
	}
  
  @Test
	@DisplayName("Notification mappings to task")
	void test1() {
		assertEquals(1, notification.getTask().getId());
		
	}
  
   @Test
	@DisplayName("Notification testing to user")
	void test2() {
		assertEquals(1, notification.getVolunteerUser().getId());
	}
}
