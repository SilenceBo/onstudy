package com.xawl.study.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xawl.study.interceptor.Role;
import com.xawl.study.model.CourseNotice;
import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.CourseNoticeService;
import com.xawl.study.service.NoticeLogsService;
import com.xawl.study.utils.Result;

@Controller
@RequestMapping("/courseNotice")
public class CourseNoticeController {
	@Autowired
	CourseNoticeService courseNoticeService;
	@Autowired
	NoticeLogsService noticeLogsService;

	@RequestMapping("/findCourseNoticeByCid.action")
	@ResponseBody
	public Result findCourseNoticeByCid(HttpServletRequest request) {
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		Result result = courseNoticeService.findCourseNoticeByCid(student);
		return result;
	}

	@RequestMapping("/findAll.action")
	@ResponseBody
	public Result findAll(HttpServletRequest request) {
		Result result = courseNoticeService.findAll();
		return result;
	}

	@RequestMapping("/findByTid.action")
	@ResponseBody
	public Result findByTid(HttpServletRequest request,Integer pn) {
		Teacher teacher = (Teacher) request.getSession().getAttribute(
				"user_teacher");
		Result result = courseNoticeService.findByTid(teacher.getTid(),pn);
		return result;
	}

	@RequestMapping("/deleteByCnid.action")
	@ResponseBody
	@Role(role=Role.ROLE_ADMIN_AND_TEACHER)
	public Result deleteByCnid(Integer cnid) {
		Result result = courseNoticeService.deleteByCnid(cnid);
		return result;
	}
	
	@RequestMapping("deleteByids.action")
	@ResponseBody
	public Result deleteByids(String ids) {
		if (ids.length() != 0) {
			String [] checkedNums = ids.split(",");
			for(String cnid :checkedNums){
				courseNoticeService.deleteByCnid(Integer.parseInt(cnid));
			}
			return Result.ok();
		}
		return Result.build(500, "失败");
	}
	
	@RequestMapping("findByCnid.action")
	@ResponseBody
	public Result findByAnid(Integer cnid, HttpServletRequest request) {
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		if (student != null) {
			noticeLogsService.insertCourseStudent(student.getId(), cnid);
		}
		Result result = courseNoticeService.findByCnid(cnid);
		return result;
	}

	@RequestMapping("updataNotice.action")
	@ResponseBody
	@Role(role=Role.ROLE_ADMIN_AND_TEACHER)
	public Result updataNotice(CourseNotice courseNotice,
			HttpServletRequest request) {
		String[] split = courseNotice.getCname().split(",");
		courseNotice.setCname(split[0]);
		courseNotice.setCid(Integer.parseInt(split[1]));
		if (!courseNotice.getIsittimed()) {
			courseNotice.setTime(null);
		}
		Result result = courseNoticeService.update(courseNotice);
		//System.out.println(courseNotice);
		return result;
	}

}
