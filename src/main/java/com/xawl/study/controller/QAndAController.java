package com.xawl.study.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xawl.study.interceptor.Role;
import com.xawl.study.model.CourseCustomer;
import com.xawl.study.model.QAndA;
import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.CourseService;
import com.xawl.study.service.QAndAService;
import com.xawl.study.utils.Result;

@Controller
@RequestMapping("qanda")
public class QAndAController {
	@Autowired
	QAndAService qAndAService;
	@Autowired
	CourseService courseService;

	@RequestMapping("questionsToTeacher.action")
	@ResponseBody
	public Result questionsToTeacher(HttpServletRequest request, QAndA qAndA) {
		qAndA.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()));
		Student stu = (Student) request.getSession().getAttribute(
				"user_student");
		Teacher teacher = (Teacher) request.getSession().getAttribute(
				"user_teacher");
		if (teacher != null) {
			return Result.build(405, "身份错误");
		}
		if (stu == null) {
			return Result.build(405, "须登录后可对教师提问");
		}
		//System.out.println(stu);
		//System.out.println(qAndA);
		qAndA.setOsid(Integer.parseInt(stu.getId()));
		qAndA.setOsname(stu.getSname());
		CourseCustomer courseCustomer = new CourseCustomer();
		courseCustomer.setCid(qAndA.getCid());
		courseCustomer = courseService.SelectCourseByCid(courseCustomer);
		//System.out.println(courseCustomer);
		qAndA.setTid(courseCustomer.getDbTeacher().getTid());
		qAndA.setTname(courseCustomer.getDbTeacher().getUsername());
		Result result = qAndAService.addQuestionsToTeacher(qAndA);
		return result;
	}

	@RequestMapping("findAll.action")
	@ResponseBody
	public Result findAll(Integer page, Integer cid, HttpServletRequest request) {
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		Teacher teacher = (Teacher) request.getSession().getAttribute(
				"user_teacher");
		//System.out.println("Student=" + student + "teacher=" + teacher);
		if (student == null && teacher == null) {
			return Result.build(405, "未登录");
		}
		Result result = qAndAService.selectAll(page, cid);
		return result;
	}

	@RequestMapping("findAllAnswer.action")
	@ResponseBody
	public Result findAllAnswer(Integer qid, HttpServletRequest request) {
		Result resule = qAndAService.findAllAnswerByfqid(qid);
		request.getSession().setAttribute("listAnswer", resule.getData());
		return resule;
	}

	@RequestMapping("add.action")
	@ResponseBody
	public Result add(QAndA qAndA, HttpServletRequest request) {
		Student stu = (Student) request.getSession().getAttribute(
				"user_student");
		Teacher teacher = (Teacher) request.getSession().getAttribute(
				"user_teacher");
		if (stu == null && teacher != null) {
			return Result.build(405, "身份错误");
		}
		if (stu == null) {
			return Result.build(405, "登陆后才可以发布问题");
		}
		qAndA.setOsid(Integer.parseInt(stu.getId()));
		qAndA.setOsname(stu.getSname());
		//System.out.println(qAndA);
		qAndA.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()));
		qAndA.setTypea(0);
		Result result = qAndAService.add(qAndA);
		return result;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("reply.action")
	@ResponseBody
	public Result reply(Integer beAnsweredQid, QAndA qanda,
			HttpServletRequest request, HttpServletResponse response) {
		Integer fqid = qanda.getQid();
		String text = qanda.getText().indexOf(":") != -1 ? qanda.getText()
				.substring(qanda.getText().indexOf(":") + 1) : qanda.getText();
		List<QAndA> list = (List<QAndA>) qAndAService.findByQid(beAnsweredQid)
				.getData();
		if (list != null && list.size() > 0) {
			qanda = list.get(0);
		}
		qanda.setFqid(fqid);
		Result result = qAndAService.addReply(beAnsweredQid, qanda, text,
				request, response);
		return result;
	}

	@RequestMapping("replys.action")
	@ResponseBody
	public Result replys(HttpServletRequest request, Integer typea,
			Integer fqid, Integer qid, String text) {
		//System.out.println("qid=" + qid + "fqid=" + fqid + "typea=" + typea);
		Result result = qAndAService.addReply(fqid, qid, text, request, typea);
		return result;
	}

	@RequestMapping("findByQid.action")
	@ResponseBody
	public Result findByQid(Integer qid) {
		Result result = qAndAService.findByQid(qid);
		return result;
	}

	@RequestMapping("findByTid.action")
	@ResponseBody
	public Result findByTid(HttpServletRequest request, Integer page) {
		Teacher teacher = (Teacher) request.getSession().getAttribute(
				"user_teacher");
		Result result = qAndAService.findByTid(teacher.getTid(), page);
		return result;
	}

	@RequestMapping("findBySid.action")
	@ResponseBody
	public Result findBySid(HttpServletRequest request) {
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		Result result = qAndAService
				.findBySid(Integer.parseInt(student.getId()));
		return result;
	}

	@RequestMapping("deleteByQid.action")
	@ResponseBody
	public Result deleteByQid(Integer qid) {
		Result result = qAndAService.deleteByqid(qid);
		return result;
	}

	@RequestMapping("deleteByListQid.action")
	@ResponseBody
	public Result deleteByListQid(String qids) {
		List<Integer> list = new ArrayList<Integer>();
		String[] arr = qids.split(",");

		for (String qid : arr) {
			list.add(Integer.parseInt(qid));
		}
		Result result = qAndAService.deleteByListQid(list);
		return result;
	}

	@RequestMapping("addTeacherReply.action")
	@ResponseBody
	@Role(role = Role.ROLE_TEACHER)
	public Result addTeacherReply(HttpServletRequest request, QAndA qanda) {
		String text = qanda.getText();
		//System.out.println(qanda.getQid());
		List<QAndA> list = (List<QAndA>) qAndAService.findByQid(qanda.getQid())
				.getData();
		if (list != null && list.size() > 0) {
			qanda = list.get(0);
		}
		//System.out.println("qanda=" + qanda);
		qanda.setFqid(qanda.getQid());
		qanda.setQid(null);
		qanda.setTypea(1);
		qanda.setType(1);
		qanda.setText(text);
		qanda.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()));
		Result result = qAndAService.addTeacherReply(qanda);
		return result;
	}

	@RequestMapping("addStudentReply.action")
	@ResponseBody
	public Result addStudentReply(HttpServletRequest request, QAndA qanda) {
		//System.out.println(qanda);
		qanda.setFqid(qanda.getQid());
		qanda.setQid(null);
		qanda.setTypea(0);
		qanda.setType(1);
		qanda.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()));
		Result result = qAndAService.addStudentReply(qanda);
		return result;
	}

	@RequestMapping("teacherReply.action")
	@ResponseBody
	public Result teacherReply(HttpServletRequest request, Integer typea,
			Integer fqid, Integer qid, String text) {
		//System.out.println("qid=" + qid + "fqid=" + fqid);
		Result result = qAndAService.addTeacherReply(fqid, qid, text, request,
				typea);
		return result;
	}
}
