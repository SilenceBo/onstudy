package com.xawl.study.dao;

import java.util.List;
import java.util.Map;

import com.xawl.study.model.Resource;
import com.xawl.study.model.Teacher;

public interface TeacherMapper {
	// 删除单条记录
	int deleteByPrimaryKey(Integer tid);

	// 批量删除多条记录
	int deleteByIds(String[] sids);

	int insert(Teacher record);

	int insertSelective(Teacher record);

	Teacher selectByPrimaryKey(Integer tid);

	int updateByPrimaryKeySelective(Teacher record);

	int updateByPrimaryKey(Teacher record);

	List<Teacher> findAll();

	void updateByPrimaryKey(Integer tid);

	void updateByPrimaryKeySelective(Integer tid);

	Teacher loginTeacher(String account);

	int RepwdByPrimaryKey(Map map);

	void addloginNum(String tid);
}