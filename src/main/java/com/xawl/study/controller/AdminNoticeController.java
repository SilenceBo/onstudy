package com.xawl.study.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xawl.study.interceptor.Role;
import com.xawl.study.model.AdminNotice;
import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.AdminNoticeService;
import com.xawl.study.service.NoticeLogsService;
import com.xawl.study.utils.Result;

@Controller
@RequestMapping("/adminNotice")
public class AdminNoticeController {
	@Autowired
	AdminNoticeService adminNoticeService;
	@Autowired
	NoticeLogsService noticeLogsService;
	@RequestMapping("findByAnid.action")
	@ResponseBody
	public Result findByAnid(Integer anid, HttpServletRequest request) {
		Teacher teacher = (Teacher) request.getSession().getAttribute(
				"user_teacher");
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		Result result = adminNoticeService.findByAnid(anid);
		if(student!=null){
			noticeLogsService.insertStudent(student.getId(),anid);
		}else{
			noticeLogsService.insertTeacher(teacher.getTid(),anid);
		}
		return result;
	}

	@RequestMapping("deleteByid.action")
	@ResponseBody
	@Role(role=Role.ROLE_ADMIN_AND_TEACHER)
	public Result deleteByid(Integer anid) {
		Result result = adminNoticeService.deleteById(anid);
		return result;
	}
	
	@RequestMapping("findStudentNotice.action")
	@ResponseBody
	public Result findStudentNotice(HttpServletRequest request) {
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		Result result = adminNoticeService.findStudentNotice(student);
		return result;
	}

	@RequestMapping("findTeacherNotice.action")
	@ResponseBody
	public Result findTeacherNotice(HttpServletRequest request) {
		Teacher teacher = (Teacher) request.getSession().getAttribute(
				"user_teacher");
		Result result = adminNoticeService.findTeacherNotice(teacher);
		return result;
	}

	@RequestMapping("sendNotice.action")
	@ResponseBody
	@Role(role=Role.ROLE_ADMIN)
	public Result sendNotice(AdminNotice adminNotice) {
		//System.out.println(adminNotice);
		if (adminNotice.getIsittimed() == false) {
			adminNotice.setIssendout(true);
			String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new Date());
			adminNotice.setTime(date);
		} else {
			adminNotice.setIssendout(false);
		}
		Result result = adminNoticeService.insertNotice(adminNotice);
		return result;
	}

	@RequestMapping("showSendNotice.action")
	public ModelAndView showSendNotice(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/layerdates.jsp");
		return mv;
	}

	@RequestMapping("showNotice.action")
	public ModelAndView showNotice(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/notification.jsp");
		return mv;
	}

	@RequestMapping("findAllNotice.action")
	public ModelAndView findAllNotice(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Result result = adminNoticeService.findAllNotice();
		if (result.getData() != null) {
			mv.addObject("list", result.getData());
		}
		//System.out.println(result.getData().toString());
		mv.setViewName("/admin/notification.jsp");
		return mv;
	}
}
