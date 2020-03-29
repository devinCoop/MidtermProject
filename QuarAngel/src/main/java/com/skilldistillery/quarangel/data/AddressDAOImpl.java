package com.skilldistillery.quarangel.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.quarangel.entities.Address;

@Service
@Transactional
public class AddressDAOImpl implements AddressDAO {
	
	@PersistenceContext
	EntityManager em;
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("QuarAngelPU");


	@Override
	public Address findById(int id) {
		return em.find(Address.class, id);
	}

	@Override
	public List<Address> findAll() {
		String jpql = "SELECT address FROM Address address";
		return em.createQuery(jpql, Address.class).getResultList();
	}

	@Override
	public boolean delete(int id) {
		EntityManager em = emf.createEntityManager();
		Address address = em.find(Address.class, id);
		if (address == null) {
			return false;
		}
		em.getTransaction().begin();

		em.remove(address); // performs the delete on the managed entity
		em.flush();

		em.getTransaction().commit();

		boolean removedWorked = !em.contains(address);

		em.close();
		return removedWorked;
	}

	@Override
	public Address create(Address address) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();

		// write the notification to the database
		em.persist(address);
		// update the "local" notification object
		em.flush();
		em.getTransaction().commit();

		em.close();

		// return the notification object
		return address;
	}

	@Override
	public Address update(int id, Address address) {
		EntityManager em = emf.createEntityManager();
		Address managed = em.find(Address.class, id);
		em.getTransaction().begin();

		managed.setCity(address.getCity());
		managed.setState(address.getState());
		managed.setStreet(address.getStreet());
		managed.setZipCode(address.getZipCode());

		em.flush();
		em.getTransaction().commit();

		// open a transaction
		em.close();

		return managed;
	}

}
