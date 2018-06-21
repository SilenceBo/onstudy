package com.xawl.study.dao;

import java.util.List;

import com.xawl.study.model.Course;
import com.xawl.study.model.CourseAndClass;
import com.xawl.study.model.CourseAndTeacher;

public interface StudentInformationMapper {
	List<CourseAndTeacher> selectMyCourseByClassId(Integer classId);

}
