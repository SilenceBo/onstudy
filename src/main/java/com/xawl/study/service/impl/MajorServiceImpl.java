package com.xawl.study.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.MajorMapper;
import com.xawl.study.model.Major;
import com.xawl.study.service.MajorService;

@Service
public class MajorServiceImpl implements MajorService{
	
	@Autowired
	private MajorMapper majorMapper;

	
	public List<Major> findAll() {
		List<Major> mList = majorMapper.findAll();
		return mList;
	}
	
	public Major findBymid(Integer mid) {
		
		return majorMapper.selectByPrimaryKey(mid);
	}
		
	public int insertMajor(Major major) {
		
		return majorMapper.insertSelective(major);
	}
	
	
	public int deleteMajorBymid(Integer mid) {
		
		return majorMapper.deleteByPrimaryKey(mid);
	}
	
	
	public int updateMajor(Major major) {
		
		return majorMapper.updateByPrimaryKeySelective(major);
	}
}
