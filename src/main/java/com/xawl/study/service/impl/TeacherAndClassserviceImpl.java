package com.xawl.study.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.ClassNameMapper;
import com.xawl.study.dao.CourseAndClassMapper;
import com.xawl.study.dao.TeacherAndClassMapper;
import com.xawl.study.model.ClassName;
import com.xawl.study.model.CourseAndClassCustomer;
import com.xawl.study.model.Teacher;
import com.xawl.study.model.TeacherAndClass;
import com.xawl.study.model.Teaching;
import com.xawl.study.service.TeacherAndClassservice;

@Service
public class TeacherAndClassserviceImpl implements TeacherAndClassservice {
	@Autowired
	private TeacherAndClassMapper teacherAndClassMapper;

	@Autowired
	private ClassNameMapper classNameMapper;

	/**
	 * 按照老师的tid查找对应班级
	 */
	
	public List<Teaching> findByTeacherId(Integer tid) {
		
		List<Teaching> teachingList = teacherAndClassMapper
				.findByTeacherId(tid);
		for (Teaching teaching : teachingList) {
			ClassName className = classNameMapper
					.selectByclassId(teaching.getClassId());
			teaching.setDbClassName(className);
		}
		return teachingList;
	}

	public void insertTeacherAndClass(TeacherAndClass teacherAndClass) {
		
		if(teacherAndClassMapper.selectByTeacherAndClass(teacherAndClass) == null){
			teacherAndClassMapper.insertTeacherAndClasss(teacherAndClass);
		}
	}
	public int deleteTeacherAndClass(String ids) {
		String[] checkedNums = ids.split(",");
		int tid = teacherAndClassMapper.selectByPrimaryKey(
				Integer.parseInt(checkedNums[0])).getTid();
		teacherAndClassMapper.deleteTeacherAndClasss(checkedNums);
		return tid;
	}
}
