package com.xawl.study.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xawl.study.interceptor.Role;
import com.xawl.study.model.ClassName;
import com.xawl.study.model.Course;
import com.xawl.study.model.Teacher;
import com.xawl.study.model.TeacherAndClass;
import com.xawl.study.model.Teaching;
import com.xawl.study.service.ClassNameService;
import com.xawl.study.service.CourseService;
import com.xawl.study.service.TeacherAndClassservice;
import com.xawl.study.service.TeacherService;



@RequestMapping("/teacherclass")
@Controller
public class TeacherAndClassController {
	
	@Autowired
	private TeacherAndClassservice teacherAndClassservice;
	@Autowired
	private ClassNameService classNameService;
	@Autowired
	private TeacherService teacherService;
	/**
	 * 按照老师的tid查找老师与课程之间的关系
	 * @param request
	 * @param response
	 * @param tid
	 * @return
	 */
	
	
	@RequestMapping("/findByTeacherId.action")
	public ModelAndView findByTeacherId(HttpServletRequest request,
			HttpServletResponse response, Integer tid){	
	    
		List<Teaching> TeachingList = teacherAndClassservice.findByTeacherId(tid);
		request.setAttribute("TeachingList", TeachingList);
		
		//Teaching teaching=new Teaching();
		request.setAttribute("tid", tid);
		//System.out.println("+++++++++++++++++++++++++"+tid);
		
		List<ClassName> classNameList = classNameService.findAll();
		request.setAttribute("classNameList", classNameList);	
		//System.out.println("#########################"+classNameList);
	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/table_bootstrap_teacherAndclass.jsp");
		return mv;
	}
	
	@RequestMapping("/insertTeacherAndClass.action")
	@Role(role=Role.ROLE_ADMIN_AND_TEACHER)
	public ModelAndView insertTeacherAndClass(HttpServletRequest request,
			HttpServletResponse response, TeacherAndClass teacherAndClass){
		//System.out.println("*****************"+teacherAndClass);
		teacherAndClassservice.insertTeacherAndClass(teacherAndClass);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/teacherclass/findByTeacherId.action?tid="+teacherAndClass.getTid());
		//System.out.println("****************"+teacherAndClass.getTid());
		return mv;
	}
	
	@RequestMapping("/deleteTeacherAndClass.action")
	@Role(role=Role.ROLE_ADMIN_AND_TEACHER)
	public ModelAndView deleteTeacherAndClass(HttpServletRequest request,
			HttpServletResponse response) {
		String ids=request.getParameter("ids");
		int tid = teacherAndClassservice.deleteTeacherAndClass(ids);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/teacherclass/findByTeacherId.action?tid="+tid);
		return mv;
	}
}
