package com.xawl.study.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.FangxiangMapper;
import com.xawl.study.dao.InterestMapper;
import com.xawl.study.model.Fangxiang;
import com.xawl.study.model.Interest;
import com.xawl.study.service.InterestService;

@Service
public class InterestServiceImpl implements InterestService {
	

    @Autowired
	private InterestMapper interestMapper;
    @Autowired
    private FangxiangMapper fangxiangMapper;
	public Interest get(int i) {
		return interestMapper.selectByPrimaryKey(i);
	}
	public List<Interest> findAll() {
		List<Interest> iList = interestMapper.findAll();
		return iList;
	}
	
	public Interest findByIid(Integer iid) {
		
		return interestMapper.selectByPrimaryKey(iid);
	}
		
	public int insertInterest(Interest interest) {
		return interestMapper.insertSelective(interest);
	}
	
	
	public int deleteInterestByiid(Integer iid) {
	/*fangxiangMapper.deleteFangxiangByiid(iid);*/
		
		List<Fangxiang> flist=fangxiangMapper.selectFangxiangByiid(iid);
		for(Fangxiang fangxiang:flist){
			if(fangxiang.getFid() != 0){
			fangxiangMapper.deleteFangxiangByfid(fangxiang.getFid());
			}
		}
		return interestMapper.deleteByPrimaryKey(iid);
	}
	
	
	public int updateInterest(Interest interest) {
		
		return interestMapper.updateByPrimaryKeySelective(interest);
	}
	
}
