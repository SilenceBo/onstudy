package com.xawl.study.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.xawl.study.interceptor.Role;
import com.xawl.study.model.Answer;
import com.xawl.study.model.AnswerCustomer;
import com.xawl.study.model.Question;
import com.xawl.study.model.QuestionCustomer;
import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.AnswerService;
import com.xawl.study.service.QuestionService;

/**
 * 回答的controller层
 * @author zb
 *
 */
@Controller
@RequestMapping("/answer")
public class AnswerController {
	
	@Autowired
	private AnswerService answerService;
	@Autowired
	private QuestionService questionService;
	
	/**
	 * 根据问题的qid来查找对应的回答
	 * @param request
	 * @param response
	 * @param qid
	 * @return 返回到后端页面
	 */
	
	@RequestMapping("/findByQid.action")
	public ModelAndView findByQid(HttpServletRequest request,
			HttpServletResponse response,Integer qid) {
		
		List<AnswerCustomer> anList = answerService.findByQid(qid);
		request.setAttribute("anList", anList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/table_bootstrap_answer.jsp");
		return mv;
	}
	
	/**
	 * 根据问题的qid来查找对应回答对应用户
	 * @param request
	 * @param response
	 * @param qid
	 * @return 返回到前端页面
	 */
	@RequestMapping("/findByQidFront.action")
	public ModelAndView findByQidFront(HttpServletRequest request,
			HttpServletResponse response,Integer qid, Integer page) {
		questionService.updateClickCount(qid);
		QuestionCustomer questioner = questionService.selectByQid(qid);
		request.setAttribute("questioner", questioner);
		
		PageInfo<AnswerCustomer> pageInfo = answerService.findByQidFront(qid, page);
		request.setAttribute("pageInfo", pageInfo);
		
		List<Question> queList = questionService.findByClickTop();
		request.setAttribute("queList", queList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/front/answer.jsp");
		return mv;
	}
	
	/**
	 * 根据传入的字符串来删除对应回答
	 * @param request
	 * @param response
	 * @return 返回到后端页面
	 */
	@RequestMapping("/deleteAnswer.action")
	@Role(role=Role.ROLE_ADMIN)
	public ModelAndView deleteAnswer(HttpServletRequest request,
			HttpServletResponse response) {
		String ids=request.getParameter("ids");
		int qid = answerService.deleteAnswer(ids);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/answer/findByQid.action?qid="+qid);
		return mv;
	}
	
	/**
	 * 根据传入的字符串来删除对应回答
	 * @param request
	 * @param response
	 * @return 返回到后端页面
	 */
	@RequestMapping("/deleteAnswerfront.action")
	public ModelAndView deleteAnswerfront(HttpServletRequest request,
			HttpServletResponse response) {
		String ids=request.getParameter("ids");
		int qid = answerService.deleteAnswer(ids);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/answer/findByQidFront.action?qid="+qid);
		return mv;
	}
	
	/**
	 * 添加回答
	 * @param request
	 * @param response
	 * @param answer
	 * @return
	 */
	@RequestMapping("/insertAnswer.action")
	public ModelAndView insertAnswer(HttpServletRequest request,
			HttpServletResponse response, Answer answer) {
		ModelAndView mv = new ModelAndView();
		if(answer.getContents()==""){
			mv.setViewName("redirect:/answer/findByQidFront.action?qid="+answer.getQid());
			return mv;
		}
		Student student = (Student) request.getSession().getAttribute("user_student");
		Teacher teacher = (Teacher) request.getSession().getAttribute("user_teacher");
		if(student != null){
			answer.setUsertype(1);
			answer.setSid(Integer.parseInt(student.getId()));
		}
		if(teacher != null){
			answer.setUsertype(0);
			answer.setTid(teacher.getTid());
		}
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createTime = simpleDateFormat.format(date);
		answer.setCreattime(createTime);
		answerService.insertQuestion(answer);
		
		mv.setViewName("redirect:/answer/findByQidFront.action?qid="+answer.getQid());
		return mv;
	}
}
