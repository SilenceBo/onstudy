package com.xawl.study.dao;

import java.util.List;

import com.xawl.study.model.Fangxiang;

public interface FangxiangMapper {
	
    int deleteByPrimaryKey(String[] fids);

    int insert(Fangxiang record);

    int insertSelective(Fangxiang record);

    Fangxiang selectByPrimaryKey(Integer fid);

    int updateByPrimaryKeySelective(Fangxiang record);

    int updateByPrimaryKey(Fangxiang record);
    
    List<Fangxiang> findAll();
    
    List<Fangxiang> selectFangxiangByiid(Integer iid);

	int deleteFangxiangByfid(Integer fid);
}