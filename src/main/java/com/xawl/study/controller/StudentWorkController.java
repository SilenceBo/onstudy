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

import com.xawl.study.model.Student;
import com.xawl.study.model.StudentWork;
import com.xawl.study.service.StudentWorkService;
import com.xawl.study.utils.Result;
import com.xawl.study.utils.WorkUtils;

@Controller
@RequestMapping("/studentWork")
public class StudentWorkController {

	@Autowired
	StudentWorkService studentWorkService;

	@RequestMapping("/findByTwid.action")
	@ResponseBody
	public Result findByTwid(Integer twid) {
		Result result = studentWorkService.findBuTwid(twid);
		return result;
	}

	@RequestMapping("/findByTwidOrSid.action")
	@ResponseBody
	public Result findByTwidOrSid(Integer twid, Integer sid) {
		Result result = studentWorkService.findByTwidOrSid(twid, sid);
		return result;
	}

	@RequestMapping("/findByTwidOrCid.action")
	@ResponseBody
	public Result findByTwidOrCid(Integer twid, Integer cid) {
		Result result = studentWorkService.findByTwidOrCid(twid, cid);
		return result;
	}

	@RequestMapping("/commitWork.action")
	@ResponseBody
	public Result commitWork(HttpServletRequest request,
			StudentWork studentWork, MultipartFile files) {
		if (files.getSize() <= 0) {
			return Result.build(405, "上传文件不能为空");
		}
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		studentWork.setSid(Integer.parseInt(student.getId()));
		studentWork.setSname(student.getSname());
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date());
		studentWork.setDate(date);
		studentWork.setFilename(files.getOriginalFilename());
		Result result = studentWorkService.addWork(studentWork, request, files);
		return result;
	}

	@RequestMapping("/updateWork.action")
	@ResponseBody
	public Result updateWork(HttpServletRequest request,
			StudentWork studentWork, MultipartFile files) {
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		if (files.getSize() <= 0) {
			return Result.build(405, "上传文件不能为空");
		}
		studentWork.setSid(Integer.parseInt(student.getId()));
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date());
		studentWork.setDate(date);
		Result result = studentWorkService.updateWork(studentWork, request,
				files);
		return result;
	}

	@RequestMapping("/deleteByTwid.action")
	@ResponseBody
	public Result deleteByTwid(Integer twid, HttpServletRequest request) {
		Result result = studentWorkService.deleteByTwid(twid, request);
		return result;
	}

	@RequestMapping("/deleteBySwid.action")
	@ResponseBody
	public Result deleteBySwid(Integer swid) {
		Result result = studentWorkService.deleteBySwid(swid);
		return result;
	}

	@RequestMapping("/download.action")
	public ModelAndView download(HttpServletRequest request,
			HttpServletResponse response, Integer swid)
			throws UnsupportedEncodingException {
		ModelAndView md = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		StudentWork studentWork = studentWorkService.findBySwid(swid);
		File file = WorkUtils.getWrok(request, studentWork.getFile());
		FileInputStream in = null;
		ServletOutputStream out = null;
		if (file.exists()) {
			try {
				// String s = studentWork.getSname() +
				// studentWork.getFile().substring(
				// studentWork.getFile().indexOf("."));
				String s = studentWork.getFilename().replaceAll(" ","");
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

	@RequestMapping("/Sdownload.action")
	public ModelAndView sDownload(HttpServletRequest request,
			HttpServletResponse response, Integer swid)
			throws UnsupportedEncodingException {
		ModelAndView md = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		StudentWork studentWork = studentWorkService.findBySwid(swid);
		File file = WorkUtils.getWrok(request, studentWork.getFile());
		FileInputStream in = null;
		ServletOutputStream out = null;
		if (file.exists()) {
			try {
				/*String s = studentWork.getFilename()
						+ studentWork.getFile().substring(
								studentWork.getFile().indexOf("."));*/
				String s = studentWork.getFilename().replaceAll(" ","");
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

	@RequestMapping("/mark.action")
	@ResponseBody
	public Result mark(StudentWork studentWork) {
		Result result = studentWorkService.addMark(studentWork);
		return result;
	}
}
