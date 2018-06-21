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
import com.xawl.study.model.Major;
import com.xawl.study.service.MajorService;
import com.xawl.study.utils.Result;

@Controller
@RequestMapping("/major")
public class MajorController {

	@Autowired
	private MajorService majorService;

	/**
	 * 查找所有兴趣
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/findAll.action")
	public ModelAndView findAll(HttpServletRequest request,
			HttpServletResponse response) {

		List<Major> mList = majorService.findAll();
		request.setAttribute("mList", mList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/table_bootstrap_major.jsp");
		return mv;
	}

	/**
	 * 根据主键查找专业
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/findBymid.action")
	public ModelAndView findBymid(HttpServletRequest request,
			HttpServletResponse response, Integer mid) {

		Major major = majorService.findBymid(mid);
		request.setAttribute("major", major);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/table_bootstrap_major.jsp");
		return mv;
	}

	/**
	 * 添加专业
	 * 
	 * @param request
	 * @param response
	 * @param interest
	 * @return
	 */
	@RequestMapping("/addMajor.action")
	@Role(role = Role.ROLE_ADMIN)
	public ModelAndView addMajor(HttpServletRequest request,
			HttpServletResponse response, Major major) {
		ModelAndView mv = new ModelAndView();
		String msg;
		if (major.getMname() == null || major.getMname().equals("")) {
			msg = "添加失败,专业名不能为空";
			request.setAttribute("msg", msg);
		} else {
			try {
				int rows = majorService.insertMajor(major);
				if (rows == 0) {
					msg = "添加失败";
					request.setAttribute("msg", msg);
				} else {
					msg = "添加成功";
					request.setAttribute("msg", msg);
				}
			} catch (Exception e) {
				e.printStackTrace();
				msg = "添加失败，服务器异常";
				request.setAttribute("msg", msg);
			}
		}
		mv.addObject("msg", msg);
		mv.setViewName("redirect:/major/findAll.action");
		return mv;
	}

	/**
	 * 删除专业
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteMajorBymid.action")
	@Role(role = Role.ROLE_ADMIN)
	public ModelAndView deleteMajorBymid(Integer mid,
			HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mv = new ModelAndView();
		String msg;

		int rows = majorService.deleteMajorBymid(mid);
		if (rows == 0) {
			msg = "删除失败";
			request.setAttribute("msg", msg);
		} else {
			msg = "删除成功";
			request.setAttribute("msg", msg);
		}
		mv.addObject("msg", msg);
		mv.setViewName("redirect:/major/findAll.action");
		return mv;
	}

	/**
	 * 修改专业
	 * 
	 * @param request
	 * @param response
	 * @param interest
	 * @return
	 */
	@RequestMapping("/updateMajor.action")
	@Role(role = Role.ROLE_ADMIN)
	public ModelAndView updateMajor(HttpServletRequest request,
			HttpServletResponse response, Major major) {

		ModelAndView mv = new ModelAndView();
		String msg;
		if (major.getMname() == null || major.getMname().equals("")) {
			msg = "修改失败,专业名不能为空";
			request.setAttribute("msg", msg);
		} else {
			try {
				int rows = majorService.updateMajor(major);
				if (rows == 0) {
					msg = "修改失败";
					request.setAttribute("msg", msg);
				} else {
					msg = "修改成功";
					request.setAttribute("msg", msg);
				}
			} catch (Exception e) {
				e.printStackTrace();
				msg = "修改失败";
				request.setAttribute("msg", msg);
			}
		}
		mv.addObject("msg", msg);
		mv.setViewName("redirect:/major/findAll.action");
		return mv;
	}

	@RequestMapping("/findAllJson.action")
	@ResponseBody
	public Result findAllJson(HttpServletRequest request,
			HttpServletResponse response) {

		List<Major> mList = majorService.findAll();
		return Result.ok(mList);
	}
}
