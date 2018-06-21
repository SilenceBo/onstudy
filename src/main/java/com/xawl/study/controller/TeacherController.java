package com.xawl.study.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xawl.study.dao.IpMapper;
import com.xawl.study.dao.TeacherMapper;
import com.xawl.study.interceptor.Role;
import com.xawl.study.model.ClassName;
import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.ClassNameService;
import com.xawl.study.service.TeacherService;
import com.xawl.study.utils.IpUtils;
import com.xawl.study.utils.JsonUtils;
import com.xawl.study.utils.Msg;
import com.xawl.study.utils.Result;

@RequestMapping("/teacher")
@Controller
public class TeacherController {
	@Autowired
	TeacherService teacherservice;
	@Autowired
	ClassNameService classnameservice;
	@Autowired
	IpMapper ipMapper;
	// 添加教师的信息
	@RequestMapping("/insertTeacher.action")
	@Role(role = Role.ROLE_ADMIN)
	public ModelAndView insertTeacher(HttpServletRequest request,
			HttpServletResponse response, Teacher teacher) {
		ModelAndView mv = new ModelAndView();
		//System.out.println(teacher);
		teacherservice.insertTeacher(teacher);
		mv.setViewName("/teacher/findAll.action");
		return mv;
	}

	// 查找所有教师的信息
	@RequestMapping("/findAll.action")
	@Role(role = Role.ROLE_ADMIN)
	public ModelAndView findAll(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		List<Teacher> teacherList = teacherservice.findAll();
		request.setAttribute("teacherList", teacherList);
		mv.setViewName("/admin/table_bootstrap_teacher.jsp");
		return mv;
	}

	// 按照教师的tid查找该教师的信息
	@RequestMapping("/selectByPrimaryKey.action")
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public ModelAndView selectByPrimaryKey(HttpServletRequest request,
			HttpServletResponse response, Integer tid) {
		ModelAndView mv = new ModelAndView();
		Teacher teacher = teacherservice.selectByPrimaryKey(tid);
		request.setAttribute("teacher", teacher);
		mv.addObject("teacher", teacher);
		mv.setViewName("/admin/table_bootstrap_teacher.jsp");
		return mv;
	}

	@RequestMapping("/selectByPrimaryKeyJson.action")
	@ResponseBody
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public Result selectByPrimaryKeyJson(HttpServletRequest request,
			HttpServletResponse response, Integer tid) {
		Teacher teacher = teacherservice.selectByPrimaryKey(tid);
		return Result.ok(teacher);
	}

	// 按照教师的tid删除教师的信息
	@RequestMapping("/deleteByPrimaryKey.action")
	@Role(role = Role.ROLE_ADMIN)
	public ModelAndView deleteByPrimaryKey(HttpServletRequest request,
			HttpServletResponse response, Integer tid) {
		ModelAndView mv = new ModelAndView();
		Teacher teacher = teacherservice.selectByPrimaryKey(tid);
		request.setAttribute("teacher", teacher);
		boolean b = teacherservice.deleteByPrimaryKey(teacher.getTid());
		mv.addObject("b", b);
		mv.setViewName("/teacher/findAll.action");
		return mv;
	}

	// 删除多条
	@RequestMapping("/deleteByIds.action")
	@Role(role = Role.ROLE_ADMIN)
	public ModelAndView deleteByIds(HttpServletRequest request,
			HttpServletResponse response, String ids) {
		// String ids=request.getParameter("ids");
		// System.out.println(ids.length() + "________________" + ids);
		ModelAndView mv = new ModelAndView();
		String msg;
		//System.out.println("********************" + ids);
		if (ids.length() != 0) {
			int rows = teacherservice.deleteByIds(ids, request);
			if (rows == 0) {
				msg = "删除失败。。。";
				request.setAttribute("msg", msg);
			} else {
				msg = "删除成功！！！";
				request.setAttribute("msg", msg);
			}
		}
		mv.setViewName("/teacher/findAll.action");
		return mv;
	}

	// 修改教师已存在的信息
	@RequestMapping("/updateByPrimaryKey.action")
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public ModelAndView updateByPrimaryKey(HttpServletRequest request,
			HttpServletResponse response, Teacher teacher) {
		ModelAndView mv = new ModelAndView();
		boolean b = teacherservice.updateByPrimaryKeySelective(teacher);
		teacher = teacherservice.selectByPrimaryKey(teacher.getTid());
		request.setAttribute("teacher", teacher);
		mv.addObject("b", b);
		mv.setViewName("/teacher/findAll.action");
		return mv;
	}

	@RequestMapping("/updateByPrimaryKeySelective.action")
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	// 修改部分教师的信息
	public ModelAndView updateByPrimaryKeySelective(HttpServletRequest request,
			HttpServletResponse response, Teacher teacher) {
		ModelAndView mv = new ModelAndView();
		//System.out.println("**********************" + teacher);
		boolean b = teacherservice.updateByPrimaryKeySelective(teacher);
		teacher = teacherservice.selectByPrimaryKey(teacher.getTid());
		//System.out.println("********************" + teacher);
		request.setAttribute("teacher", teacher);
		mv.addObject("b", b);
		mv.setViewName("/teacher/findAll.action");
		return mv;
	}

	@RequestMapping("/loginTeacher.action")
	// 老师后台登录界面
	public ModelAndView loginTeacher(HttpServletRequest request,
			HttpServletResponse response, Teacher teacher) {
		ModelAndView mv = new ModelAndView();
		teacher = teacherservice.loginteacher(teacher, request);
		if (teacher == null) {
			mv.setViewName("/admin/table_bootstrap_teacher.jsp");
		} else {
			teacher.setPwd(null);
			request.getSession().setAttribute("teacher", teacher);
			mv.setViewName("/admin/table_bootstrap_teacher.jsp");
		}
		return mv;
	}

	@RequestMapping("/login.action")
	// 老师前台登录界面
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response, Teacher teacher)
			throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView();
		teacher = teacherservice.loginteacher(teacher, request);
		if (teacher != null) {
			Cookie cookie2 = new Cookie("teacher", URLEncoder.encode(
					JsonUtils.objectToJson(teacher), "UTF-8"));
			cookie2.setMaxAge(30 * 60);
			cookie2.setPath("/onstudy/");
			response.addCookie(cookie2);
			request.getSession().setAttribute("user_teacher", teacher);
			mv.setViewName("/front/index.jsp");
			new IpUtils().record(request, ipMapper);
		} else {
			mv.setViewName("/front/index.jsp");
		}
		//System.out.println(teacher);
		return mv;
	}

	// 重置教师密码
	@RequestMapping("/RepwdByPrimaryKey.action")
	@Role(role = Role.ROLE_ADMIN)
	public ModelAndView RepwdByPrimaryKey(HttpServletRequest request,
			HttpServletResponse response, Integer tid)
			throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView();
		Teacher teacher = teacherservice.selectByPrimaryKey(tid);
		request.setAttribute("teacher", teacher);
		int rows = teacherservice.RespwdByPrimaryKey(teacher.getTid());
		String msg = "";
		if (rows == 0) {
			msg = "重置密码失败。。。";
			request.setAttribute("msg", msg);
		} else {
			msg = "重置密码成功，默认密码为:‘123456’！！！";
			request.setAttribute("msg", msg);
		}
		mv.setViewName("/teacher/findAll.action");
		return mv;
	}

	// 查询所有班级信息
	@RequestMapping("/findclassname.action")
	@ResponseBody
	public Msg findClassname() {
		List<ClassName> list = classnameservice.findAll();
		//System.out.println(list);
		return Msg.success().add("findclassname", list);
	}

	// 修改教师
	@RequestMapping("/updateByPrimaryKeyJson.action")
	@ResponseBody
	public Result updateByPrimaryKeyJson(HttpServletRequest request,
			HttpServletResponse response, Teacher teacher) {
		String regemail = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		String regphone = "^((17[0-9])(14[0-9])|(13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
		String regqq = "[1-9][0-9]{4,14}";
		Result result = new Result();
		if (teacher.getEmail() != null && teacher.getEmail() != "") {
			if (!teacher.getEmail().matches(regemail)) {
				return Result.build(500, "邮箱格式不正确");
			}
		}

		if (teacher.getPhone() != null && teacher.getPhone() != "") {
			if (!teacher.getPhone().matches(regphone)) {
				return Result.build(500, "手机号格式不正确");
			}
		}

		if (teacher.getQq() != null) {
			if (!String.valueOf(teacher.getQq()).matches(regqq)) {
				return Result.build(500, "QQ号格式不正确");
			}
		} else {
			teacher.setQq(0);
		}

		boolean b = teacherservice.updateByPrimaryKeySelective(teacher);
		if (!b) {
			result.setStatus(500);
			result.setMsg("修改失败");
		} else {
			result.setStatus(200);
			result.setMsg("修改成功");
		}
		return result;
	}

	// 修改密码
	@RequestMapping("/updatePassJson.action")
	@ResponseBody
	public Result updatePassJson(HttpServletRequest request,
			HttpServletResponse response, Teacher teacher) {
		if (teacher.getPwd().length() < 4 || teacher.getPwd().length() > 10) {
			return Result.build(500, "密码要在4到10位之间");
		}

		Result result = new Result();

		boolean b = teacherservice.updateByPrimaryKeySelective(teacher);
		if (!b) {
			result.setStatus(500);
			result.setMsg("修改失败");
		} else {
			request.getSession().invalidate();
			result.setStatus(200);
			result.setMsg("修改成功");
		}

		return result;
	}
}
