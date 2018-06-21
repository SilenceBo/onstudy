package com.xawl.study.service;

import java.util.List;

import com.xawl.study.model.Major;

public interface MajorService {

	List<Major> findAll();

	Major findBymid(Integer mid);

	int insertMajor(Major major);

	int deleteMajorBymid(Integer mid);

	int updateMajor(Major major);

}
