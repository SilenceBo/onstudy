package com.xawl.study.dao;

import com.xawl.study.model.Major;
import com.xawl.study.model.MajorExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MajorMapper {
    int countByExample(MajorExample example);

    int deleteByExample(MajorExample example);

    int insert(Major record);

    int insertSelective(Major record);

    List<Major> selectByExample(MajorExample example);

    int updateByExampleSelective(@Param("record") Major record, @Param("example") MajorExample example);

    int updateByExample(@Param("record") Major record, @Param("example") MajorExample example);

	List<Major> findAll();

	Major selectByPrimaryKey(Integer mid);

	int deleteByPrimaryKey(Integer mid);

	int updateByPrimaryKeySelective(Major major);
}