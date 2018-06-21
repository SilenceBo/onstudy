package com.xawl.study.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.CourseMapper;
import com.xawl.study.dao.QAndAMapper;
import com.xawl.study.dao.ResourceMapper;
import com.xawl.study.dao.TeacherMapper;
import com.xawl.study.model.CourseCustomer;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherMapper teacherMapper;
	@Autowired
	QAndAMapper qAndAMapper;
	@Autowired
	CourseMapper courseMapper;
	@Autowired
	ResourceMapper resourceMapper;

	// 添加教师
	public int insertTeacher(Teacher teacher) {
		return teacherMapper.insertSelective(teacher);

	}

	// 查找所有的教师
	public List<Teacher> findAll() {
		List<Teacher> teacherlist = teacherMapper.findAll();
		for (Teacher teacher : teacherlist) {
			Integer resourceNum = new Integer(0);
			List<CourseCustomer> list = courseMapper.SelectCourseBytid(teacher
					.getTid());
			if (list == null || list.size() == 0) {
				teacher.setCourseNum(0);
				teacher.setReourceNum(resourceNum);
			} else {
				for (CourseCustomer customer : list) {
					Integer i = resourceMapper.findResourceNumByCid(customer
							.getCid());
					resourceNum += i;
				}
				teacher.setCourseNum(list.size());
				teacher.setReourceNum(resourceNum);
			}

		}
		return teacherlist;
	}

	// 按照tid查询教师
	public Teacher selectByPrimaryKey(Integer tid) {
		return teacherMapper.selectByPrimaryKey(tid);
	}

	// 按照tid删除教师的信息
	public boolean deleteByPrimaryKey(Integer tid) {
		try {
			teacherMapper.deleteByPrimaryKey(tid);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// 删除多条
	public int deleteByIds(String ids, HttpServletRequest request) {
		// 存放在数组中2,3,45,34
		String[] checkedNums = ids.split(",");
		// 创建集合对象
		Teacher teacher = new Teacher();
		// 得到请求
		String path1 = request.getSession().getServletContext()
				.getRealPath("/");
		// 数组的循环：根据得到的id删除老师
		for (int i = 0; i < checkedNums.length; i++) {
			// System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^" +
			// checkedNums[i]);
			// 设置tid
			teacher.setTid(Integer.parseInt(checkedNums[i]));
			// 根据tid查找老师信息
			teacher = teacherMapper.selectByPrimaryKey(teacher.getTid());
			if (teacher == null) {
				return 0;
			}
		}
		return teacherMapper.deleteByIds(checkedNums);

	}

	// 修改教师的所有的信息
	public boolean updateByPrimaryKey(Teacher teacher) {
		try {
			teacherMapper.updateByPrimaryKey(teacher);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 修该部分教师的信息
	public boolean updateByPrimaryKeySelective(Teacher teacher) {
		try {
			qAndAMapper.updateTnameByTid(teacher);
			teacherMapper.updateByPrimaryKeySelective(teacher);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	// 教师登录
	public Teacher loginteacher(Teacher teacher, HttpServletRequest request) {
		Teacher teachers = teacherMapper.loginTeacher(teacher.getAccount());
		if (teachers == null) {
			request.setAttribute("msg", "用户名不存在");
		} else if (!teacher.getPwd().equals(teachers.getPwd())) {
			request.setAttribute("msg", "密码错误");
			teachers = null;
		} else {
			teacherMapper.addloginNum(teachers.getTid().toString());
			request.setAttribute("msg", "ok");
		}

		return teachers;
	}

	public int RespwdByPrimaryKey(Integer tid) {
		Map map = new HashMap();
		map.put("pwd", "123456");
		map.put("tid", tid);
		return teacherMapper.RepwdByPrimaryKey(map);

	}

	public Teacher SelectTeacherByTid(Integer tid) {
		// TODO Auto-generated method stub
		return null;
	}

}
