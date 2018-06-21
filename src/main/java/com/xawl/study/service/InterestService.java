package com.xawl.study.service;

import java.util.List;

import com.xawl.study.model.Interest;

public interface InterestService {

	Interest get(int i);

	List<Interest> findAll();

	int insertInterest(Interest interest);

	int deleteInterestByiid(Integer iid);

	int updateInterest(Interest interest);

	Interest findByIid(Integer iid);

	

	

}
