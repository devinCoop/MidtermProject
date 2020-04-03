package com.skilldistillery.quarangel.data;

import java.util.List;

import com.skilldistillery.quarangel.entities.Reward;

public interface RewardDAO {

	Reward findById(int id);

	List<Reward> findAll();

	boolean delete(int id);

	Reward create(Reward reward);

	Reward update(int id, Reward reward);


}
