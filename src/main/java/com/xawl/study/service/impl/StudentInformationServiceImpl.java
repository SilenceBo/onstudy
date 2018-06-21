package com.xawl.study.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.StudentInformationMapper;
import com.xawl.study.model.AdminNotice;
import com.xawl.study.model.CourseAndTeacher;
import com.xawl.study.model.CourseNotice;
import com.xawl.study.model.Student;
import com.xawl.study.service.AdminNoticeService;
import com.xawl.study.service.CourseNoticeService;
import com.xawl.study.service.StudentInformationService;
import com.xawl.study.utils.Result;

@Service
public class StudentInformationServiceImpl implements StudentInformationService {
	@Autowired
	StudentInformationMapper studentInformationMapper;
	@Autowired
	AdminNoticeService adminNoticeService;
	@Autowired
	CourseNoticeService courseNoticeService;

	public Result selectMyCourse(Student student) {
		try {
			List<CourseAndTeacher> list = studentInformationMapper
					.selectMyCourseByClassId(student.getClassId());
			return new Result(list);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "查询失败");
		}
	}

	@SuppressWarnings("unchecked")
	public Result selectInformation(Student student) {
		Integer num = 0;
		List<AdminNotice> data = (List<AdminNotice>) adminNoticeService
				.findStudentNotice(student).getData();
		if (data != null && data.size() > 0) {
			for (AdminNotice adminNotice : data) {
				if (adminNotice.getIsBrowsed() != null
						&& adminNotice.getIsBrowsed() == 1) {
					num++;
				}
			}
		}

		List<CourseNotice> listCourseNotice = (List<CourseNotice>) courseNoticeService
				.findCourseNoticeByCid(student).getData();
		if (listCourseNotice != null && listCourseNotice.size() > 0) {
			for (CourseNotice courseNotice : listCourseNotice) {
				if (courseNotice.getIsBrowsed() != null
						&& courseNotice.getIsBrowsed() == 1) {
					num++;
				}
			}
		}
		return Result.ok(num);
	}
}
