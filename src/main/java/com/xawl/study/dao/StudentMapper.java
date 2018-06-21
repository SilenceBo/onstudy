package com.xawl.study.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.xawl.study.model.Student;
import com.xawl.study.model.StudentVo;

public interface StudentMapper {
	    //查询总记录数
		int countsALL(int classId);

	    //查询-全部 
		List<Student> findAll();
		
		//主键
		Student selectByPrimaryKey(String id);
		
		//学号
		List<Student> selectByAccount(String account);
		//学号
		List<Student> selectByAccountLogin(String account);
		
		//姓名
		List<Student> selectBySname(String sname);

		
		//删除-通过主键删除 
		int deleteByPrimaryKey(String sid);
		
		//删除多条
		int deleteByIds(String[] sids);
		
		//添加-学生信息
		//int insert(Student student);
		
		int insert(Student student);
		
		//添加-已存在学生信息 
		int insertSelective(Student record);
		
		//修改-通过主键
		int updateByPrimaryKey(Student student);
		
		//修改-通过主键修改部分信息
		int updateByPrimaryKeySelective(Student student);

		Integer findByAccount(String account);

		Student selectByCode(String code);

		void updateCodeByPrimaryKey(String id);

		Student findPass(Student stu);

		Integer updatePass(Student stu);

		List<StudentVo> selectByClassId(Integer classId);

		Integer updatePassByAccount(Student stu);

		Student selectById(Integer sid);

}
