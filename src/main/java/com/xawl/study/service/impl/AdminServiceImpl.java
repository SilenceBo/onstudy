package com.xawl.study.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.AdminMapper;
import com.xawl.study.dao.CourseMapper;
import com.xawl.study.dao.ResourceMapper;
import com.xawl.study.dao.TeacherWorkMapper;
import com.xawl.study.model.Admin;
import com.xawl.study.model.CourseCustomer;
import com.xawl.study.model.StatisticsReource;
import com.xawl.study.model.StatisticsWork;
import com.xawl.study.model.Statisticsvideo;
import com.xawl.study.model.TeacherWorkExample;
import com.xawl.study.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper adminMapper;
	@Autowired
	CourseMapper courseMapper;
	@Autowired
	ResourceMapper resourceMapper;
	@Autowired
	TeacherWorkMapper teacherWorkMapper;

	public Admin findAdmin(Admin admin) {
		return adminMapper.findAdmin(admin);
	}

	public Admin findAdminByUname(String uname) {
		return adminMapper.findAdminByUname(uname);
	}

	public int updateAdminPass(Admin admin) {
		return adminMapper.updateAdminPass(admin);
	}

	public StatisticsReource statisticsReource() {
		StatisticsReource s = new StatisticsReource();
		s.setHavaResCouNum(0);
		List<CourseCustomer> list = courseMapper.findAll();
		for (CourseCustomer courseCustomer : list) {
			Integer i = resourceMapper.findResourceNumByCid(courseCustomer
					.getCid());
			if (i != 0) {
				s.setHavaResCouNum(s.getHavaResCouNum() + 1);
			}
		}
		s.setCourseNum(list.size());
		s.setNotHvaResCouNum(s.getCourseNum() - s.getHavaResCouNum());
		return s;
	}

	public Statisticsvideo statisticsvideo() {
		Statisticsvideo s = new Statisticsvideo();
		s.setHavaVideoCouNum(0);
		List<CourseCustomer> list = courseMapper.findAll();
		for (CourseCustomer courseCustomer : list) {
			Integer i = resourceMapper.findVoideoNumByCid(courseCustomer
					.getCid());
			if (i != 0) {
				s.setHavaVideoCouNum(s.getHavaVideoCouNum() + 1);
			}
		}
		s.setCourseNum(list.size());
		s.setNotHavaVideoCouNum(s.getCourseNum() - s.getHavaVideoCouNum());
		return s;
	}

	public StatisticsWork statisticsWork() {
		StatisticsWork s = new StatisticsWork();
		s.setHavaWorkCouNum(0);
		List<CourseCustomer> list = courseMapper.findAll();
		for (CourseCustomer courseCustomer : list) {
			Integer i = teacherWorkMapper.findCountByCid(courseCustomer
					.getCid());
			if (i != 0) {
				s.setHavaWorkCouNum(s.getHavaWorkCouNum() + 1);
			}
		}
		s.setCourseNum(list.size());
		s.setNotHvaWorkCouNum(s.getCourseNum() - s.getHavaWorkCouNum());
		return s;
	}
}
