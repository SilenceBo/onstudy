package com.xawl.study.dao;

import java.util.List;

import com.xawl.study.model.Course;
import com.xawl.study.model.CourseCustomer;

/**
 * 课程的dao层接口
 * @author zb
 *
 */
public interface CourseMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
    
    List<CourseCustomer> findAll();

	int deleteCourseBycid(String[] ids);

	List<CourseCustomer> SelectCourse(CourseCustomer courseCustomer);

	List<CourseCustomer> SelectCourseByAll(CourseCustomer courseCustomer);

	CourseCustomer SelectCourseByCid(CourseCustomer courseCustomer);

	List<CourseCustomer> selectCourseByiid(Integer iid);

	List<CourseCustomer> selectCourseByfid(Integer fid);

	List<Course> findByLinkNum();

	List<CourseCustomer> SelectCourseBytid(Integer tid);

	List<CourseCustomer> selectCourseBygrade(Integer grade);

	List<CourseCustomer> selectCourseBymid(CourseCustomer courseCustomer);

	void updateLinkNum(Integer cid);

	void updateLinkNumDel(Integer cid);

	void updatelogClick(Integer cid);

	void updateunlogClick(Integer cid);
}