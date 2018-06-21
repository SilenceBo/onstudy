package com.xawl.study.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.xawl.study.model.Fangxiang;

public interface FangxiangService {

	Fangxiang findByfid(Integer fid);

	int insertFangxiang(Fangxiang fangxiang);

	int deleteFangxiang(String fids, HttpServletRequest request);

	int updateFangxiang(Fangxiang fangxiang);

	List<Fangxiang> selectFangxiangByiid(Integer iid);

	boolean deleteFangxiangByfid(Integer fid);

	List<Fangxiang> findAll();

}
