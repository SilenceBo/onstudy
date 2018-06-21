package com.xawl.study.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xawl.study.dao.IpMapper;
import com.xawl.study.interceptor.Role;
import com.xawl.study.model.Student;
import com.xawl.study.service.StudentService;
import com.xawl.study.utils.Const;
import com.xawl.study.utils.IpUtils;
import com.xawl.study.utils.JsonUtils;
import com.xawl.study.utils.Mail;
import com.xawl.study.utils.MailUtils;
import com.xawl.study.utils.Result;
import com.xawl.study.utils.SendEmails;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	ExecutorService threadPoll = Executors.newFixedThreadPool(128);
	@Autowired
	IpMapper ipMapper;
	@Autowired
	StudentService studentService;

	@RequestMapping("updatePWD.action")
	@ResponseBody
	public Result updatePWD(HttpServletRequest request,
			HttpServletResponse response, String oldPwd, String pwd) {
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		if (!student.getPwd().equals(oldPwd)) {
			return Result.build(405, "原始密码错误");
		} else {
			return studentService.updatePass(student.getId(), pwd);
		}
	}

	@RequestMapping("updatePass.action")
	@ResponseBody
	public Result updatePass(HttpServletRequest request,
			HttpServletResponse response, String account, String pwd) {
		Result result = studentService.updatePassByAccount(account, pwd);
		return result;
	}

	@RequestMapping("/updatePassPage.action")
	public ModelAndView updatePassPage(HttpServletRequest request,
			HttpServletResponse response, String account) {
		ModelAndView mv = new ModelAndView();
		request.setAttribute("account", account);
		mv.setViewName("/front/updatePass.jsp");
		return mv;
	}

	@RequestMapping("/findPass.action")
	@ResponseBody
	public Result findPass(HttpServletRequest request,
			HttpServletResponse response, String account, String email)
			throws IOException {
		Result result = studentService.findPass(account, email);
		if (result.getStatus() == 200) {
			Properties props = new Properties();
			props.load(this.getClass().getClassLoader()
					.getResourceAsStream("email_findPass.properties"));
			String host = props.getProperty("host");// 获取服务器主机
			String uname = props.getProperty("uname");// 获取用户名
			String pwd = props.getProperty("pwd");// 获取密码
			String from = props.getProperty("from");// 获取发件人
			String to = email;// 获取收件人
			String subject = props.getProperty("subject");// 获取主题
			String content = props.getProperty("content");// 获取邮件内容
			content = MessageFormat.format(content, account);// 替换{0}

			Session session = MailUtils.createSession(host, uname, pwd);// 得到session
			Mail mail = new Mail(from, to, subject, content);// 创建邮件对象
			try {
				MailUtils.send(session, mail);// 发邮件
			} catch (Exception e) {
				result.setStatus(500);
				result.setMsg("邮件发送失败");
				return result;
			}
			return result;
		} else {
			return result;
		}
	}

	@RequestMapping("/active.action")
	public ModelAndView active(HttpServletRequest request,
			HttpServletResponse response, String code) {
		ModelAndView mv = new ModelAndView();
		int status = studentService.updateCode(code);
		if (status == 0) {
			request.setAttribute("message", "激活码无效");
		}
		if (status == 1) {
			request.setAttribute("status", 1);
			request.setAttribute("message", "激活成功");
		}
		if (status == 2) {
			request.setAttribute("message", "您已经激活了，不要重复激活！");
		}
		mv.setViewName("/front/active.jsp");
		return mv;
	}

	@RequestMapping("/updateByAccount.action")
	@ResponseBody
	public Result updateByAccount(Student student, HttpServletRequest request) {
		// System.out.println("student=" + student);
		Result result = studentService.updateByAccount(student, request);
		return result;
	}

	@RequestMapping("/signOut.action")
	public ModelAndView signOut(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		request.getSession().invalidate();
		mv.setViewName("/front/index.jsp");
		return mv;
	}

	// 登录
	@RequestMapping("/login.action")
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response, Student student)
			throws UnsupportedEncodingException {
		Result res = studentService.login(request, student);
		ModelAndView mv = new ModelAndView();
		if (res.getStatus() == 200) {
			Student stu = (Student) res.getData();

			Cookie cookie = new Cookie("loginStudent", URLEncoder.encode(
					stu.getSname(), "UTF-8"));
			cookie.setMaxAge(30 * 60);
			Cookie cookie2 = new Cookie("student", URLEncoder.encode(
					JsonUtils.objectToJson(stu), "UTF-8"));
			cookie.setPath("/onstudy/");
			cookie2.setMaxAge(30 * 60);
			cookie2.setPath("/onstudy/");
			response.addCookie(cookie);
			response.addCookie(cookie2);

			request.getSession().setAttribute("user_student", stu);
			mv.addObject("msg", res.getMsg());
			mv.setViewName("/front/index.jsp");
			new IpUtils().record(request, ipMapper);
		} else {
			mv.addObject("msg", res.getMsg());
			mv.setViewName("/front/index.jsp");
		}
		return mv;
	}

	// 检查用户名是否可用
	@RequestMapping("/checkUpAccount.action")
	@ResponseBody
	public Result checkUpAccount(String account, HttpServletRequest request) {
		Integer number = studentService.findByAccount(account);
		if (number != 0) {
			return Result.build(201, "学号已经存在");
		}
		return Result.ok();
	}

	// 注册
	@RequestMapping("/regist.action")
	@ResponseBody
	public Result regist(HttpServletRequest request,
			HttpServletResponse response, Student student) throws IOException {
		student.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		student.setCode(Const.uuid() + Const.uuid());
		Result res = studentService.regist(student);
		if (res.getStatus() == 200) {
			SendEmails sendEmails = new SendEmails();
			sendEmails.setRes(res);
			sendEmails.setStudent(student);
			threadPoll.execute(sendEmails);
			Thread thread = new Thread(sendEmails);
			thread.start();
		}
		return res;
	}

	// 查询-全部
	@RequestMapping("/findAll.action")
	public ModelAndView findAll(HttpServletRequest request,
			HttpServletResponse response) {
		List<Student> studentList = studentService.findAll();
		request.setAttribute("studentList", studentList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/table_bootstrap_student.jsp");
		return mv;
	}

	// 查询-通过主键单个查询
	@RequestMapping("/selectByPrimaryKey.action")
	public ModelAndView selectByPrimaryKey(HttpServletRequest request,
			HttpServletResponse response, String id) {
		Student student = studentService.selectByPrimaryKey(id);
		request.setAttribute("student", student);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/student/findAll.action");
		return mv;
	}

	@RequestMapping("/selectByPrimaryKeyJson.action")
	@ResponseBody
	public Student selectByPrimaryKeyJson(HttpServletRequest request,
			HttpServletResponse response, String id) {
		return studentService.selectByPrimaryKey(id);
	}

	// 查询-账号
	@RequestMapping("/selectByAccount.action")
	public ModelAndView selectByAccount(HttpServletRequest request,
			HttpServletResponse response, String account) {
		List<Student> studentList = studentService.selectByAccount(account);
		// System.out.println("***********************" + studentList);
		request.setAttribute("studentList", studentList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/student/findAll.action");
		return mv;
	}

	// 查询-姓名
	@RequestMapping("/selectBySname.action")
	public ModelAndView selectBySname(HttpServletRequest request,
			HttpServletResponse response, String sname) {
		List<Student> studentList = studentService.selectBySname(sname);
		// System.out.println("***********************" + studentList);
		request.setAttribute("studentList", studentList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/student/findAll.action");
		return mv;
	}

	@RequestMapping("/selectByAccountJson.action")
	@ResponseBody
	public List<Student> selectByAccountJson(HttpServletRequest request,
			HttpServletResponse response, String account) {
		// System.out.println("account=" + account);
		List<Student> studentList = studentService.selectByAccount(account);
		return studentList;
	}

	// 删除
	@RequestMapping("/deleteByPrimaryKey.action")
	@Role(role = Role.ROLE_ADMIN)
	public ModelAndView deleteByPrimaryKey(HttpServletRequest request,
			HttpServletResponse response, String id) {
		// System.out.println(ids.length() + "________________" + ids);
		ModelAndView mv = new ModelAndView();
		String msg;
		int rows = studentService.deleteByPrimaryKey(id);
		if (rows == 0) {
			msg = "删除失败。。。";
			request.setAttribute("msg", msg);
		} else {
			msg = "删除成功！！！";
			request.setAttribute("msg", msg);
		}
		mv.setViewName("/student/findAll.action");
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
		// System.out.println("********************" + ids);
		if (ids.length() != 0) {
			int rows = studentService.deleteByIds(ids, request);
			if (rows == 0) {
				msg = "删除失败。。。";
				request.setAttribute("msg", msg);
			} else {
				msg = "删除成功！！！";
				request.setAttribute("msg", msg);
			}
		}
		mv.setViewName("/student/findAll.action");
		return mv;
	}

	// 添加-学生信息
	@RequestMapping("/insert.action")
	// @Role(role = Role.ROLE_ADMIN)
	public ModelAndView insert(HttpServletRequest request,
			HttpServletResponse response, Student student) {
		String msg = "";
		ModelAndView mv = new ModelAndView();
		student.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		// studentService.insert(student);
		if (studentService.insert(student) == 0) {
			msg = "添加失败。。。";
			request.setAttribute("msg", msg);
		} else {
			msg = "添加成功！！！";
			request.setAttribute("msg", msg);
		}
		mv.setViewName("/student/findAll.action");
		return mv;
	}

	// 修改-通过主键修改部分信息
	@RequestMapping("/updateByPrimaryKeySelective.action")
	public ModelAndView updateByAccountSelective(HttpServletRequest request,
			HttpServletResponse response, Student student) {
		String msg = "";
		student.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		int rows = studentService.updateByPrimaryKeySelective(student);
		if (rows == 0) {
			msg = "修改失败。。。";
			request.setAttribute("msg", msg);
		} else {
			msg = "修改成功！！！";
			request.setAttribute("msg", msg);
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/student/findAll.action");
		return mv;
	}

	@RequestMapping("/addStudent.action")
	@ResponseBody
	public Result addStudent(HttpServletRequest request, Student student) {
		System.out.println(student);
		Result result = studentService.addStudent(student);
		return result;
	}

	@RequestMapping("/updateStudent.action")
	@ResponseBody
	public Result updateStudent(HttpServletRequest request, Student student) {
		System.out.println(student);
		Result result = studentService.updateStudent(student);
		return result;
	}

	@RequestMapping("/updateResetPwd.action")
	@ResponseBody
	public Result updateResetPwd(HttpServletRequest request, Student student) {
		System.out.println(student);
		Result result = studentService.updateResetPwd(student);
		return result;
	}

}
