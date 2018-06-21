package com.xawl.study.dao;

import java.util.List;

import com.xawl.study.model.ClassName;
import com.xawl.study.model.Student;

public interface ClassNameMapper {
    int deleteClassNameByclassId(Integer classId);
   
    int updateByPrimaryKeySelective(ClassName record);

    //int updateByPrimaryKey(ClassName record);

	List<ClassName> findAll();

	ClassName selectByclassId(Integer classId);

	//int insertClassName(ClassName classname);

	int insertSelective(ClassName classname);
	
	int countsALL(int classId);

	List<ClassName> selectByName(String classname);

	ClassName selectByTeacherclassId(Integer tid);

	

	
}