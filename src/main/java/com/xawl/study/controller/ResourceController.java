package com.xawl.study.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import com.xawl.study.model.CourseCustomer;
import com.xawl.study.model.Resource;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.CourseService;
import com.xawl.study.service.ResourceClickLogsService;
import com.xawl.study.service.ResourceService;
import com.xawl.study.service.TeacherService;
import com.xawl.study.utils.ResourceUtils;
import com.xawl.study.utils.Result;

@Controller
@RequestMapping("resource")
public class ResourceController {
	@Autowired
	ResourceService resourceService;
	@Autowired
	TeacherService teacherservice;
	@Autowired
	CourseService courseService;
	@Autowired
	ResourceClickLogsService resourceClickLogsService;

	/**
	 * 显示课程资源
	 * 
	 * @param cid
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("showCourse.action")
	public ModelAndView showCourse(Integer cid, HttpServletRequest request,
			HttpServletResponse response) {
		// System.out.println("showCourse" + "xxxxxxxxxxxxx");
		List<Resource> listR = resourceService.findByRTypeNo1(cid);
		ModelAndView md = new ModelAndView();
		md.addObject("listR", listR);
		md.setViewName("/front/showCourse.jsp");
		// System.out.println("ListR=" + listR);
		CourseCustomer courseCustomer = new CourseCustomer();
		courseCustomer.setCid(cid);
		courseCustomer = courseService.SelectCourseByCid(courseCustomer);
		Teacher teacher = courseCustomer.getDbTeacher();
		md.addObject("teacher", teacher);
		md.addObject("courseCustomer", courseCustomer);
		md.addObject("cid", cid);
		return md;
	}

	@RequestMapping("Management.action")
	public ModelAndView Management(Integer cid, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView md = new ModelAndView();
		request.getSession().setAttribute("cid", cid);
		md.setViewName("/front/courseManagement.jsp?cid=" + cid);
		return md;
	}

	/**
	 * 根据资源Id下载资源
	 * 
	 * @param request
	 * @param response
	 * @param rid
	 * @return
	 */
	@RequestMapping("download.action")
	public ModelAndView download(HttpServletRequest request,
			HttpServletResponse response, Integer rid) {
		ModelAndView md = new ModelAndView();
		Resource resource = resourceService.findByRid(rid);
		// System.out.println(resource.getResourceName());
		Map<String, String> map = new HashMap<String, String>();
		File file = ResourceUtils.getResource(request, resource.getSrc());
		boolean b = resourceClickLogsService.Record(rid, request);
		FileInputStream in = null;
		ServletOutputStream out = null;
		if (file.exists()) {
			try {
				String s = resource.getResourceName()
						+ resource.getSrc().substring(
								resource.getSrc().indexOf("."));
				String filename = new String(s.getBytes("GBK"), "ISO-8859-1");
				response.addHeader("content-disposition",
						"attachment;filename=" + filename);
				in = new FileInputStream(file);
				out = response.getOutputStream();
				// System.out.println(filename);
				IOUtils.copy(in, out);
				md.setViewName("/resource/findAll.action?cid="
						+ resource.getCid());
				return md;
			} catch (IOException e) {
				e.printStackTrace();
				map.put("map", "下载失败");
				md.addObject("msg", map);
				md.setViewName("/resource/findAll.action?cid="
						+ resource.getCid());
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
			md.setViewName("/resource/findAll.action?cid=" + resource.getCid());
			return md;
		}
	}

	@RequestMapping("downloadutiles.action")
	@ResponseBody
	public Result downloadutiles(HttpServletRequest request,
			HttpServletResponse response) {
		String filtName = request.getSession().getServletContext()
				.getRealPath("")
				+ "/" + "FormatFactory_bd_4.1.0.0_setup.exe";
		// System.out.println(filtName);
		File file = new File(filtName);
		FileInputStream in = null;
		ServletOutputStream out = null;
		if (file.exists()) {
			try {
				String s = "格式工厂.exe";
				String filename = new String(s.getBytes("GBK"), "ISO-8859-1");
				response.addHeader("content-disposition",
						"attachment;filename=" + filename);
				in = new FileInputStream(file);
				out = response.getOutputStream();
				// System.out.println(filename);
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

	/**
	 * 更改资源信息
	 * 
	 * @param request
	 * @param response
	 * @param resource
	 * @param multipartFile
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("updateResource.action")
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public ModelAndView updateResource(HttpServletRequest request,
			HttpServletResponse response, Resource resource,
			MultipartFile multipartFile, MultipartFile multipartFiles)
			throws IOException {
		if (!multipartFile.getOriginalFilename().isEmpty()) {
			Resource resources = resourceService.findByRid(resource.getRid());
			ResourceUtils.upload(request, multipartFile,
					multipartFile.getOriginalFilename());
			ResourceUtils.deleteResource(resources.getSrc(), request);
			resource.setSrc(multipartFile.getOriginalFilename());
		}
		if (!multipartFiles.getOriginalFilename().isEmpty()) {
			Resource resources = resourceService.findByRid(resource.getRid());
			ResourceUtils.upload(request, multipartFiles,
					multipartFiles.getOriginalFilename());
			ResourceUtils.deleteResource(resources.getAnswerSrc(), request);
			resource.setAnswerSrc(multipartFiles.getOriginalFilename());
		}
		Result result = resourceService.updateResource(resource);
		ModelAndView md = new ModelAndView();
		if (result.getStatus() != 200) {
			md.addObject("msg", "修改失败");
		} else {
			md.addObject("msg", "修改成功");
		}
		md.setViewName("/resource/findAllAdmin.action");
		return md;
	}

	@RequestMapping("updateTeacherResource.action")
	@ResponseBody
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public Result updateTeacherResource(HttpServletRequest request,
			HttpServletResponse response, Resource resource,
			MultipartFile multipartFile, MultipartFile multipartFiles)
			throws IOException {
		if (!multipartFile.getOriginalFilename().isEmpty()) {
			Resource resources = resourceService.findByRid(resource.getRid());
			resource.setSrc(ResourceUtils.upload(request, multipartFile,
					multipartFile.getOriginalFilename()));
			ResourceUtils.deleteResource(resources.getSrc(), request);
		}
		if (!multipartFiles.getOriginalFilename().isEmpty()) {
			Resource resources = resourceService.findByRid(resource.getRid());
			ResourceUtils.deleteResource(resources.getAnswerSrc(), request);
			resource.setAnswerSrc(ResourceUtils.upload(request, multipartFiles,
					multipartFiles.getOriginalFilename()));
		}
		Result result = resourceService.updateResource(resource);
		return result;
	}

	/**
	 * 查询资源根据资源id
	 * 
	 * @param request
	 * @param rid
	 * @return
	 */

	@RequestMapping("findByRid.action")
	public ModelAndView findByRid(HttpServletRequest request, Integer rid) {
		ModelAndView md = new ModelAndView();
		Resource resource = resourceService.findByRid(rid);
		request.setAttribute("resource", resource);
		md.addObject("resource", resource);
		// System.out.println(resource);
		md.setViewName("/front/updateResource.jsp");
		return md;
	}

	/**
	 * 增加一个资源
	 * 
	 * @param request
	 * @param response
	 * @param resource
	 * @param multipartFile
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("addResource.action")
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public ModelAndView addResource(HttpServletRequest request,
			HttpServletResponse response, Resource resource,
			MultipartFile multipartFile, MultipartFile multipartFiles)
			throws IOException {
		ModelAndView md = new ModelAndView();
		String strMsg = "";
		try {
			if (multipartFile != null) {
				try {
					if (resource.getResourceName() == null) {
						resource.setResourceName(multipartFile
								.getOriginalFilename());
					}
					resource.setSrc(ResourceUtils.upload(request,
							multipartFile, multipartFile.getOriginalFilename()));
				} catch (Exception e) {
					strMsg += "上传视频不能为空,";
					Map<String, String> map = new HashMap<String, String>();
					map.put("map", "上传失败:" + strMsg);
					e.printStackTrace();
					md.addObject("msg", map);
					md.setViewName("/resource/findAllAdmin.action?cid="
							+ resource.getCid());
					return md;
				}
			}
			if (multipartFiles != null) {
				try {
					resource.setAnswerSrc(ResourceUtils.upload(request,
							multipartFiles,
							multipartFiles.getOriginalFilename()));
					resource.setResume(multipartFiles.getOriginalFilename());
				} catch (Exception e) {
				}

			}
			resource.setDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new Date()));
			resourceService.insertResource(resource);
		} catch (Exception e) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("map", "上传失败:" + strMsg);
			e.printStackTrace();
			md.addObject("msg", map);
		}
		md.setViewName("/resource/findAllAdmin.action?cid=" + resource.getCid());
		return md;
	}

	@RequestMapping("addTeacherResource.action")
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	@ResponseBody
	public Result addTeacherResource(HttpServletRequest request,
			HttpServletResponse response, Resource resource,
			MultipartFile multipartFile, MultipartFile multipartFiles)
			throws IOException {
		// System.out.println(resource);
		try {
			if (multipartFiles.getSize() != 0) {
				try {
					if (resource.getAnswerString() == null
							|| resource.getAnswerString() == ""
							|| resource.getAnswerString().length() == 0) {
						return new Result(405, "如上传试题则试题答案不能为空", null);
					}
					resource.setAnswerSrc(ResourceUtils.upload(request,
							multipartFiles,
							multipartFiles.getOriginalFilename()));
					resource.setResume(multipartFiles.getOriginalFilename());

				} catch (Exception e) {
				}
			}
			if (multipartFile.getSize() != 0) {
				try {
					if (resource.getResourceName() == null) {
						resource.setResourceName(multipartFile
								.getOriginalFilename());
					}
					resource.setSrc(ResourceUtils.upload(request,
							multipartFile, multipartFile.getOriginalFilename()));
				} catch (Exception e) {
					e.printStackTrace();
					return new Result(405, "上传资源出错,", null);
				}
			} else {
				return new Result(405, "上传视频不能为空", null);
			}
			resource.setDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new Date()));
			resourceService.insertResource(resource);
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(405, "上传失败", null);
		}
		return new Result(200, "上传成功", null);
	}

	@RequestMapping("addTeacherResourceTwo.action")
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	@ResponseBody
	public Result addTeacherResourceTwo(HttpServletRequest request,
			HttpServletResponse response, Resource resource,
			MultipartFile multipartFile) throws IOException {
		if (resource.getResourceType() == null) {
			return Result.build(405, "资源类型不能为空");
		}
		try {
			try {
				if (multipartFile.getSize() != 0) {
					resource.setSrc(ResourceUtils.upload(request,
							multipartFile, multipartFile.getOriginalFilename()));
				} else {
					return Result.build(405, "上传资源不能为空,");
				}
			} catch (Exception e) {
				e.printStackTrace();
				return Result.build(405, "上传资源不能为空,");
			}
			resource.setDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new Date()));
			resourceService.insertResource2(resource);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "上传失败");
		}
		return new Result(200, "上传成功", null);
	}

	@RequestMapping("addResourceTwo.action")
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public ModelAndView addResourceTwo(HttpServletRequest request,
			HttpServletResponse response, Resource resource,
			MultipartFile multipartFile) throws IOException {
		ModelAndView md = new ModelAndView();
		String strMsg = "";
		// System.out.println("addResourceTwo" + "xxxxxxxxxxxxx");
		try {
			try {
				if (multipartFile != null) {
					resource.setSrc(ResourceUtils.upload(request,
							multipartFile, multipartFile.getOriginalFilename()));
				}
			} catch (Exception e) {
				strMsg += "上传视频不能为空,";
				Map<String, String> map = new HashMap<String, String>();
				map.put("map", "上传失败:" + strMsg);
				e.printStackTrace();
				md.addObject("msg", map);
				md.setViewName("/resource/findAllAdmin.action?cid="
						+ resource.getCid());
				return md;
			}
			resource.setDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new Date()));
			resourceService.insertResource(resource);
		} catch (Exception e) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("map", "上传失败");
			e.printStackTrace();
			md.addObject("msg", map);
		}
		// System.out.println(resource.getCid());
		md.setViewName("/resource/findAllAdmin.action?cid=" + resource.getCid());
		return md;
	}

	/**
	 * 查询课程下的所有资源
	 * 
	 * @param cid
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("findAll.action")
	public ModelAndView findAll(Integer cid, HttpServletRequest request,
			HttpServletResponse response) {
		// System.out.println("findAll" + "xxxxxxxxxxxxx");
		List<Resource> listR = resourceService.findAll(cid);
		ModelAndView md = new ModelAndView();
		md.addObject("listR", listR);
		md.setViewName("/front/resource.jsp");
		Teacher teacher = teacherservice.selectByPrimaryKey(listR.get(0)
				.getTid());
		md.addObject("teacher", teacher);
		CourseCustomer courseCustomer = resourceService.selectCourseByCid(cid);
		int courseCount = resourceService.selectCountVedioByCid(cid);
		courseCustomer.setCourseCount(courseCount);
		md.addObject("courseCustomer", courseCustomer);
		if (listR != null && listR.size() > 0) {
			for (Resource resource : listR) {
				if (resource.getResourceType() == 1) {
					md.addObject("rid", resource.getRid());
					break;
				}
			}

		}
		md.addObject("cid", cid);
		return md;
	}

	@RequestMapping("findAllAdmin.action")
	public ModelAndView findAllAdmin(Integer cid, HttpServletRequest request,
			HttpServletResponse response) {
		// System.out.println(cid + "=cid");
		// System.out.println("findAll" + "xxxxxxxxxxxxx");
		List<Resource> listR = resourceService.findAll(cid);
		ModelAndView md = new ModelAndView();
		md.addObject("listR", listR);
		md.setViewName("/admin/table_bootstrap_resource.jsp");
		Teacher teacher = teacherservice.selectByPrimaryKey(114);
		md.addObject("teacher", teacher);
		// System.out.println("cid=" + cid);
		CourseCustomer courseCustomer = resourceService.selectCourseByCid(cid);
		// System.out.println("courseCustomer=" + courseCustomer);
		int courseCount = resourceService.selectCountVedioByCid(cid);
		// System.out.println("courseCount=" + courseCount);
		courseCustomer.setCourseCount(courseCount);
		md.addObject("courseCustomer", courseCustomer);
		md.addObject("cid", cid);
		return md;
	}

	@RequestMapping("findAllTeacher.action")
	public ModelAndView findAllTeacher(Integer cid, HttpServletRequest request,
			HttpServletResponse response) {
		List<Resource> listR = resourceService.findAll(cid);
		ModelAndView md = new ModelAndView();
		md.addObject("listR", listR);
		md.setViewName("/front/coursemanagement_resource.jsp");
		Teacher teacher = teacherservice.selectByPrimaryKey(114);
		md.addObject("teacher", teacher);
		// System.out.println("cid=" + cid);
		CourseCustomer courseCustomer = resourceService.selectCourseByCid(cid);
		int courseCount = resourceService.selectCountVedioByCid(cid);
		courseCustomer.setCourseCount(courseCount);
		md.addObject("courseCustomer", courseCustomer);
		md.addObject("cid", cid);
		return md;
	}

	/**
	 * 删除一个资源
	 * 
	 * @param rid
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("deleteByRid.action")
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public ModelAndView deleteByRid(Integer rid, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// System.out.println("deleteByRid" + "xxxxxxxxxxxxxx");
		Resource res = resourceService.findByRid(rid);
		boolean b = resourceService.deleteByRid(rid, request);
		ModelAndView md = new ModelAndView();
		md.addObject("b", b);
		md.setViewName("/resource/findAllAdmin.action?cid=" + res.getCid());
		return md;
	}

	@RequestMapping("deleteTeacherByRid.action")
	@ResponseBody
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public Result deleteTeacherByRid(Integer rid, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		boolean b = resourceService.deleteByRid(rid, request);
		if (b) {
			return Result.ok();
		} else {
			return Result.build(405, "删除失败");
		}
	}

	@RequestMapping("deleteTeacherByRids.action")
	@ResponseBody
	@Role(role = Role.ROLE_ADMIN_AND_TEACHER)
	public Result deleteTeacherByRids(String rids, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		boolean b = resourceService.deleteByRids(rids, request);
		if (b) {
			return Result.ok();
		} else {
			return Result.build(405, "删除失败");
		}
	}

	@RequestMapping("play.action")
	@ResponseBody
	public Result play(Integer rid, HttpServletRequest request) {
		Resource result = resourceService.findByRid(rid);
		boolean b = resourceClickLogsService.Record(rid, request);
		return Result.ok(result);
	}

	@RequestMapping("isHaveDiversityVideo.action")
	@ResponseBody
	public Result isHaveDiversityVideo(Integer cid) {
		// System.out.println("sssssssssssss");
		Result result = resourceService.findByCidAndType(cid);
		return result;
	}

	@RequestMapping("findByRidJson.action")
	@ResponseBody
	public Result findByRidJson(Integer rid) {
		try {
			Resource resource = resourceService.findByRid(rid);
			return Result.ok(resource);
		} catch (Exception e) {
			return Result.build(405, "查询失败");
		}

	}
}
