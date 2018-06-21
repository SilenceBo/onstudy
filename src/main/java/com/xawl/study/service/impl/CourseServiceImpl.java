package com.xawl.study.service.impl;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xawl.study.dao.CourseMapper;
import com.xawl.study.dao.CourseNoticeMapper;
import com.xawl.study.dao.ResourceMapper;
import com.xawl.study.dao.TeacherWorkMapper;
import com.xawl.study.model.Course;
import com.xawl.study.model.CourseCustomer;
import com.xawl.study.model.CourseNoticeExample;
import com.xawl.study.model.Major;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.CourseService;
import com.xawl.study.utils.Const;
import com.xawl.study.utils.Result;

/**
 * 课程的业务逻辑层
 * 
 * @author zb
 * 
 */
@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseMapper courseMapper;
	@Autowired
	private ResourceMapper resourceMapper;
	@Autowired
	private CourseNoticeMapper courseNoticeMapper;
	@Autowired
	TeacherWorkMapper teacherWorkMapper;

	/**
	 * 查出所有课程
	 */
	public List<CourseCustomer> findAll() {

		List<CourseCustomer> courseList = courseMapper.findAll();
		return courseList;
	}

	/**
	 * 添加课程
	 */
	public int insertCourse(Course course) {
		return courseMapper.insertSelective(course);
	}

	/**
	 * 删除课程并删除保存的图片
	 */
	public int deleteCourseBycid(String ids, HttpServletRequest request) {
		String[] checkedNums = ids.split(",");
		CourseCustomer courseCustomer = new CourseCustomer();
		String path1 = request.getSession().getServletContext()
				.getRealPath("/");

		for (int i = 0; i < checkedNums.length; i++) {
			courseCustomer.setCid(Integer.parseInt(checkedNums[i]));
			courseCustomer = courseMapper.SelectCourseByCid(courseCustomer);
			if (courseCustomer == null) {
				return 0;
			}
			File image = new File(path1 + courseCustomer.getImage());
			// System.out.println(image);
			if (image.exists()) {
				image.delete();
			}
		}

		return courseMapper.deleteCourseBycid(checkedNums);
	}

	/**
	 * 修改课程
	 */
	public int updateCourse(Course course) {
		// 修改
		courseNoticeMapper.updateCnameByCid(course);
		return courseMapper.updateByPrimaryKeySelective(course);
	}

	/*
	 * public List<CourseCustomer> SelectCourse(CourseCustomer courseCustomer,
	 * Integer page) {
	 * 
	 * List<CourseCustomer> courseList =
	 * courseMapper.SelectCourse(courseCustomer); return courseList; }
	 * 
	 * public List<CourseCustomer> SelectCourseByAll(CourseCustomer
	 * courseCustomer, Integer page) {
	 * 
	 * List<CourseCustomer> courseList =
	 * courseMapper.SelectCourseByAll(courseCustomer); return courseList; }
	 */

	/**
	 * 按照课程id查出对应课程
	 */
	public CourseCustomer SelectCourseByCid(CourseCustomer courseCustomer) {
		CourseCustomer courseList = courseMapper
				.SelectCourseByCid(courseCustomer);
		int count = resourceMapper.selectCountVedioByCid(courseCustomer
				.getCid());
		if (count != 0) {
			courseList.setCourseCount(count);
		}
		return courseList;
	}

	public CourseCustomer SelectCourseByCidTwo(CourseCustomer courseCustomer) {
		CourseCustomer courseList = courseMapper
				.SelectCourseByCid(courseCustomer);
		return courseList;
	}

	/**
	 * 按照兴趣查找课程并分页
	 */
	public PageInfo<CourseCustomer> selectCourseByiid(Integer iid, Integer page) {
		if (page == null || page <= 0) {
			page = 1;
		}
		PageHelper.startPage(page, Const.PAGE_NUMBER);
		List<CourseCustomer> courseList = courseMapper.selectCourseByiid(iid);
		PageInfo<CourseCustomer> pageInfo = new PageInfo<CourseCustomer>(
				courseList, Const.PAGE_COUNT);
		return pageInfo;
	}

	/**
	 * 按照方向查找课程并分页
	 */
	public PageInfo<CourseCustomer> selectCourseByfid(Integer fid, Integer page) {
		if (page == null || page <= 0) {
			page = 1;
		}
		PageHelper.startPage(page, Const.PAGE_NUMBER);
		List<CourseCustomer> courseList = courseMapper.selectCourseByfid(fid);
		PageInfo<CourseCustomer> pageInfo = new PageInfo<CourseCustomer>(
				courseList, Const.PAGE_COUNT);
		return pageInfo;
	}

	/**
	 * 查出所有课程并分页
	 */
	public PageInfo<CourseCustomer> findAllFront(Integer page) {
		if (page == null || page <= 0) {
			page = 1;
		}
		PageHelper.startPage(page, Const.PAGE_NUMBER);
		List<CourseCustomer> courseList = courseMapper.findAll();
		PageInfo<CourseCustomer> pageInfo = new PageInfo<CourseCustomer>(
				courseList, Const.PAGE_COUNT);
		return pageInfo;
	}

	/**
	 * 按照点赞数查找课程
	 */
	public List<Course> findByLinkNum() {
		return courseMapper.findByLinkNum();
	}

	/**
	 * 查询教师的课程
	 */
	public Result SelectCourseBytid(Integer tid) {
		try {
			List<CourseCustomer> list = courseMapper.SelectCourseBytid(tid);
			return Result.ok(list);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "查询失败");
		}

	}

	/**
	 * 按年级查课程
	 */
	public PageInfo<CourseCustomer> selectCourseBygrade(Integer grade,
			Integer page) {
		if (page == null || page <= 0) {
			page = 1;
		}
		PageHelper.startPage(page, Const.PAGE_NUMBER);
		List<CourseCustomer> courseList = courseMapper
				.selectCourseBygrade(grade);
		PageInfo<CourseCustomer> pageInfo = new PageInfo<CourseCustomer>(
				courseList, Const.PAGE_COUNT);
		return pageInfo;
	}

	public PageInfo<CourseCustomer> selectCourseBymid(Integer grade,
			Integer mid, Integer page) {
		CourseCustomer courseCustomer = new CourseCustomer();
		courseCustomer.setGrade(grade);
		courseCustomer.setMid(mid);

		if (page == null || page <= 0) {
			page = 1;
		}
		PageHelper.startPage(page, Const.PAGE_NUMBER);
		List<CourseCustomer> courseList = courseMapper
				.selectCourseBymid(courseCustomer);
		PageInfo<CourseCustomer> pageInfo = new PageInfo<CourseCustomer>(
				courseList, Const.PAGE_COUNT);
		return pageInfo;
	}

	public PageInfo<CourseCustomer> selectCourseByText(String text, Integer page) {
		CourseCustomer courseCustomer = new CourseCustomer();
		Teacher teacher = new Teacher();
		teacher.setUsername(text);
		Major major = new Major();
		major.setMname(text);

		courseCustomer.setCname(text);
		courseCustomer.setDbTeacher(teacher);
		courseCustomer.setDbMajor(major);

		if (page == null || page <= 0) {
			page = 1;
		}
		PageHelper.startPage(page, Const.PAGE_NUMBER);
		List<CourseCustomer> courseList = courseMapper
				.SelectCourseByAll(courseCustomer);
		PageInfo<CourseCustomer> pageInfo = new PageInfo<CourseCustomer>(
				courseList, Const.PAGE_COUNT);
		return pageInfo;
	}

	public void updateLinkNum(Integer cid) {
		// TODO Auto-generated method stub
		courseMapper.updateLinkNum(cid);
	}

	public void updateLinkNumDel(Integer cid) {
		// TODO Auto-generated method stub
		courseMapper.updateLinkNumDel(cid);
	}

	public void updatelogClick(Integer cid) {
		// TODO Auto-generated method stub
		courseMapper.updatelogClick(cid);
	}

	public void updateunlogClick(Integer cid) {
		// TODO Auto-generated method stub
		courseMapper.updateunlogClick(cid);
	}

	public List<CourseCustomer> findHavaResCou() {
		List<CourseCustomer> list = courseMapper.findAll();
		Iterator<CourseCustomer> iterator = list.iterator();
		while (iterator.hasNext()) {
			Integer i = resourceMapper.findResourceNumByCid(iterator.next()
					.getCid());
			if (i == 0) {
				iterator.remove();
			}
		}
		return list;
	}

	public List<CourseCustomer> findNotHavaResCou() {
		List<CourseCustomer> list = courseMapper.findAll();
		Iterator<CourseCustomer> iterator = list.iterator();
		while (iterator.hasNext()) {
			Integer i = resourceMapper.findResourceNumByCid(iterator.next()
					.getCid());
			if (i != 0) {
				iterator.remove();
			}
		}
		return list;
	}

	public List<CourseCustomer> findNotHavaVideoCou() {
		List<CourseCustomer> list = courseMapper.findAll();
		Iterator<CourseCustomer> iterator = list.iterator();
		while (iterator.hasNext()) {
			Integer i = resourceMapper.findVoideoNumByCid(iterator.next()
					.getCid());
			if (i != 0) {
				iterator.remove();
			}
		}
		return list;
	}

	public List<CourseCustomer> findHavaVideoCou() {
		List<CourseCustomer> list = courseMapper.findAll();
		Iterator<CourseCustomer> iterator = list.iterator();
		while (iterator.hasNext()) {
			Integer i = resourceMapper.findVoideoNumByCid(iterator.next()
					.getCid());
			if (i == 0) {
				iterator.remove();
			}
		}
		return list;
	}

	@Override
	public List<CourseCustomer> findHavaWorkCou() {
		List<CourseCustomer> list = courseMapper.findAll();
		Iterator<CourseCustomer> iterator = list.iterator();
		while (iterator.hasNext()) {
			Integer i = teacherWorkMapper.findCountByCid(iterator.next()
					.getCid());
			if (i == 0) {
				iterator.remove();
			}

		}
		return list;
	}

	@Override
	public List<CourseCustomer> findNotHavaWorkCou() {
		List<CourseCustomer> list = courseMapper.findAll();
		Iterator<CourseCustomer> iterator = list.iterator();
		while (iterator.hasNext()) {
			Integer i = teacherWorkMapper.findCountByCid(iterator.next()
					.getCid());
			if (i != 0) {
				iterator.remove();
			}

		}
		return list;
	}
}
