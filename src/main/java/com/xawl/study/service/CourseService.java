package com.xawl.study.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.github.pagehelper.PageInfo;
import com.xawl.study.model.Course;
import com.xawl.study.model.CourseCustomer;
import com.xawl.study.utils.Result;

/**
 * 课程的service层接口
 * @author zb
 *
 */
public interface CourseService {

	List<CourseCustomer> findAll();

	int insertCourse(Course course);

	int deleteCourseBycid(String ids, HttpServletRequest request);

	int updateCourse(Course course);

	/*List<CourseCustomer> SelectCourse(CourseCustomer courseCustomer, Integer page);

	List<CourseCustomer> SelectCourseByAll(CourseCustomer courseCustomer, Integer page);*/

	CourseCustomer SelectCourseByCid(CourseCustomer courseCustomer);

	PageInfo<CourseCustomer> selectCourseByiid(Integer iid, Integer page);

	PageInfo<CourseCustomer> selectCourseByfid(Integer fid, Integer page);

	PageInfo<CourseCustomer> findAllFront(Integer page);

	List<Course> findByLinkNum();

	Result SelectCourseBytid(Integer tid);

	PageInfo<CourseCustomer> selectCourseBygrade(Integer grade, Integer page);

	PageInfo<CourseCustomer> selectCourseBymid(Integer grade, Integer mid, Integer page);

	PageInfo<CourseCustomer> selectCourseByText(String text, Integer page);

	void updateLinkNum(Integer cid);

	void updateLinkNumDel(Integer cid);

	void updatelogClick(Integer cid);

	void updateunlogClick(Integer cid);

	CourseCustomer SelectCourseByCidTwo(CourseCustomer courseCustomer);

	List<CourseCustomer> findHavaResCou();

	List<CourseCustomer> findNotHavaResCou();

	List<CourseCustomer> findNotHavaVideoCou();

	List<CourseCustomer> findHavaVideoCou();

	List<CourseCustomer> findHavaWorkCou();

	List<CourseCustomer> findNotHavaWorkCou();

}
