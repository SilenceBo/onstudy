package com.xawl.study.service;

import java.util.List;

import com.xawl.study.model.ClassName;

public interface ClassNameService {
	//查询总记录数
	int countsALL(int classId);

	List<ClassName> findAll();

	ClassName selectByclassId(Integer classId);

	//int updateByPrimaryKey(ClassName classname);	

	//int insertClassName(ClassName classname);

	boolean deleteClassNameByclassId(Integer classId);

	int insertSelective(ClassName classname);

	int updateByPrimaryKeySelective(ClassName classname);

	List<ClassName> selectByName(String classname);

	

    
}

