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
import com.xawl.study.model.Course;
import com.xawl.study.model.CourseCustomer;
import com.xawl.study.model.Fangxiang;
import com.xawl.study.model.Interest;
import com.xawl.study.model.Resource;
import com.xawl.study.service.FangxiangService;
import com.xawl.study.service.InterestService;

@Controller
@RequestMapping("/fangxiang")
public class FangxiangController {

	@Autowired
	private FangxiangService fangxiangService;

	@Autowired
	private InterestService interestService;

	/**
	 * 
	 * 常看所有方向信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/findAll.action")
	public ModelAndView findAll(HttpServletRequest request,
			HttpServletResponse response) {

		List<Fangxiang> fList = fangxiangService.findAll();
		request.setAttribute("fList", fList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/table_bootstrap_fangxiang.jsp");
		return mv;
	}

	/**
	 * 根据主键查找方向
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/findByfid.action")
	public ModelAndView findByfid(HttpServletRequest request,
			HttpServletResponse response, Integer fid) {

		Fangxiang fangxiang = fangxiangService.findByfid(fid);
		request.setAttribute("fangxiang", fangxiang);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/table_bootstrap_fangxiang.jsp");
		return mv;
	}

	/**
	 * 添加方向
	 * 
	 * @param request
	 * @param response
	 * @param fangxiang
	 * @return
	 */
	@RequestMapping("/addFangxiang.action")
	@Role(role = Role.ROLE_ADMIN)
	public ModelAndView addFangxiang(HttpServletRequest request,
			HttpServletResponse response, Fangxiang fangxiang) {
		ModelAndView mv = new ModelAndView();
		String msg;
		if (fangxiang.getFname() == null || fangxiang.getFname().equals("")) {
			msg = "添加失败,方向名不能为空";
			request.setAttribute("msg", msg);
		} else {
			try {
				int rows = fangxiangService.insertFangxiang(fangxiang);
				if (rows == 0) {
					msg = "添加失败";
					request.setAttribute("msg", msg);
				} else {
					msg = "添加成功";
					request.setAttribute("msg", msg);
				}
			} catch (Exception e) {
				e.printStackTrace();
				msg = "添加失败";
				request.setAttribute("msg", msg);
			}
		}
		mv.addObject("msg", msg);
		mv.setViewName("redirect:/fangxiang/selectFangxiangByiid.action?iid="
				+ fangxiang.getIid());
		return mv;
	}

	/**
	 * 删除方向（多选）
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteFangxiang.action")
	@Role(role = Role.ROLE_ADMIN)
	public ModelAndView deleteFangxiang(HttpServletRequest request,
			HttpServletResponse response, Integer fid) {

		ModelAndView mv = new ModelAndView();
		String msg;
		Fangxiang fangxiang = fangxiangService.findByfid(fid);
		String fids = request.getParameter("fids");
		if (fids.length() != 0) {
			int rows = fangxiangService.deleteFangxiang(fids, request);
			if (rows == 0) {
				msg = "删除失败";
				request.setAttribute("msg", msg);
			} else {
				msg = "删除成功";
				request.setAttribute("msg", msg);
			}
		}
		mv.setViewName("redirect:/fangxiang/selectFangxiangByiid.action?iid="
				+ fangxiang.getIid());
		return mv;
	}

	/*
	 * 通过主键删除方向
	 */
	@RequestMapping("/deleteFangxiangByfid.action")
	@Role(role = Role.ROLE_ADMIN)
	public ModelAndView deleteFangxiangByfid(HttpServletRequest request,
			HttpServletResponse response, Integer fid) {
		ModelAndView mv = new ModelAndView();
		String msg;
		Fangxiang fangxiang = fangxiangService.findByfid(fid);
		if (fid != 0) {
			boolean b = fangxiangService.deleteFangxiangByfid(fid);
			if (b == false) {
				msg = "删除失败";
			} else {
				msg = "删除成功";
			}
			request.setAttribute("msg", msg);
		}
		mv.setViewName("redirect:/fangxiang/selectFangxiangByiid.action?iid="
				+ fangxiang.getIid());
		return mv;
	}

	/**
	 * 修改方向
	 * 
	 * @param request
	 * @param response
	 * @param fangxiang
	 * @return
	 */
	@RequestMapping("/updateFangxiang.action")
	@Role(role = Role.ROLE_ADMIN)
	public ModelAndView updateFangxiang(HttpServletRequest request,
			HttpServletResponse response, Fangxiang fangxiang) {

		ModelAndView mv = new ModelAndView();
		String msg;
		if (fangxiang.getFname() == null || fangxiang.getFname().equals("")) {
			msg = "修改失败,方向名不能为空";
			request.setAttribute("msg", msg);
		} else {
			try {
				int rows = fangxiangService.updateFangxiang(fangxiang);
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
		mv.setViewName("redirect:/fangxiang/selectFangxiangByiid.action?iid="
				+ fangxiang.getIid());
		return mv;
	}

	/**
	 * 通过iid查询方向
	 * 
	 * @param iid
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/selectFangxiangByiid.action")
	public ModelAndView selectFangxiangByiid(Integer iid,
			HttpServletRequest request, HttpServletResponse response) {
		List<Fangxiang> fxList = fangxiangService.selectFangxiangByiid(iid);
		request.setAttribute("fxList", fxList);
		request.setAttribute("iid", iid);
		Fangxiang fangxiang = new Fangxiang();
		request.setAttribute("fangxiang", fangxiang);
		Interest interest = new Interest();
		interest.setIid(iid);
		interest = interestService.findByIid(iid);
		request.setAttribute("interest", interest);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/table_bootstrap_fangxiang.jsp");
		return mv;
	}

	/*
	 * 查找所有方向接口
	 */
	@RequestMapping("/findAllJson.action")
	@ResponseBody
	public List<Fangxiang> findAllJson(HttpServletRequest request,
			HttpServletResponse response) {
		List<Fangxiang> fList = fangxiangService.findAll();
		return fList;
	}

	/*
	 * 通过iid查询方向接口
	 */
	@RequestMapping("/selectFangxiangJsonByiid.action")
	@ResponseBody
	public List<Fangxiang> selectFangxiangJsonByiid(Integer iid,
			HttpServletRequest request, HttpServletResponse response) {
		List<Fangxiang> fxList = fangxiangService.selectFangxiangByiid(iid);
		return fxList;
	}

	/*
	 * 添加方向接口
	 */
	@RequestMapping("/addFangxiangJson.action")
	@ResponseBody
	@Role(role = Role.ROLE_ADMIN)
	public int addFangxiangJson(HttpServletRequest request,
			HttpServletResponse response, Fangxiang fangxiang) {
		int addfx = fangxiangService.insertFangxiang(fangxiang);
		return addfx;
	}

	/*
	 * 删除方向接口
	 */
	@RequestMapping("/deleteFangxiangJson.action")
	@ResponseBody
	@Role(role = Role.ROLE_ADMIN)
	public int deleteFangxiangJson(HttpServletRequest request,
			HttpServletResponse response) {
		String fids = request.getParameter("fids");
		int deletefx = fangxiangService.deleteFangxiang(fids, request);
		return deletefx;
	}

	/*
	 * 修改方向接口
	 */
	@RequestMapping("/updateFangxiangJson.action")
	@ResponseBody
	@Role(role = Role.ROLE_ADMIN)
	public int updateFangxiangJson(HttpServletRequest request,
			HttpServletResponse response, Fangxiang fangxiang) {
		int updatefx = fangxiangService.updateFangxiang(fangxiang);
		return updatefx;
	}
}
