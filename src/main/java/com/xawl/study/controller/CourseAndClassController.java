package com.xawl.study.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xawl.study.interceptor.Role;
import com.xawl.study.model.ClassName;
import com.xawl.study.model.Course;
import com.xawl.study.model.CourseAndClass;
import com.xawl.study.model.CourseAndClassCustomer;
import com.xawl.study.model.CourseCustomer;
import com.xawl.study.service.ClassNameService;
import com.xawl.study.service.CourseAndClassservice;
import com.xawl.study.service.CourseService;
import com.xawl.study.utils.Result;

/**
 * 课程与班级关系的controller层
 * @author zb
 *
 */
@RequestMapping("/CourseAndClass")
@Controller
public class CourseAndClassController {
	
	@Autowired
	private CourseAndClassservice courseAndClassservice;
	@Autowired
	private ClassNameService classNameService;
	@Autowired
	private CourseService courseService;
	
	/**
	 * 按照课程id查找课程与班级关系
	 * @param request
	 * @param response
	 * @param courseId
	 * @return
	 */
	@RequestMapping("/findByCourseId.action")
	public ModelAndView findByCourseId(HttpServletRequest request,
			HttpServletResponse response, Integer courseId){
		List<CourseAndClassCustomer> CourseAndClassCustomerList = courseAndClassservice.findByCourseId(courseId);
		request.setAttribute("CCList", CourseAndClassCustomerList);
		
		CourseCustomer courseCustomer = new CourseCustomer();
		courseCustomer.setCid(courseId);
		Course course = courseService.SelectCourseByCidTwo(courseCustomer);
		request.setAttribute("course", course);
		
		List<ClassName> classNameList = classNameService.findAll();
		request.setAttribute("classNameList", classNameList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/table_bootstrap_courseAndClass.jsp");
		return mv;
	}
	
	/**
	 * 按照课程id查找课程与班级关系
	 * @param request
	 * @param response
	 * @param courseId
	 * @return
	 */
	@RequestMapping("/findCourseById.action")
	public ModelAndView findCourseById(HttpServletRequest request,
			HttpServletResponse response, Integer courseId){
		List<CourseAndClassCustomer> CourseAndClassCustomerList = courseAndClassservice.findByCourseId(courseId);
		request.setAttribute("CCList", CourseAndClassCustomerList);
		CourseCustomer courseCustomer = new CourseCustomer();
		courseCustomer.setCid(courseId);
		Course course = courseService.SelectCourseByCidTwo(courseCustomer);
		request.setAttribute("course", course);
		List<ClassName> classNameList = classNameService.findAll();
		request.setAttribute("classNameList", classNameList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/front/coursemanagement_class.jsp");
		return mv;
	}
	
	/**
	 * 添加课程与班级关系
	 * @param request
	 * @param response
	 * @param courseAndClass
	 * @return
	 */
	@RequestMapping("/insertCourseAndClasss.action")
	@Role(role=Role.ROLE_ADMIN_AND_TEACHER)
	public ModelAndView insertCourseAndClasss(HttpServletRequest request,
			HttpServletResponse response, CourseAndClass courseAndClass){
		courseAndClassservice.insertCourseAndClasss(courseAndClass);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/CourseAndClass/findByCourseId.action?courseId="+courseAndClass.getCourseId());
		return mv;
	}
	
	/**
	 * 添加课程与班级关系
	 * @param request
	 * @param response
	 * @param courseAndClass
	 * @return
	 */
	@RequestMapping("/addCourseAndClasss.action")
	@Role(role=Role.ROLE_ADMIN_AND_TEACHER)
	public ModelAndView addCourseAndClasss(HttpServletRequest request,
			HttpServletResponse response, CourseAndClass courseAndClass){
		courseAndClassservice.insertCourseAndClasss(courseAndClass);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/CourseAndClass/findCourseById.action?courseId="+courseAndClass.getCourseId());
		return mv;
	}
	
	/**
	 * 按照id删除课程与班级关系
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteCourseAndClasss.action")
	@Role(role=Role.ROLE_ADMIN_AND_TEACHER)
	public ModelAndView deleteCourseAndClasss(HttpServletRequest request,
			HttpServletResponse response) {
		String ids=request.getParameter("ids");
		int courseId = courseAndClassservice.deleteCourseAndClasss(ids);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/CourseAndClass/findByCourseId.action?courseId="+courseId);
		return mv;
	}
	
	/**
	 * 按照id删除课程与班级关系
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteCourseAndClass.action")
	@Role(role=Role.ROLE_ADMIN_AND_TEACHER)
	public ModelAndView deleteCourseAndClass(HttpServletRequest request,
			HttpServletResponse response) {
		String ids=request.getParameter("ids");
		int courseId = courseAndClassservice.deleteCourseAndClasss(ids);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/CourseAndClass/findCourseById.action?courseId="+courseId);
		return mv;
	}
	
	@RequestMapping("/findCourseClassByCourseId.action")
	@ResponseBody
	public Result findCourseClassByCourseId(HttpServletRequest request,
			HttpServletResponse response, Integer courseId){
		List<CourseAndClassCustomer> list = courseAndClassservice.findByCourseId(courseId);
		return Result.ok(list);
	}
}
