package com.xawl.study.dao;

import java.util.List;

import com.xawl.study.model.CourseAndClass;
import com.xawl.study.model.TeacherAndClass;
import com.xawl.study.model.Teaching;

public interface TeacherAndClassMapper {
	
  
	List<Teaching> findByTeacherId(Integer tid);

	void deleteTeacherAndClasss(String[] checkedNums);

	Object selectByTeacherAndClass(TeacherAndClass teacherAndClass);

	void insertTeacherAndClasss(TeacherAndClass teacherAndClass);

	TeacherAndClass selectByPrimaryKey(int parseInt);

}