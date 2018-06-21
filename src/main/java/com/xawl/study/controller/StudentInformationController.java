package com.xawl.study.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xawl.study.model.Student;
import com.xawl.study.service.StudentInformationService;
import com.xawl.study.utils.Result;

@Controller
@RequestMapping("/StudentInformationCntroller")
public class StudentInformationController {
	@Autowired
	StudentInformationService studentInformationService;

	@RequestMapping("/home.action")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/front/student.jsp");
		return mv;
	}

	@RequestMapping("/myCourse.action")
	@ResponseBody
	public Result myCourse(HttpServletRequest request) {
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		if (null == student) {
			return Result.build(405, "查询失败");
		}
		Result result = studentInformationService.selectMyCourse(student);
		return result;
	}

	@RequestMapping("/myInformation.action")
	@ResponseBody
	public Result myInformation(HttpServletRequest request) {
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		if (student == null) {
			return Result.ok();
		}
		Result result = studentInformationService.selectInformation(student);
		return result;
	}
}
