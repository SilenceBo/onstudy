package com.xawl.study.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xawl.study.interceptor.Role;
import com.xawl.study.model.ClassNameVo;
import com.xawl.study.model.CourseNotice;
import com.xawl.study.model.PlDownload;
import com.xawl.study.model.Student;
import com.xawl.study.model.StudentVo;
import com.xawl.study.model.StudentWork;
import com.xawl.study.model.Teacher;
import com.xawl.study.model.TeacherWork;
import com.xawl.study.service.CourseNoticeService;
import com.xawl.study.service.StudentService;
import com.xawl.study.service.TeacherformationService;
import com.xawl.study.utils.Result;

@Controller
@RequestMapping("/teacherInformationController")
public class TeacherInformationController {
	@Autowired
	CourseNoticeService courseNoticeService;
	@Autowired
	TeacherformationService teacherformationService;
	@Autowired
	StudentService studentService;

	@RequestMapping("/home.action")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/front/teacher.jsp");
		return mv;
	}

	@RequestMapping("/sendNotice.action")
	@ResponseBody
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public Result sendNotice(CourseNotice courseNotice,
			HttpServletRequest request) {
		// System.out.println(courseNotice);
		Teacher teacher = (Teacher) request.getSession().getAttribute(
				"user_teacher");
		String[] split = courseNotice.getCname().split(",");
		courseNotice.setCname(split[0]);
		courseNotice.setTid(teacher.getTid());
		courseNotice.setCid(Integer.parseInt(split[1]));
		if (courseNotice.getIsittimed() == false) {
			courseNotice.setIssendout(true);
			String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new Date());
			courseNotice.setTime(date);
		} else {
			courseNotice.setIssendout(false);
		}
		Result result = courseNoticeService.addCourseNotice(courseNotice);
		return result;
	}

	@RequestMapping("/myInformation.action")
	@ResponseBody
	public Result myInformation(HttpServletRequest request) {
		Teacher teacher = (Teacher) request.getSession().getAttribute(
				"user_teacher");
		Result result = teacherformationService.selectInformation(teacher);
		return result;
	}

	@RequestMapping("/showWOrkInformation.action")
	@ResponseBody
	public Result showWOrkInformation(HttpServletRequest request,
			TeacherWork teacherWork) {
		Result result = teacherformationService
				.showWOrkInformation(teacherWork);
		return result;
	}

	@RequestMapping("/plShowWOrkInformation.action")
	@ResponseBody
	public List<PlDownload> plShowWOrkInformation(HttpServletRequest request,
			TeacherWork teacherWork) {
		Result result = teacherformationService
				.plShowWOrkInformation(teacherWork);

		List<PlDownload> plist = new ArrayList<PlDownload>();
		for (ClassNameVo cs : (List<ClassNameVo>) result.getData()) {
			String classname = cs.getClassName().getName();
			for (StudentVo st : cs.getStudentLst()) {
				PlDownload p = new PlDownload();
				p.setClassname(classname);
				StudentWork sw = st.getWork();
				if (sw != null) {
					Student student = studentService.selectById(sw.getSid());
					p.setFilename(sw.getFilename());
					p.setPath(sw.getFile());

					p.setSname(sw.getSname() + student.getAccount());
				}
				plist.add(p);
			}
		}
		return plist;
	}

	@RequestMapping("/showClassStudent.action")
	@ResponseBody
	public Result showClassStudent(HttpServletRequest request, Integer classId) {
		Result result = teacherformationService.showWOrkInformation(classId);
		return result;
	}

}
