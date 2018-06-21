package com.xawl.study.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.FangxiangMapper;
import com.xawl.study.model.Fangxiang;
import com.xawl.study.model.Interest;
import com.xawl.study.service.FangxiangService;

@Service
public class FangxiangServiceImpl implements FangxiangService {

	@Autowired
	private FangxiangMapper fangxiangMapper;
	
	public List<Fangxiang> findAll() {
		List<Fangxiang> fList = fangxiangMapper.findAll();
		return fList;
	}

	public Fangxiang findByfid(Integer fid) {
		return  fangxiangMapper.selectByPrimaryKey(fid);
	}

	public int insertFangxiang(Fangxiang fangxiang) {

		return fangxiangMapper.insertSelective(fangxiang);
	}

	public int deleteFangxiang(String fids, HttpServletRequest request) {
		String[] checkedNums = fids.split(",");
		return fangxiangMapper.deleteByPrimaryKey(checkedNums);
	}

	public boolean deleteFangxiangByfid(Integer fid) {
		try {
			fangxiangMapper.deleteFangxiangByfid(fid);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public int updateFangxiang(Fangxiang fangxiang) {

		return fangxiangMapper.updateByPrimaryKeySelective(fangxiang);
	}

	public List<Fangxiang> selectFangxiangByiid(Integer iid) {
		List<Fangxiang> fxList = fangxiangMapper.selectFangxiangByiid(iid);
		return fxList;
	}

}
