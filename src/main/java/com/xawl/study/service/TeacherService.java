package com.xawl.study.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.xawl.study.model.Resource;
import com.xawl.study.model.Teacher;

public interface TeacherService {

	int insertTeacher(Teacher teacher);

	List<Teacher> findAll();

	Teacher selectByPrimaryKey(Integer tid);

	boolean deleteByPrimaryKey(Integer tid);

	boolean updateByPrimaryKey(Teacher teacher);

	boolean updateByPrimaryKeySelective(Teacher teacher);

	Teacher loginteacher(Teacher teacher, HttpServletRequest request);

	int deleteByIds(String ids, HttpServletRequest request);

	Teacher SelectTeacherByTid(Integer tid);

	int RespwdByPrimaryKey(Integer tid);

}
