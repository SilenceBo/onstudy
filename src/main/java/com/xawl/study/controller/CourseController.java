package com.xawl.study.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.xawl.study.interceptor.Role;
import com.xawl.study.model.Course;
import com.xawl.study.model.CourseCustomer;
import com.xawl.study.model.Fangxiang;
import com.xawl.study.model.Interest;
import com.xawl.study.model.Major;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.CourseService;
import com.xawl.study.service.FangxiangService;
import com.xawl.study.service.InterestService;
import com.xawl.study.service.MajorService;
import com.xawl.study.utils.Result;
import com.xawl.study.utils.UploadImages;

/**
 * 课程的controller层
 * 
 * @author zb
 * 
 */
@Controller
@RequestMapping("/course")
public class CourseController {

	@Autowired
	private CourseService courseService;
	@Autowired
	private FangxiangService fangxiangService;
	@Autowired
	private InterestService interestService;
	@Autowired
	private MajorService majorService;

	/**
	 * 查出所有的课程
	 * 
	 * @param request
	 * @param response
	 * @return 返回到后端页面
	 */
	@RequestMapping("/findAll.action")
	public ModelAndView findAll(HttpServletRequest request,
			HttpServletResponse response) {

		List<CourseCustomer> courseList = courseService.findAll();
		request.setAttribute("courseList", courseList);

		List<Fangxiang> fList = fangxiangService.findAll();
		request.setAttribute("fList", fList);
		List<Interest> iList = interestService.findAll();
		request.setAttribute("iList", iList);
		List<Major> mList = majorService.findAll();
		request.setAttribute("mList", mList);

		ModelAndView mv = new ModelAndView();
		// /HT/table_bootstrap_course.jsp /jsp/course.jsp
		mv.setViewName("/admin/table_bootstrap_course.jsp");
		return mv;
	}

	@RequestMapping("/findAllJson.action")
	@ResponseBody
	public Result findAllJson(HttpServletRequest request,
			HttpServletResponse response) {
		List<CourseCustomer> courseList = courseService.findAll();
		return Result.ok(courseList);
	}

	/**
	 * 查出所有有資源的課程
	 * 
	 * @param request
	 * @param response
	 * @return 返回到后端页面
	 */
	@RequestMapping("/findHavaResCou.action")
	public ModelAndView findHavaResCou(HttpServletRequest request,
			HttpServletResponse response) {

		List<CourseCustomer> courseList = courseService.findHavaResCou();
		request.setAttribute("courseList", courseList);

		List<Fangxiang> fList = fangxiangService.findAll();
		request.setAttribute("fList", fList);
		List<Interest> iList = interestService.findAll();
		request.setAttribute("iList", iList);
		List<Major> mList = majorService.findAll();
		request.setAttribute("mList", mList);

		ModelAndView mv = new ModelAndView();
		// /HT/table_bootstrap_course.jsp /jsp/course.jsp
		mv.setViewName("/admin/table_bootstrap_course.jsp");
		return mv;
	}

	/**
	 * 查出所有无資源的課程
	 * 
	 * @param request
	 * @param response
	 * @return 返回到后端页面
	 */
	@RequestMapping("/findNotHavaResCou.action")
	public ModelAndView findNotHavaResCou(HttpServletRequest request,
			HttpServletResponse response) {

		List<CourseCustomer> courseList = courseService.findNotHavaResCou();
		request.setAttribute("courseList", courseList);

		List<Fangxiang> fList = fangxiangService.findAll();
		request.setAttribute("fList", fList);
		List<Interest> iList = interestService.findAll();
		request.setAttribute("iList", iList);
		List<Major> mList = majorService.findAll();
		request.setAttribute("mList", mList);

		ModelAndView mv = new ModelAndView();
		// /HT/table_bootstrap_course.jsp /jsp/course.jsp
		mv.setViewName("/admin/table_bootstrap_course.jsp");
		return mv;
	}

	/**
	 * 查出所有有视频的課程
	 * 
	 * @param request
	 * @param response
	 * @return 返回到后端页面
	 */
	@RequestMapping("/findHavaVideoCou.action")
	public ModelAndView findHavaVideoCou(HttpServletRequest request,
			HttpServletResponse response) {

		List<CourseCustomer> courseList = courseService.findHavaVideoCou();
		request.setAttribute("courseList", courseList);

		List<Fangxiang> fList = fangxiangService.findAll();
		request.setAttribute("fList", fList);
		List<Interest> iList = interestService.findAll();
		request.setAttribute("iList", iList);
		List<Major> mList = majorService.findAll();
		request.setAttribute("mList", mList);

		ModelAndView mv = new ModelAndView();
		// /HT/table_bootstrap_course.jsp /jsp/course.jsp
		mv.setViewName("/admin/table_bootstrap_course.jsp");
		return mv;
	}

	/**
	 * 查出所有无视频的課程
	 * 
	 * @param request
	 * @param response
	 * @return 返回到后端页面
	 */
	@RequestMapping("/findNotHavaVideoCou.action")
	public ModelAndView findNotHavaVideoCou(HttpServletRequest request,
			HttpServletResponse response) {

		List<CourseCustomer> courseList = courseService.findNotHavaVideoCou();
		request.setAttribute("courseList", courseList);

		List<Fangxiang> fList = fangxiangService.findAll();
		request.setAttribute("fList", fList);
		List<Interest> iList = interestService.findAll();
		request.setAttribute("iList", iList);
		List<Major> mList = majorService.findAll();
		request.setAttribute("mList", mList);

		ModelAndView mv = new ModelAndView();
		// /HT/table_bootstrap_course.jsp /jsp/course.jsp
		mv.setViewName("/admin/table_bootstrap_course.jsp");
		return mv;
	}

	/**
	 * 查出所有有作业的課程
	 * 
	 * @param request
	 * @param response
	 * @return 返回到后端页面
	 */
	@RequestMapping("/findHavaWorkCou.action")
	public ModelAndView findHavaWorkCou(HttpServletRequest request,
			HttpServletResponse response) {

		List<CourseCustomer> courseList = courseService.findHavaWorkCou();
		request.setAttribute("courseList", courseList);

		List<Fangxiang> fList = fangxiangService.findAll();
		request.setAttribute("fList", fList);
		List<Interest> iList = interestService.findAll();
		request.setAttribute("iList", iList);
		List<Major> mList = majorService.findAll();
		request.setAttribute("mList", mList);

		ModelAndView mv = new ModelAndView();
		// /HT/table_bootstrap_course.jsp /jsp/course.jsp
		mv.setViewName("/admin/table_bootstrap_course.jsp");
		return mv;
	}

	/**
	 * 查出所有无作业的課程
	 * 
	 * @param request
	 * @param response
	 * @return 返回到后端页面
	 */
	@RequestMapping("/findNotHavaWorkCou.action")
	public ModelAndView findNotHavaWorkCou(HttpServletRequest request,
			HttpServletResponse response) {

		List<CourseCustomer> courseList = courseService.findNotHavaWorkCou();
		request.setAttribute("courseList", courseList);

		List<Fangxiang> fList = fangxiangService.findAll();
		request.setAttribute("fList", fList);
		List<Interest> iList = interestService.findAll();
		request.setAttribute("iList", iList);
		List<Major> mList = majorService.findAll();
		request.setAttribute("mList", mList);

		ModelAndView mv = new ModelAndView();
		// /HT/table_bootstrap_course.jsp /jsp/course.jsp
		mv.setViewName("/admin/table_bootstrap_course.jsp");
		return mv;
	}

	/**
	 * 查出所有的课程
	 * 
	 * @param request
	 * @param response
	 * @return 返回到前端页面
	 */
	@RequestMapping("/findAllFront.action")
	public ModelAndView findAllFront(HttpServletRequest request,
			HttpServletResponse response, Integer fid, Integer iid,
			Integer page, Integer grade, Integer mid, String text) {
		System.out.println(text);
		if (fid == null && iid == null && grade == null && mid == null
				&& (text == null || text.isEmpty())) {
			PageInfo<CourseCustomer> pageInfo = courseService
					.findAllFront(page);
			request.setAttribute("pageInfo", pageInfo);
		}
		if (fid == null && iid != null) {
			PageInfo<CourseCustomer> pageInfo = courseService
					.selectCourseByiid(iid, page);
			request.setAttribute("pageInfo", pageInfo);
		}
		if (fid != null && iid != null) {
			PageInfo<CourseCustomer> pageInfo = courseService
					.selectCourseByfid(fid, page);
			request.setAttribute("pageInfo", pageInfo);
		}

		if (grade != null && mid == null) {
			PageInfo<CourseCustomer> pageInfo = courseService
					.selectCourseBygrade(grade, page);
			request.setAttribute("pageInfo", pageInfo);
		}
		if (grade != null && mid != null) {
			PageInfo<CourseCustomer> pageInfo = courseService
					.selectCourseBymid(grade, mid, page);
			request.setAttribute("pageInfo", pageInfo);
		}
		if (text != null && !text.isEmpty()) {
			PageInfo<CourseCustomer> pageInfo = courseService
					.selectCourseByText(text, page);
			request.setAttribute("pageInfo", pageInfo);
		}

		List<Fangxiang> fxList = fangxiangService.selectFangxiangByiid(iid);
		request.setAttribute("fxList", fxList);

		List<Interest> iList = interestService.findAll();
		request.setAttribute("iList", iList);

		List<Major> mList = majorService.findAll();
		request.setAttribute("mList", mList);

		request.setAttribute("iid", iid);
		request.setAttribute("fid", fid);
		request.setAttribute("grade", grade);
		request.setAttribute("mid", mid);
		request.setAttribute("text", text);

		ModelAndView mv = new ModelAndView();
		// /HT/table_bootstrap_course.jsp /jsp/course.jsp
		mv.setViewName("/front/course.jsp");
		return mv;
	}

	/**
	 * 添加课程
	 * 
	 * @param request
	 * @param response
	 * @param course
	 * @param file
	 * @return 返回到后端页面
	 */
	@RequestMapping("/addCourse.action")
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public ModelAndView addCourse(HttpServletRequest request,
			HttpServletResponse response, Course course, MultipartFile file) {

		ModelAndView mv = new ModelAndView();
		String msg;
		if (course.getCname() == null || course.getCname().equals("")) {
			msg = "添加失败,课程名不能为空";
			request.setAttribute("msg", msg);
			mv.setViewName("redirect:/course/findAll.action");
			return mv;
		}
		course.setDate(new SimpleDateFormat("yyyy-MM--dd").format(new Date()));

		// 图片上传
		UploadImages uploadImage = new UploadImages();
		String path1 = request.getSession().getServletContext()
				.getRealPath("/"); // 上传的路径
		String path2 = "CourseImages"; // 保存的文件夹
		String bigImg = uploadImage.upLoadImage(request, file, path1, path2);
		if (!bigImg.contains(".")) {
			msg = "未选择文件";
			request.setAttribute("msg", msg);
		}
		course.setImage(bigImg);
		try {
			int rows = courseService.insertCourse(course);
			if (rows == 0) {
				msg = "添加失败,插入数据库失败";
				request.setAttribute("msg", msg);
			} else {
				msg = "添加成功";
				request.setAttribute("msg", msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "添加失败,服务器异常";
			request.setAttribute("msg", msg);
		}
		mv.setViewName("redirect:/course/findAll.action");
		return mv;
	}

	/**
	 * 删除课程
	 * 
	 * @param request
	 * @param response
	 * @return 返回到后端页面
	 */
	@RequestMapping("/deleteCourse.action")
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public ModelAndView deleteCourseBycid(HttpServletRequest request,
			HttpServletResponse response) {
		String ids = request.getParameter("ids");
		// System.out.println(ids.length() + "________________" + ids);
		ModelAndView mv = new ModelAndView();
		String msg;

		if (ids.length() != 0) {
			int rows = courseService.deleteCourseBycid(ids, request);
			if (rows == 0) {
				msg = "删除失败,此id不存在";
				request.setAttribute("msg", msg);
			} else {
				msg = "删除成功";
				request.setAttribute("msg", msg);
			}
		}
		mv.setViewName("redirect:/course/findAll.action");
		return mv;
	}

	/**
	 * 修改课程
	 * 
	 * @param request
	 * @param response
	 * @param course
	 * @param file
	 * @return 返回到后端页面
	 */
	@RequestMapping("/updateCourse.action")
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public ModelAndView updateCourse(HttpServletRequest request,
			HttpServletResponse response, Course course, MultipartFile file) {
		// System.out.println("***************************************" +
		// course);
		ModelAndView mv = new ModelAndView();
		String msg;
		if (course.getCname() == null || course.getCname().equals("")) {
			msg = "修改失败,课程名不能为空";
			request.setAttribute("msg", msg);
			mv.setViewName("redirect:/course/findAll.action");
			return mv;
		}

		// 图片上传
		UploadImages uploadImage = new UploadImages();
		String path1 = request.getSession().getServletContext()
				.getRealPath("/"); // 上传的路径
		String path2 = "CourseImages"; // 保存的文件夹
		String bigImg = uploadImage.upLoadImage(request, file, path1, path2);
		if (!bigImg.contains(".")) {
			course.setImage(null);
		} else {
			CourseCustomer courseCustomer = new CourseCustomer();
			courseCustomer.setCid(course.getCid());
			courseCustomer = courseService.SelectCourseByCid(courseCustomer);

			File image = new File(path1 + courseCustomer.getImage());
			// System.out.println(image);
			if (image.exists()) {
				image.delete();
			}
			course.setImage(bigImg);
		}
		try {
			int rows = courseService.updateCourse(course);
			if (rows == 0) {
				msg = "修改失败,注入数据库失败";
				request.setAttribute("msg", msg);
			} else {
				msg = "修改成功";
				request.setAttribute("msg", msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "修改失败,服务器异常";
			request.setAttribute("msg", msg);
		}
		mv.setViewName("redirect:/course/findAll.action");
		return mv;
	}

	/**
	 * 按照课程id查找课程
	 * 
	 * @param request
	 * @param response
	 * @param courseCustomer
	 * @return
	 */
	@RequestMapping("/SelectCourseJsonByCid.action")
	@ResponseBody
	public CourseCustomer SelectCourseJsonByCid(HttpServletRequest request,
			HttpServletResponse response, CourseCustomer courseCustomer) {

		CourseCustomer courseOne = courseService
				.SelectCourseByCid(courseCustomer);
		return courseOne;
	}

	@RequestMapping("/SelectCourseBycid.action")
	@ResponseBody
	public Result SelectCourseBycid(HttpServletRequest request,
			HttpServletResponse response, CourseCustomer courseCustomer) {

		CourseCustomer courseOne = courseService
				.SelectCourseByCid(courseCustomer);
		if (courseOne != null) {
			return Result.ok();
		} else {
			return Result.build(500, "失败");
		}
	}

	@RequestMapping("/SelectCourseBycidTwo.action")
	@ResponseBody
	public Result SelectCourseBycidTwo(HttpServletRequest request,
			HttpServletResponse response, CourseCustomer courseCustomer) {

		CourseCustomer courseOne = courseService
				.SelectCourseByCidTwo(courseCustomer);
		if (courseOne != null) {
			return Result.ok();
		} else {
			return Result.build(500, "失败");
		}
	}

	@RequestMapping("/SelectCourseBytid.action")
	@ResponseBody
	public Result SelectCourseBytid(HttpServletRequest request) {
		Teacher teacher = (Teacher) request.getSession().getAttribute(
				"user_teacher");

		Result result = courseService.SelectCourseBytid(teacher.getTid());
		return result;
	}

	/**
	 * 修改课程
	 * 
	 * @param request
	 * @param response
	 * @param course
	 * @param file
	 * @return 返回json
	 */
	@RequestMapping("/updateCourseJson.action")
	@ResponseBody
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public Result updateCourseJson(HttpServletRequest request,
			HttpServletResponse response, Course course, MultipartFile file) {
		// System.out.println("***************************************" +
		// course);
		Result result = new Result();
		String msg;
		if (course.getCname() == null || course.getCname().equals("")) {
			msg = "修改失败,课程名不能为空";
			result.setStatus(500);
			result.setMsg(msg);
			return result;
		}

		// 图片上传
		UploadImages uploadImage = new UploadImages();
		String path1 = request.getSession().getServletContext()
				.getRealPath("/"); // 上传的路径
		String path2 = "CourseImages"; // 保存的文件夹
		// System.out.println("&&&&&&&&&&&&&&&&&&&"+file.getSize());
		if (file != null) {
			if (file.getSize() > 1024 * 1024) {
				return Result.build(502, "图片不能大于1M");
			}
		}
		String bigImg = uploadImage.upLoadImage(request, file, path1, path2);
		if (!bigImg.contains(".")) {
			course.setImage(null);
		} else {
			CourseCustomer courseCustomer = new CourseCustomer();
			courseCustomer.setCid(course.getCid());
			courseCustomer = courseService.SelectCourseByCid(courseCustomer);

			File image = new File(path1 + courseCustomer.getImage());
			// System.out.println(image);
			if (image.exists()) {
				image.delete();
			}
			course.setImage(bigImg);
		}
		try {
			int rows = courseService.updateCourse(course);
			if (rows == 0) {
				msg = "修改失败,注入数据库失败";
				result.setStatus(500);
				result.setMsg(msg);
			} else {
				msg = "修改成功";
				result.setStatus(200);
				result.setMsg(msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "修改失败,服务器异常";
			result.setStatus(500);
			result.setMsg(msg);
			return result;
		}
		return result;
	}

	/**
	 * 添加课程
	 * 
	 * @param request
	 * @param response
	 * @param course
	 * @param file
	 * @return 返回到后端页面
	 */
	@RequestMapping("/insertCourseJson.action")
	@ResponseBody
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public Result insertCourseJson(HttpServletRequest request,
			HttpServletResponse response, Course course, MultipartFile file) {

		Result result = new Result();
		String msg;
		if (course.getCname() == null || course.getCname().equals("")) {
			msg = "添加失败,课程名不能为空";
			result.setStatus(500);
			result.setMsg(msg);
			return result;
		}
		course.setDate(new SimpleDateFormat("yyyy-MM--dd").format(new Date()));

		// 图片上传
		UploadImages uploadImage = new UploadImages();
		String path1 = request.getSession().getServletContext()
				.getRealPath("/"); // 上传的路径
		String path2 = "CourseImages"; // 保存的文件夹
		// System.out.println("&&&&&&&&&&&&&&&&&&&"+file.getSize());
		if (file != null) {
			if (file.getSize() > 1024 * 1024) {
				return Result.build(502, "图片不能大于1M");
			}
		}
		String bigImg = uploadImage.upLoadImage(request, file, path1, path2);
		if (!bigImg.contains(".")) {
			msg = "未选择文件";
			result.setStatus(500);
			result.setMsg(msg);
		}
		course.setImage(bigImg);
		try {
			int rows = courseService.insertCourse(course);
			if (rows == 0) {
				msg = "添加失败,插入数据库失败";
				result.setStatus(500);
				result.setMsg(msg);
			} else {
				msg = "添加成功";
				result.setStatus(200);
				result.setMsg(msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "添加失败,服务器异常";
			result.setStatus(500);
			result.setMsg(msg);
		}
		return result;
	}

	/**
	 * 删除课程
	 * 
	 * @param request
	 * @param response
	 * @return 返回json
	 */
	@RequestMapping("/deleteCourseJson.action")
	@ResponseBody
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public Result deleteCourseJson(HttpServletRequest request,
			HttpServletResponse response) {
		String ids = request.getParameter("ids");
		// System.out.println(ids.length() + "________________" + ids);
		Result result = new Result();
		String msg;

		if (ids.length() != 0) {
			int rows = courseService.deleteCourseBycid(ids, request);
			if (rows == 0) {
				msg = "删除失败";
				result.setStatus(500);
				result.setMsg(msg);
			} else {
				msg = "删除成功";
				result.setStatus(200);
				result.setMsg(msg);
			}
		}
		return result;
	}

	@RequestMapping("/linkNum.action")
	@ResponseBody
	public Result linkNum(HttpServletRequest request,
			HttpServletResponse response, Integer cid) {
		Result result = new Result();
		String msg;
		if (verifyCookies(request, response, String.valueOf(cid))) {
			courseService.updateLinkNum(cid);
			msg = "点赞成功";
			result.setStatus(200);
			result.setMsg(msg);
		} else {
			msg = "已经点赞";
			result.setStatus(500);
			result.setMsg(msg);
		}

		return result;
	}

	@RequestMapping("/linkNumDel.action")
	@ResponseBody
	public Result linkNumDel(HttpServletRequest request,
			HttpServletResponse response, Integer cid) {
		Cookie cookies[] = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals(String.valueOf(cid))) {
					cookies[i].setValue(null);
					cookies[i].setMaxAge(0);// 立即销毁cookie
					cookies[i].setPath("/");
					courseService.updateLinkNumDel(cid);
					return Result.build(200, "取消成功");
				}
			}
		}

		return Result.build(500, "失败");
	}

	public boolean verifyCookies(HttpServletRequest request,
			HttpServletResponse response, String id) {
		Cookie cookies[] = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getValue().equals(id)) {
					return false;
				}
			}
		}
		Cookie _cookie = new Cookie(id, id);
		_cookie.setMaxAge(60 * 60 * 24 * 7);
		_cookie.setPath("/");
		response.addCookie(_cookie);
		return true;
	}

	/*
	 * @RequestMapping("/SelectCourse.action") public ModelAndView
	 * SelectCourse(HttpServletRequest request, HttpServletResponse response,
	 * CourseCustomer courseCustomer, Integer page ) {
	 * 
	 * List<CourseCustomer> courseList =
	 * courseService.SelectCourse(courseCustomer,page);
	 * request.setAttribute("courseList", courseList); ModelAndView mv = new
	 * ModelAndView(); mv.setViewName("/jsp/course.jsp"); return mv; }
	 * 
	 * @RequestMapping("/SelectCourseByAll.action") public ModelAndView
	 * SelectCourseByAll(HttpServletRequest request, HttpServletResponse
	 * response, CourseCustomer courseCustomer, Integer page ) {
	 * 
	 * List<CourseCustomer> courseList =
	 * courseService.SelectCourseByAll(courseCustomer,page);
	 * request.setAttribute("courseList", courseList); ModelAndView mv = new
	 * ModelAndView(); mv.setViewName("/jsp/course.jsp"); return mv; }
	 * 
	 * @RequestMapping("/SelectCourseByCid.action") public ModelAndView
	 * SelectCourseByCid(HttpServletRequest request, HttpServletResponse
	 * response, CourseCustomer courseCustomer ) {
	 * 
	 * CourseCustomer courseOne =
	 * courseService.SelectCourseByCid(courseCustomer);
	 * request.setAttribute("courseOne", courseOne);
	 * System.out.println(courseOne); ModelAndView mv = new ModelAndView();
	 * mv.setViewName("/course/findAll.action"); return mv; }
	 */
}
