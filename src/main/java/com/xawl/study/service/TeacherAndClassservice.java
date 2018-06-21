package com.xawl.study.service;

import java.util.List;

import com.xawl.study.model.TeacherAndClass;
import com.xawl.study.model.Teaching;

public interface TeacherAndClassservice {
	

     List<Teaching> findByTeacherId(Integer tid);

	 void insertTeacherAndClass(TeacherAndClass teacherAndClass);
 
	 int deleteTeacherAndClass(String ids);

}
