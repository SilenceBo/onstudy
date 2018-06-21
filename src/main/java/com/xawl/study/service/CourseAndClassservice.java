package com.xawl.study.service;

import java.util.List;

import com.xawl.study.model.CourseAndClass;
import com.xawl.study.model.CourseAndClassCustomer;

/**
 * 课程与班级关系service层接口
 * @author zb
 *
 */
public interface CourseAndClassservice {

	List<CourseAndClassCustomer> findByCourseId(Integer courseId);

	void insertCourseAndClasss(CourseAndClass courseAndClass);

	int deleteCourseAndClasss(String ids);

}
