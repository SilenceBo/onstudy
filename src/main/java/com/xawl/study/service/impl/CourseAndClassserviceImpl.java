package com.xawl.study.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.ClassNameMapper;
import com.xawl.study.dao.CourseAndClassMapper;
import com.xawl.study.model.ClassName;
import com.xawl.study.model.CourseAndClass;
import com.xawl.study.model.CourseAndClassCustomer;
import com.xawl.study.service.CourseAndClassservice;

/**
 * 课程与班级关系业务逻辑层
 * @author zb
 *
 */
@Service
public class CourseAndClassserviceImpl implements CourseAndClassservice{
	
	@Autowired
	private CourseAndClassMapper courseAndClassMapper;
	
	@Autowired 
	private ClassNameMapper classNameMapper;
	
	/**
	 * 按照课程id查找对应班级
	 */
	public List<CourseAndClassCustomer> findByCourseId(Integer courseId) {
		List<CourseAndClassCustomer> courseAndClassCustomerList = courseAndClassMapper.findByCourseId(courseId);
		for(CourseAndClassCustomer customer:courseAndClassCustomerList){
			ClassName className = classNameMapper.selectByclassId(customer.getClassId());
			customer.setDbClassName(className);
		}
		return courseAndClassCustomerList;
	}
	
	/**
	 * 添加课程与班级关系
	 */
	public void insertCourseAndClasss(CourseAndClass courseAndClass) {
		// TODO Auto-generated method stub
		if(courseAndClassMapper.selectByCourseAndClass(courseAndClass) == null){
			courseAndClassMapper.insertCourseAndClasss(courseAndClass);
		}
	}
	
	/**
	 * 删除课程与班级关系
	 */
	public int deleteCourseAndClasss(String ids) {
		String [] checkedNums = ids.split(",");
		int courseId = courseAndClassMapper.selectByPrimaryKey(Integer.parseInt(checkedNums[0])).getCourseId();
		courseAndClassMapper.deleteCourseAndClasss(checkedNums);
		return courseId;
	}

}
