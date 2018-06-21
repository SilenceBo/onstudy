package com.xawl.study.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xawl.study.dao.ClassNameMapper;
import com.xawl.study.dao.CourseClickLogsMapper;
import com.xawl.study.dao.StudentMapper;
import com.xawl.study.model.ClassName;
import com.xawl.study.model.CourseClickLogs;
import com.xawl.study.model.QuestionCustomer;
import com.xawl.study.model.Student;
import com.xawl.study.service.CourseLogsService;
import com.xawl.study.utils.Const;

@Service
public class CourseLogsServiceImpl implements CourseLogsService{
	
	@Autowired
	private CourseClickLogsMapper clickLogsMapper;
	@Autowired
	private StudentMapper studentMapper;
	@Autowired
	private ClassNameMapper classNameMapper;
	
	public CourseClickLogs findBycid(Integer cid, Integer sid) {
		// TODO Auto-generated method stub
		CourseClickLogs clickLogs = new CourseClickLogs();
		clickLogs.setCid(cid);
		clickLogs.setSid(sid);
		return clickLogsMapper.findBycid(clickLogs);
	}

	public void updateClickCount(Integer id) {
		// TODO Auto-generated method stub
		clickLogsMapper.updateClickCount(id);
	}

	public void updateCourseLogs(CourseClickLogs clickLog) {
		// TODO Auto-generated method stub
		clickLogsMapper.updateByPrimaryKeySelective(clickLog);
	}

	public void insertCourseLogs(CourseClickLogs clickLog) {
		// TODO Auto-generated method stub
		clickLogsMapper.insertSelective(clickLog);
	}

	public void updateSnameBysid(Student student) {
		clickLogsMapper.updateSnameBysid(student);
	}

	public PageInfo<CourseClickLogs> findAll(Integer page, Integer courseId) {
		if (page == null || page<=0) {
			page = 1;
		}
		PageHelper.startPage(page, Const.PAGE_QUESTIONPEOPLE);
		List<CourseClickLogs> list = clickLogsMapper.findAll(courseId);
		
		for(CourseClickLogs clickLogs: list){
			Student student = studentMapper.selectByPrimaryKey(String.valueOf(clickLogs.getSid()));
			if(student != null){
				ClassName className = classNameMapper.selectByclassId(student.getClassId());
				if(className != null){
					clickLogs.setClassName(className.getName());
				}
			}
		}
		return new PageInfo<CourseClickLogs>(list, Const.PAGE_COUNT);
	}

}
