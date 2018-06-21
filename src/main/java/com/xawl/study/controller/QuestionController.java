package com.xawl.study.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.xawl.study.interceptor.Role;
import com.xawl.study.model.Question;
import com.xawl.study.model.QuestionCustomer;
import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.QuestionService;
import com.xawl.study.utils.ListPageUtil;
import com.xawl.study.utils.Result;

/**
 * 问题的controller层
 * @author zb
 *
 */
@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	/**
	 * 查出所有问题
	 * @param request
	 * @param response
	 * @return 返回到后端页面
	 */
	@RequestMapping("/findAll.action")
	public ModelAndView findAll(HttpServletRequest request,
			HttpServletResponse response) {
		
		List<QuestionCustomer> queList = questionService.findAll();
		request.setAttribute("queList", queList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/table_bootstrap_question.jsp");
		return mv;
	}
	
	/**
	 * 查出所有问题
	 * @param request
	 * @param response
	 * @return 返回到前端页面
	 */
	@RequestMapping("/findAllByFront.action")
	public ModelAndView findAllByFront(HttpServletRequest request,
			HttpServletResponse response, Integer page, String way, String text) {
		ModelAndView mv = new ModelAndView();
		//System.out.println(way);
		if(way.equals("time")){
			//System.out.println("time");
			PageInfo<QuestionCustomer> pageInfo = questionService.findAllByTime(page);
			request.setAttribute("pageInfo", pageInfo);
		}
		if(way.equals("click")){
			PageInfo<QuestionCustomer> pageInfo = questionService.findAllByClick(page);
			request.setAttribute("pageInfo", pageInfo);
		}
		if(way.equals("reply")){
			PageInfo<QuestionCustomer> pageInfo = questionService.findAllByReply(page);
			request.setAttribute("pageInfo", pageInfo);
		}
		if(way.equals("select")){
			PageInfo<QuestionCustomer> pageInfo = questionService.findQuestion(text,page);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("text", text);
		}
		
		request.setAttribute("way", way);
		List<Question> queList = questionService.findByClickTop();
		request.setAttribute("queList", queList);
		
		mv.setViewName("/front/question.jsp");
		return mv;
	}
	
	/**
	 * 按照问题的id来删除问题及相关回答
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteQuestion.action")
	public ModelAndView deleteQuestion(HttpServletRequest request,
			HttpServletResponse response) {
		String ids=request.getParameter("ids");
		questionService.deleteQuestion(ids);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/question/findAll.action");
		return mv;
	}
	
	/**
	 * 添加问题
	 * @param request
	 * @param response
	 * @param question
	 * @return
	 */
	@RequestMapping("/insertQuestion.action")
	public ModelAndView insertQuestion(HttpServletRequest request,
			HttpServletResponse response, Question question) {
		ModelAndView mv = new ModelAndView();
		//System.out.println(question);
		if(question.getTopic() == "" || question.getContents() == ""){
			mv.setViewName("redirect:/question/findAllByFront.action?way=time");
			return mv;
		}
		Student student = (Student) request.getSession().getAttribute("user_student");
		Teacher teacher = (Teacher) request.getSession().getAttribute("user_teacher");
		if(student != null){
			question.setUsertype(1);
			question.setSid(Integer.parseInt(student.getId()));
		}
		if(teacher != null){
			question.setUsertype(0);
			question.setTid(teacher.getTid());
		}
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createTime = simpleDateFormat.format(date);
		question.setCreattime(createTime);
		
		questionService.insertQuestion(question);	
		mv.setViewName("redirect:/question/findAllByFront.action?way=time");
		return mv;
	}
	
	/**
	 * 修改问题
	 * @param request
	 * @param response
	 * @param question
	 * @return
	 */
	@RequestMapping("/updateQuestion.action")
	public ModelAndView updateQuestion(HttpServletRequest request,
			HttpServletResponse response, Question question) {
		ModelAndView mv = new ModelAndView();
		questionService.updateQuestion(question);	
		mv.setViewName("redirect:/answer/findByQidFront.action?qid="+question.getQid());
		return mv;
	}
	
	/**
	 * 按照用户id来查找问题
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/findQuestionByidJson.action")
	@ResponseBody
	public Result findQuestionByidJson(HttpServletRequest request,
			HttpServletResponse response, Integer id, Integer page) {
		Student student = (Student) request.getSession().getAttribute("user_student");
		Teacher teacher = (Teacher) request.getSession().getAttribute("user_teacher");
		if(student != null){
			PageInfo<Question> list = questionService.findQuestionByidJsonSid(id, page);
			return Result.ok(list);
		}
		if(teacher != null){
			PageInfo<Question> list = questionService.findQuestionByidJsonTid(id, page);
			return Result.ok(list);
		}
		return Result.build(500, "失败");
	}

	/**
	 * 按照用户id来查找参与过的问题
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/findAboutQuestionByidJson.action")
	@ResponseBody
	public Result findAboutQuestionByidJson(HttpServletRequest request,
			HttpServletResponse response, Integer id, Integer page) {
		Student student = (Student) request.getSession().getAttribute("user_student");
		Teacher teacher = (Teacher) request.getSession().getAttribute("user_teacher");
		if(student != null){
			ListPageUtil<Question>  list = questionService.findAboutQuestionByidJsonSid(id, page);
			//System.out.println(list);
			return Result.ok(list);
		}
		if(teacher != null){
			ListPageUtil<Question> list = questionService.findAboutQuestionByidJsonTid(id, page);
			//System.out.println(list);
			return Result.ok(list);
		}
		return Result.build(500, "失败");
	}
}
