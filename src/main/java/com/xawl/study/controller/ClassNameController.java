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
import com.xawl.study.model.ClassName;
import com.xawl.study.model.Course;
import com.xawl.study.model.Fangxiang;
import com.xawl.study.model.Resource;
import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.ClassNameService;
import com.xawl.study.utils.Result;

@Controller
@RequestMapping("/classname")
public class ClassNameController {
	// http://localhost:8080/onstudy/classname/findAll.action
	@Autowired
	ClassNameService classNameService;

	// 查询总记录数
	@RequestMapping("/countsAll.action")
	@ResponseBody
	public ModelAndView countsAllJson(HttpServletRequest request,
			HttpServletResponse reponse, int classId) {
		int counts = classNameService.countsALL(classId);
		ClassName classname = new ClassName();
		classname.setSnum(counts);
		classname.getSnum();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/table_bootstrap_classname.jsp");
		return mv;
	}

	// 查找全部
	@RequestMapping("/findAllClass.action")
	@ResponseBody
	public Result findAllClass(HttpServletRequest request,
			HttpServletResponse response) {
		List<ClassName> classNameList = classNameService.findAll();
		return Result.ok(classNameList);
	}
	//检验用户名是否可用
	// 查找全部
	@RequestMapping("/findAll.action")
	public ModelAndView findAll(HttpServletRequest request,
			HttpServletResponse response) {
		List<ClassName> classNameList = classNameService.findAll();
		for (ClassName className : classNameList) {
			className
					.setSnum(classNameService.countsALL(className.getClassId()));
		}
		request.setAttribute("classNameList", classNameList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/table_bootstrap_classname.jsp");
		return mv;
	}

	// 通过classId查找
	@RequestMapping("/selectByclassId.action")
	public ModelAndView selectByclassId(HttpServletRequest request,
			HttpServletResponse response, Integer classId) {
		ClassName classname = classNameService.selectByclassId(classId);
		request.setAttribute("classname", classname);
		ModelAndView mv = new ModelAndView();
		mv.addObject("classname", classname);
		mv.setViewName("/admin/table_bootstrap_classname.jsp");
		return mv;
	}

	/*
	 * // 添加
	 * 
	 * @RequestMapping("/insertClassName.action") public ModelAndView
	 * insertClassName(HttpServletRequest request, HttpServletResponse response,
	 * ClassName classname) { ModelAndView mv = new ModelAndView(); String
	 * sti=request.getParameter("name"); String name=classname.getName();
	 * classNameService.insertClassName(classname); if(sti.equals(name)){
	 * mv.setViewName("/classname/findAll.action"); } else{
	 * System.out.println("失败"); return null; } return mv; }
	 */
	// 添加
	@RequestMapping("/insertSelective.action")
	public ModelAndView insertSelective(HttpServletRequest request,
			HttpServletResponse response, ClassName classname) {
		ModelAndView mv = new ModelAndView();

		List<ClassName> list = classNameService.selectByName(classname
				.getName());
		if (list != null && list.size() > 0) {
			mv.setViewName("/classname/findAll.action");
			mv.addObject("msg", "班级名称重复");
			return mv;
		} else {
			classNameService.insertSelective(classname);
			mv.setViewName("/classname/findAll.action");
			return mv;
		}
	}

	// 根据classId删除
	@RequestMapping("/deleteClassNameByclassId.action")
	@Role(role=Role.ROLE_ADMIN)
	public ModelAndView deleteClassNameByclassId(HttpServletRequest request,
			HttpServletResponse response, Integer classId) {
		ModelAndView mv = new ModelAndView();
		ClassName classname = classNameService.selectByclassId(classId);
		request.setAttribute("classname", classname);
		boolean b = classNameService.deleteClassNameByclassId(classname
				.getClassId());
		mv.addObject("b", b);
		mv.setViewName("/classname/findAll.action");
		return mv;
	}

	// 修改
	/*
	 * @RequestMapping("updateByPrimaryKey.action") public ModelAndView
	 * updateByPrimaryKey(HttpServletRequest request, HttpServletResponse
	 * response,ClassName classname) { ModelAndView mv = new ModelAndView();
	 * String msg; try { int rows =
	 * classNameService.updateByPrimaryKey(classname); if(rows == 0){
	 * msg="修改失败"; request.setAttribute("msg", msg); }else{ msg="修改成功";
	 * request.setAttribute("msg", msg); } } catch (Exception e) {
	 * e.printStackTrace(); msg="发生异常，修改失败"; request.setAttribute("msg", msg); }
	 * mv.setViewName("/admin/table_bootstrap_classname.jsp"); return mv; }
	 */
	// 修改
	@RequestMapping("updateByPrimaryKeySelective.action")
	public ModelAndView updateByPrimaryKeySelective(HttpServletRequest request,
			HttpServletResponse response, ClassName classname) {
		ModelAndView mv = new ModelAndView();
		String msg;
		//System.out.println(classname + "xxxxxxxxxxxxxxxxxxxxxx");
		try {
			int rows = classNameService.updateByPrimaryKeySelective(classname);
			if (rows == 0) {
				msg = "修改失败";
				request.setAttribute("msg", msg);
			} else {
				msg = "修改成功";
				request.setAttribute("msg", msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "发生异常，修改失败";
			request.setAttribute("msg", msg);
		}
		mv.setViewName("/classname/findAll.action");
		return mv;
	}
}
