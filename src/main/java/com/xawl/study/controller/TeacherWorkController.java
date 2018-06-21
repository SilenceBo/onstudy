package com.xawl.study.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.xawl.study.interceptor.Role;
import com.xawl.study.model.Student;
import com.xawl.study.model.StudentWork;
import com.xawl.study.model.Teacher;
import com.xawl.study.model.TeacherWork;
import com.xawl.study.service.TeacherWorkServcie;
import com.xawl.study.utils.Result;
import com.xawl.study.utils.WorkUtils;

@Controller
@RequestMapping("/teacherWork")
public class TeacherWorkController {
	@Autowired
	TeacherWorkServcie teacherWorkService;

	// 发布作业
	@RequestMapping("/arrangementWork.action")
	@ResponseBody
	@Role(role = Role.ROLE_TEACHER)
	public Result arrangementWork(TeacherWork teacherWork,
			HttpServletRequest request, MultipartFile Mfile) {
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date());
		teacherWork.setDate(date);
		if (!Mfile.isEmpty()) {
			try {
				teacherWork.setFile(WorkUtils.upload(request, Mfile));
			} catch (IOException e) {
				e.printStackTrace();
				return Result.build(405, "作业发布失败");
			}
		}
		Result result = teacherWorkService.insertWork(teacherWork);
		return result;
	}

	@RequestMapping("/myWork.action")
	@ResponseBody
	public Result findByCid(HttpServletRequest request, Integer cid) {
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		Result result = teacherWorkService.findByCid(cid, student.getId());
		return result;
	}

	@RequestMapping("/deleteWork.action")
	@ResponseBody
	@Role(role = Role.ROLE_TEACHER)
	public Result deleteWork(Integer twid, HttpServletRequest request) {
		Result result = teacherWorkService.deleteWork(twid, request);
		return result;
	}

	@RequestMapping("/updateWork.action")
	@ResponseBody
	@Role(role = Role.ROLE_TEACHER)
	public Result updateWork(HttpServletRequest request,
			MultipartFile multipartFile, TeacherWork teacherWork) {
		// System.out.println(teacherWork);
		Result result = teacherWorkService.updateWork(request, multipartFile,
				teacherWork);
		return result;

	}

	@RequestMapping("/findByTidOrCid.action")
	@ResponseBody
	public Result findByTidOrCid(HttpServletRequest request, Integer cid) {
		Teacher teacher = (Teacher) request.getSession().getAttribute(
				"user_teacher");
		Result result = teacherWorkService
				.findByTidOrCid(teacher.getTid(), cid);
		return result;
	}

	@RequestMapping("/findByTwid.action")
	@ResponseBody
	public Result findByTwid(HttpServletRequest request, Integer twid) {
		Result result = teacherWorkService.findByTwid(twid);
		return result;
	}

	@RequestMapping("/commitWork.action")
	@ResponseBody
	public Result commitWork(HttpServletRequest request,
			TeacherWork teacherWork, MultipartFile files, Integer cid) {
		if (files.getSize() <= 0) {
			return Result.build(405, "上传文件不能为空");
		}
		Teacher teacher = (Teacher) request.getSession().getAttribute(
				"user_teacher");
		teacherWork.setTid(teacher.getTid());
		teacherWork.setCid(cid);
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date());
		teacherWork.setDate(date);
		Result result = teacherWorkService.addWork(teacherWork, request, files);
		return result;
	}

	@RequestMapping("/download.action")
	public ModelAndView download(HttpServletRequest request,
			HttpServletResponse response, Integer twid)
			throws UnsupportedEncodingException {
		ModelAndView md = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		TeacherWork teacherWork = (TeacherWork) teacherWorkService.findByTwid(
				twid).getData();
		File file = WorkUtils.getWrok(request, teacherWork.getFile());
		FileInputStream in = null;
		ServletOutputStream out = null;
		if (file.exists()) {
			try {
				String s = teacherWork.getTitle()
						+ teacherWork.getFile().substring(
								teacherWork.getFile().indexOf("."));
				String filename = new String(s.getBytes("GBK"), "ISO-8859-1");
				response.addHeader("content-disposition",
						"attachment;filename=" + filename);
				in = new FileInputStream(file);
				out = response.getOutputStream();
				// System.out.println(filename);
				IOUtils.copy(in, out);
				return md;
			} catch (IOException e) {
				e.printStackTrace();
				map.put("map", "下载失败");
				md.addObject("msg", map);
				return md;
			} finally {
				try {
					in.close();
					out.flush();
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			map.put("map", "下载的文件不存在");
			md.addObject("msg", map);
			return md;
		}
	}

	@RequestMapping("downloadWorkUtils.action")
	@ResponseBody
	public Result downloadutiles(HttpServletRequest request,
			HttpServletResponse response) {
		String filtName = request.getSession().getServletContext()
				.getRealPath("")
				+ "/" + "Workutils.zip";
		System.out.println(filtName);
		File file = new File(filtName);
		FileInputStream in = null;
		ServletOutputStream out = null;
		if (file.exists()) {
			try {
				String s = "作业批量下载工具.zip";
				String filename = new String(s.getBytes("GBK"), "ISO-8859-1");
				response.addHeader("content-disposition",
						"attachment;filename=" + filename);
				in = new FileInputStream(file);
				out = response.getOutputStream();
				System.out.println(filename);
				IOUtils.copy(in, out);
				return Result.ok();
			} catch (IOException e) {
				e.printStackTrace();
				return Result.build(405, "操作失败 请联系管理员");
			} finally {
				try {
					in.close();
					out.flush();
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			return Result.build(405, "操作失败 请联系管理员");
		}
	}
}
