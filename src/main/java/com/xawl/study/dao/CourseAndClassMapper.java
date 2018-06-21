package com.xawl.study.dao;

import java.util.List;

import com.xawl.study.model.CourseAndClass;
import com.xawl.study.model.CourseAndClassCustomer;

/**
 * 课程与班级关系的dao层接口
 * @author zb
 *
 */
public interface CourseAndClassMapper {

	List<CourseAndClassCustomer> findByCourseId(Integer courseId);

	void insertCourseAndClasss(CourseAndClass courseAndClass);

	Object selectByCourseAndClass(CourseAndClass courseAndClass);

	CourseAndClass selectByPrimaryKey(int parseInt);

	void deleteCourseAndClasss(String[] checkedNums);

}
