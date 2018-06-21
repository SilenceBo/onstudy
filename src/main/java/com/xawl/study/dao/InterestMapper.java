package com.xawl.study.dao;

import java.util.List;

import com.xawl.study.model.Interest;

public interface InterestMapper {
    int deleteByPrimaryKey(Integer iid);

    int insert(Interest record);

    int insertSelective(Interest record);

    Interest selectByPrimaryKey(Integer iid);

    int updateByPrimaryKeySelective(Interest record);

    int updateByPrimaryKey(Interest record);
    List<Interest> findAll();
    
}