package com.skilldistillery.quarangel.data;

import java.util.List;

import com.skilldistillery.quarangel.entities.Address;

public interface AddressDAO {
	
	Address findById(int id);
	List<Address> findAll();
	boolean delete(int id);
	Address create(Address address);
	Address update(int id, Address address);

}
