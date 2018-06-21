package com.xawl.study.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xawl.study.dao.AnswerMapper;
import com.xawl.study.dao.QuestionMapper;
import com.xawl.study.dao.StudentMapper;
import com.xawl.study.dao.TeacherMapper;
import com.xawl.study.model.Answer;
import com.xawl.study.model.Question;
import com.xawl.study.model.QuestionCustomer;
import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.QuestionService;
import com.xawl.study.utils.Const;
import com.xawl.study.utils.ListPageUtil;

/**
 * 问题业务逻辑层
 * @author zb
 *
 */
@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionMapper questionMapper;
	@Autowired
	private TeacherMapper teacherMapper;
	@Autowired
	private StudentMapper studentMapper;
	@Autowired
	private AnswerMapper answerMapper;
	
	/**
	 * 查出所有的问题
	 */
	public List<QuestionCustomer> findAll() {
		// TODO Auto-generated method stub
		List<QuestionCustomer> listQuestion = questionMapper.findAll();
		for(QuestionCustomer questionCustomer: listQuestion){
			if(questionCustomer.getUsertype() == null){
				return listQuestion;
			}
			if(questionCustomer.getUsertype() == 0){
				Teacher teacher = teacherMapper.selectByPrimaryKey(questionCustomer.getTid());
				questionCustomer.setDbTeacher(teacher);
			}else{
				Student student = studentMapper.selectByPrimaryKey(String.valueOf(questionCustomer.getSid()));
				questionCustomer.setDbStudent(student);
			}
		}
		return listQuestion;
	}
	
	/**
	 * 查出所有问题按时间排序
	 */
	public PageInfo<QuestionCustomer> findAllByTime(Integer page) {
		// TODO Auto-generated method stub
		if (page == null || page<=0) {
			page = 1;
		}
		PageHelper.startPage(page, Const.PAGE_QUESTION);
		List<QuestionCustomer> listQuestion = questionMapper.findAllByTime();
		
		for(QuestionCustomer questionCustomer: listQuestion){
			if(questionCustomer.getUsertype() == null){
				return new PageInfo<QuestionCustomer>(listQuestion, Const.PAGE_COUNT);
			}
			if(questionCustomer.getUsertype() == 0){
				Teacher teacher = teacherMapper.selectByPrimaryKey(questionCustomer.getTid());
				questionCustomer.setDbTeacher(teacher);
			}else{
				Student student = studentMapper.selectByPrimaryKey(String.valueOf(questionCustomer.getSid()));
				questionCustomer.setDbStudent(student);
			}
		}
		return new PageInfo<QuestionCustomer>(listQuestion, Const.PAGE_COUNT);
	}
	
	/**
	 * 查出所有问题按点击排序
	 */
	public PageInfo<QuestionCustomer> findAllByClick(Integer page) {
		// TODO Auto-generated method stub
		if (page == null || page<=0) {
			page = 1;
		}
		PageHelper.startPage(page, Const.PAGE_QUESTION);
		List<QuestionCustomer> listQuestion = questionMapper.findAllByClick();
		
		for(QuestionCustomer questionCustomer: listQuestion){
			if(questionCustomer.getUsertype() == null){
				return new PageInfo<QuestionCustomer>(listQuestion, Const.PAGE_COUNT);
			}
			if(questionCustomer.getUsertype() == 0){
				Teacher teacher = teacherMapper.selectByPrimaryKey(questionCustomer.getTid());
				questionCustomer.setDbTeacher(teacher);
			}else{
				Student student = studentMapper.selectByPrimaryKey(String.valueOf(questionCustomer.getSid()));
				questionCustomer.setDbStudent(student);
			}
		}
		return new PageInfo<QuestionCustomer>(listQuestion, Const.PAGE_COUNT);
	}
	
	/**
	 * 查出所有问题按回复排序
	 */
	public PageInfo<QuestionCustomer> findAllByReply(Integer page) {
		// TODO Auto-generated method stub
		if (page == null || page<=0) {
			page = 1;
		}
		PageHelper.startPage(page, Const.PAGE_QUESTION);
		List<QuestionCustomer> listQuestion = questionMapper.findAllByReply();
		
		for(QuestionCustomer questionCustomer: listQuestion){
			if(questionCustomer.getUsertype() == null){
				return new PageInfo<QuestionCustomer>(listQuestion, Const.PAGE_COUNT);
			}
			if(questionCustomer.getUsertype() == 0){
				Teacher teacher = teacherMapper.selectByPrimaryKey(questionCustomer.getTid());
				questionCustomer.setDbTeacher(teacher);
			}else{
				Student student = studentMapper.selectByPrimaryKey(String.valueOf(questionCustomer.getSid()));
				questionCustomer.setDbStudent(student);
			}
		}
		return new PageInfo<QuestionCustomer>(listQuestion, Const.PAGE_COUNT);
	}
	
	/**
	 * 按照qid查出对应问题
	 */
	public QuestionCustomer selectByQid(Integer qid) {
		QuestionCustomer questionCustomer = questionMapper.selectByQid(qid);
		
		if(questionCustomer.getUsertype() == 0){
			if(questionCustomer.getUsertype() == null){
				return questionCustomer;
			}
			Teacher teacher = teacherMapper.selectByPrimaryKey(questionCustomer.getTid());
			questionCustomer.setDbTeacher(teacher);
		}else{
			Student student = studentMapper.selectByPrimaryKey(String.valueOf(questionCustomer.getSid()));
			questionCustomer.setDbStudent(student);
		}
		
		return questionCustomer;
	}
	
	/**
	 * 按照qid删除问题
	 */
	public void deleteQuestion(String ids) {
		// TODO Auto-generated method stub
		String [] checkedNums = ids.split(",");
		questionMapper.deleteQuestion(checkedNums);
		answerMapper.deleteAnswerByQid(checkedNums);
	}
	
	/**
	 * 添加问题
	 */
	public void insertQuestion(Question question) {
		// TODO Auto-generated method stub
		questionMapper.insertSelective(question);
	}
	
	/**
	 * 修改点击数
	 */
	public void updateClickCount(Integer qid) {
		// TODO Auto-generated method stub
		questionMapper.updateClickCount(qid);
	}
	
	/**
	 * 查出点击前15的问题
	 */
	public List<Question> findByClickTop() {
		// TODO Auto-generated method stub
		return questionMapper.findByClickTop();
	}
	
	/**
	 * 找问题
	 */
	public PageInfo<QuestionCustomer> findQuestion(String text, Integer page) {
		// TODO Auto-generated method stub
		if (page == null || page<=0) {
			page = 1;
		}
		PageHelper.startPage(page, Const.PAGE_QUESTION);
		List<QuestionCustomer> listQuestion = questionMapper.findQuestion(text);
		
		for(QuestionCustomer questionCustomer: listQuestion){
			if(questionCustomer.getUsertype() == null){
				return new PageInfo<QuestionCustomer>(listQuestion, Const.PAGE_COUNT);
			}
			if(questionCustomer.getUsertype() == 0){
				Teacher teacher = teacherMapper.selectByPrimaryKey(questionCustomer.getTid());
				questionCustomer.setDbTeacher(teacher);
			}else{
				Student student = studentMapper.selectByPrimaryKey(String.valueOf(questionCustomer.getSid()));
				questionCustomer.setDbStudent(student);
			}
		}
		return new PageInfo<QuestionCustomer>(listQuestion, Const.PAGE_COUNT);
	}

	public PageInfo<Question> findQuestionByidJsonSid(Integer sid, Integer page) {
		if (page == null || page<=0) {
			page = 1;
		}
		PageHelper.startPage(page, Const.PAGE_QUESTIONPEOPLE);
		List<Question> list = questionMapper.findQuestionByidJsonSid(sid);
		return new PageInfo<Question>(list, Const.PAGE_COUNT);
	}

	public PageInfo<Question> findQuestionByidJsonTid(Integer tid, Integer page) {
		if (page == null || page<=0) {
			page = 1;
		}
		PageHelper.startPage(page, Const.PAGE_QUESTIONPEOPLE);
		List<Question> list = questionMapper.findQuestionByidJsonTid(tid);
		return new PageInfo<Question>(list, Const.PAGE_COUNT);
	}

	public void updateQuestion(Question question) {
		questionMapper.updateByPrimaryKeySelective(question);
	}

	public ListPageUtil<Question> findAboutQuestionByidJsonSid(Integer sid,
			Integer page) {
		List<Answer> listaAnswers = answerMapper.findAnswerBySid(sid);
		Set<Integer> set = new HashSet<Integer>();
		for(Answer answer:listaAnswers){	
			set.add(answer.getQid());		
		}
		//System.out.println(set);
		
		if (page == null || page<=0) {
			page = 1;
		}
		
		List<Question> list = new ArrayList<Question>();
		for(Integer item:set){
			Question question = questionMapper.selectByPrimaryKey(item);
			if(question.getSid() != sid){
				list.add(question);
			}
		}
		//System.out.println(list);
		return new ListPageUtil<Question>(list, page, Const.PAGE_QUESTIONPEOPLE);
	}

	public ListPageUtil<Question> findAboutQuestionByidJsonTid(Integer tid,
			Integer page) {
		List<Answer> listaAnswers = answerMapper.findAnswerBytid(tid);
		Set<Integer> set = new HashSet<Integer>();
		for(Answer answer:listaAnswers){	
			set.add(answer.getQid());		
		}
		//System.out.println(set);
		
		if (page == null || page<=0) {
			page = 1;
		}
		
		List<Question> list = new ArrayList<Question>();
		for(Integer item:set){
			Question question = questionMapper.selectByPrimaryKey(item);
			if(question.getTid() != tid){
				list.add(question);
			}
		}
		//System.out.println(list);
		return new ListPageUtil<Question>(list, page, Const.PAGE_QUESTIONPEOPLE);
	}
}
