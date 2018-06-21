package com.xawl.study.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xawl.study.model.Course;
import com.xawl.study.model.CourseClickLogs;
import com.xawl.study.model.CourseCustomer;
import com.xawl.study.model.Resource;
import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.CourseLogsService;
import com.xawl.study.service.CourseService;
import com.xawl.study.service.ResourceService;

@Controller
@RequestMapping("/index")
public class HomeController {
	@Autowired
	ResourceService resourceService;
	@Autowired
	CourseService courseService;
	@Autowired
	CourseLogsService courseLogsService;
	
	@RequestMapping("/index.action")
	public ModelAndView home(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/front/index.jsp");
		return null;
	}

	@RequestMapping("showCourse.action")
	public ModelAndView showCourse(Integer cid, HttpServletRequest request,
			HttpServletResponse response) {
		
		//System.out.println("showCourse" + "xxxxxxxxxxxxx");
		List<Resource> listR = resourceService.findByRTypeNo1(cid);
		ModelAndView md = new ModelAndView();
		CourseCustomer cCustomer = new CourseCustomer();
		cCustomer.setCid(cid);
		Course courses = courseService.SelectCourseByCidTwo(cCustomer);
		if(courses == null){
			md.addObject("courseIsDelete", "该课程已被删除");
			md.setViewName("/front/index.jsp");
			return md;
		}
		md.addObject("listR", listR);
		md.setViewName("/front/showCourse.jsp");
		//System.out.println("ListR=" + listR);
		CourseCustomer courseCustomer = new CourseCustomer();
		courseCustomer.setCid(cid);
		courseCustomer = courseService.SelectCourseByCid(courseCustomer);
		Student student = (Student)request.getSession().getAttribute("user_student");
		//System.out.println(student);
		if(student != null){
			courseService.updatelogClick(cid);
			CourseClickLogs clickLogs = courseLogsService.findBycid(cid, Integer.parseInt(student.getId()));
			if(clickLogs != null){
				CourseClickLogs clickLog = new CourseClickLogs();
				clickLog.setLasttime(new SimpleDateFormat("yyyy-MM--dd").format(new Date()));
				clickLog.setId(clickLogs.getId());
				courseLogsService.updateCourseLogs(clickLog);
				courseLogsService.updateClickCount(clickLogs.getId());
			}else{
				CourseClickLogs clickLog = new CourseClickLogs();
				clickLog.setCid(cid);
				clickLog.setSid(Integer.parseInt(student.getId()));
				clickLog.setSname(student.getSname());
				clickLog.setLasttime(new SimpleDateFormat("yyyy-MM--dd").format(new Date()));
				clickLog.setClickcount(1);
				courseLogsService.insertCourseLogs(clickLog);
			}
		}else{
			courseService.updateunlogClick(cid);
		}
		Teacher teacher = courseCustomer.getDbTeacher();
		md.addObject("teacher", teacher);
		md.addObject("courseCustomer", courseCustomer);
		md.addObject("cid", cid);
		return md;
	}
}
