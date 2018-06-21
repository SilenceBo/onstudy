package com.xawl.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.xawl.study.dao.CourseMapper;
import com.xawl.study.model.Course;
import com.xawl.study.model.CourseClickLogs;
import com.xawl.study.service.CourseLogsService;
import com.xawl.study.utils.Result;

@RequestMapping("/CourseClickLog")
@Controller
public class CourseClickLogsController {
	
	@Autowired
	private CourseLogsService courseLogsService;
	@Autowired
	private CourseMapper courseMapper;
	
	@RequestMapping("/findAllCourseClicklogs.action")
	@ResponseBody
	public Result findAllCourseClicklogs(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer courseId){
		PageInfo<CourseClickLogs> list = courseLogsService.findAll(page, courseId);
		Course course = courseMapper.selectByPrimaryKey(courseId);
		request.getSession().setAttribute("course", course);
		return Result.ok(list);
	}
	
	@RequestMapping("/findAllCourseClicklogsPage.action")
	public ModelAndView findAllCourseClicklogsPage(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer courseId){
		ModelAndView mv = new ModelAndView();
		Course course = courseMapper.selectByPrimaryKey(courseId);
		request.getSession().setAttribute("course", course);
		mv.setViewName("/front/coursemanagement_skimCourse.jsp");
		return mv;
	}
}
