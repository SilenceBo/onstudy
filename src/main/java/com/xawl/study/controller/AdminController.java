package com.xawl.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xawl.study.interceptor.Role;
import com.xawl.study.model.Admin;
import com.xawl.study.model.StatisticsReource;
import com.xawl.study.model.StatisticsWork;
import com.xawl.study.model.Statisticsvideo;
import com.xawl.study.service.AdminService;
import com.xawl.study.utils.Result;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;

	@RequestMapping("/login.action")
	@ResponseBody
	public Result login(HttpServletRequest request,
			HttpServletResponse response, Admin admin) {
		Admin adminData = adminService.findAdmin(admin);
		if (adminData != null) {
			request.getSession().setAttribute("admin", admin);
			return Result.ok();
		}
		return Result.build(500, "用户名或者密码错误");
	}

	@RequestMapping("/findAdmin.action")
	@ResponseBody
	public Result findAdmin(HttpServletRequest request,
			HttpServletResponse response, Admin admin) {
		Admin adminData = adminService.findAdminByUname(admin.getUname());
		// System.out.println(adminData);
		if (adminData != null) {
			return Result.ok(adminData);
		}
		return Result.build(500, "用户不存在");
	}

	@RequestMapping("/updateAdminPass.action")
	@ResponseBody
	@Role(role = Role.ROLE_ADMIN)
	public Result updateAdminPass(HttpServletRequest request,
			HttpServletResponse response, Admin admin) {
		int status = adminService.updateAdminPass(admin);
		if (status != 0) {
			request.getSession().invalidate();
			return Result.ok();
		}
		return Result.build(500, "修改失败");
	}

	@RequestMapping("/signOut.action")
	public ModelAndView signOut(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		request.getSession().invalidate();
		mv.setViewName("/admin/login.jsp");
		return mv;
	}

	@RequestMapping("/statisticsReource.action")
	public ModelAndView statisticsReource(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		StatisticsReource statisticsReource = adminService.statisticsReource();
		mv.addObject("statisticsReource", statisticsReource);
		mv.setViewName("/admin/statistics_resource.jsp");
		return mv;
	}

	@RequestMapping("/statisticsvideo.action")
	public ModelAndView statisticsvideo(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		Statisticsvideo statisticsvideo = adminService.statisticsvideo();
		mv.addObject("statisticsvideo", statisticsvideo);
		mv.setViewName("/admin/statistics_video.jsp");
		return mv;
	}

	@RequestMapping("/statisticswork.action")
	public ModelAndView statisticswork(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		StatisticsWork statisticsWork = adminService.statisticsWork();
		mv.addObject("statisticsWork", statisticsWork);
		mv.setViewName("/admin/statistics_work.jsp");
		return mv;
	}

}
