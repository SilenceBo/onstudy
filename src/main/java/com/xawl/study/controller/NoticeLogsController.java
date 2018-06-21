package com.xawl.study.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.NoticeLogsService;
import com.xawl.study.utils.Result;

@Controller
@RequestMapping("/noticeLogs")
public class NoticeLogsController {
	@Autowired
	NoticeLogsService noticeLogsService;

	@RequestMapping("/deleteByAnidOrsid.action")
	@ResponseBody
	public Result deleteByAnidOrSid(HttpServletRequest request,Integer anid) {
		Student student =(Student) request.getSession().getAttribute("user_student");
		Result result=noticeLogsService.deleteByAnidOrSid(student.getId(),anid);
		return result;
	}
	
	@RequestMapping("/deleteByAnidOrTid.action")
	@ResponseBody
	public Result deleteByAnidOrTid(HttpServletRequest request,Integer anid) {
		Teacher teacher =(Teacher) request.getSession().getAttribute("user_teacher");
		Result result=noticeLogsService.deleteByAnidOrTid(teacher.getTid(),anid);
		return result;
	}
	
	@RequestMapping("/deleteByCnidOrsid.action")
	@ResponseBody
	public Result deleteByCnidOrsid(HttpServletRequest request,Integer cnid) {
		Student student =(Student) request.getSession().getAttribute("user_student");
		Result result=noticeLogsService.deleteByCnidOrSid(student.getId(),cnid);
		return result;
	}

}
