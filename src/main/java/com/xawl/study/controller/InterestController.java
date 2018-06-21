package com.xawl.study.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xawl.study.model.Interest;
import com.xawl.study.service.InterestService;

@Controller
@RequestMapping("/interest")
public class InterestController {

	@Autowired
	private InterestService interestService;

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

		List<Interest> iList = interestService.findAll();
		request.setAttribute("iList", iList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/table_bootstrap_interest.jsp");
		return mv;
	}

	/**
	 * 根据主键查找兴趣
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/findByIid.action")
	public ModelAndView findByIid(HttpServletRequest request,
			HttpServletResponse response, Integer iid) {

		Interest interest = interestService.findByIid(iid);
		request.setAttribute("interest", interest);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/table_bootstrap_interest.jsp");
		return mv;
	}

	/**
	 * 添加兴趣
	 * 
	 * @param request
	 * @param response
	 * @param interest
	 * @return
	 */
	@RequestMapping("/addInterest.action")
	public ModelAndView addInterest(HttpServletRequest request,
			HttpServletResponse response, Interest interest) {
		ModelAndView mv = new ModelAndView();
		String msg;
		if (interest.getIname() == null || interest.getIname().equals("")) {
			msg = "添加失败,兴趣名不能为空";
			request.setAttribute("msg", msg);
			mv.setViewName("redirect:/interest/findAll.action");
		}else{
		try {
			int rows = interestService.insertInterest(interest);
			if (rows == 0) {
				msg = "添加失败";	
			} else {
				msg = "添加成功";	
			}
			request.setAttribute("msg", msg);
		} catch (Exception e) {
			e.printStackTrace();
			msg = "添加失败，服务器异常";
			request.setAttribute("msg", msg);
			}
		}
		mv.addObject("msg", msg);
		mv.setViewName("redirect:/interest/findAll.action");
		return mv;
	}

	/**
	 * 删除兴趣
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteInterestByiid.action")
	public ModelAndView deleteInterestByiid(Integer iid,
			HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mv = new ModelAndView();
		String msg;
		int rows = interestService.deleteInterestByiid(iid);
		if (rows == 0) {
			msg = "删除失败";
			request.setAttribute("msg", msg);
		} else {
			msg = "删除成功";
			request.setAttribute("msg", msg);
		}
		mv.addObject("msg", msg);
		mv.setViewName("redirect:/interest/findAll.action");
		return mv;
	}

	/**
	 * 修改兴趣
	 * 
	 * @param request
	 * @param response
	 * @param interest
	 * @return
	 */
	@RequestMapping("/updateInterest.action")
	public ModelAndView updateInterest(HttpServletRequest request,
			HttpServletResponse response, Interest interest) {

		ModelAndView mv = new ModelAndView();
		String msg;
		if (interest.getIname() == null || interest.getIname().equals("")) {
			msg = "修改失败,兴趣名不能为空";
			request.setAttribute("msg", msg);
		}else{
		try {
			int rows = interestService.updateInterest(interest);
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
		mv.setViewName("redirect:/interest/findAll.action");
		return mv;
	}

	/*
	 * 查找全部兴趣接口
	 */
	@RequestMapping("/findAllJson.action")
	@ResponseBody
	public List<Interest> findAllJson(HttpServletRequest request,
			HttpServletResponse response) {

		List<Interest> iList = interestService.findAll();
		return iList;
	}

	/*
	 * 添加兴趣接口
	 */
	@RequestMapping("/addInterestJson.action")
	@ResponseBody
	public int addInterestJson(HttpServletRequest request,
			HttpServletResponse response, Interest interest) {

		int insert = interestService.insertInterest(interest);
		return insert;
	}

	/*
	 * 删除兴趣接口
	 */
	@RequestMapping("/deleteInterestByiidJson.action")
	@ResponseBody
	public int deleteInterestByiidJson(HttpServletRequest request,
			HttpServletResponse response, Integer iid) {

		int delete = interestService.deleteInterestByiid(iid);
		return delete;
	}

	/*
	 * 修改兴趣接口
	 */
	@RequestMapping("/updateInterestByiidJson.action")
	@ResponseBody
	public int updateInterestByiidJson(HttpServletRequest request,
			HttpServletResponse response, Interest interest) {

		int update = interestService.updateInterest(interest);
		return update;
	}
}
