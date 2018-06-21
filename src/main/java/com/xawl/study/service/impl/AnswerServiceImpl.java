package com.xawl.study.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xawl.study.dao.AnswerMapper;
import com.xawl.study.dao.QuestionMapper;
import com.xawl.study.dao.StudentMapper;
import com.xawl.study.dao.TeacherMapper;
import com.xawl.study.model.Answer;
import com.xawl.study.model.AnswerCustomer;
import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.AnswerService;
import com.xawl.study.utils.Const;

/**
 * 回答业务逻辑层
 * @author zb
 *
 */
@Service
public class AnswerServiceImpl implements AnswerService{
	
	@Autowired
	private AnswerMapper answerMapper;
	@Autowired
	private TeacherMapper teacherMapper;
	@Autowired
	private StudentMapper studentMapper;
	@Autowired
	private QuestionMapper questionMapper;
	/**
	 * 根据问题的qid来查找对应回答
	 */
	public List<AnswerCustomer> findByQid(Integer qid) {
		// TODO Auto-generated method stub
		List<AnswerCustomer> listAnswer = answerMapper.findByQid(qid);
		for(AnswerCustomer answerCustomer: listAnswer){
			if(answerCustomer.getUsertype() == null){
				return listAnswer;
			}
			if(answerCustomer.getUsertype() == 0){
				Teacher teacher = teacherMapper.selectByPrimaryKey(answerCustomer.getTid());
				answerCustomer.setDbTeacher(teacher);
			}else{
				Student student = studentMapper.selectByPrimaryKey(String.valueOf(answerCustomer.getSid()));
				answerCustomer.setDbStudent(student);
			}
		}
		return listAnswer;
	}
	
	/**
	 * 根据回答的aid来删除指定回答
	 */
	public int deleteAnswer(String ids) {
		String [] checkedNums = ids.split(",");
		int qid = answerMapper.selectByPrimaryKey(Integer.parseInt(checkedNums[0])).getQid();
		answerMapper.deleteAnswer(checkedNums);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("qid", qid);
		map.put("length", checkedNums.length);
		questionMapper.upateReplyCountDel(map);
		return qid;
	}
	
	/**
	 * 添加回答
	 */
	public void insertQuestion(Answer answer) {
		// TODO Auto-generated method stub
		answerMapper.insertSelective(answer);
		questionMapper.upateReplyCount(answer.getQid());
	}

	public PageInfo<AnswerCustomer> findByQidFront(Integer qid, Integer page) {
		if (page == null || page<=0) {
			page = 1;
		}
		PageHelper.startPage(page, Const.PAGE_QUESTION);
		List<AnswerCustomer> listAnswer = answerMapper.findByQid(qid);
		
		for(AnswerCustomer answerCustomer: listAnswer){
			if(answerCustomer.getUsertype() == null){
				return new PageInfo<AnswerCustomer>(listAnswer, Const.PAGE_COUNT);
			}
			if(answerCustomer.getUsertype() == 0){
				Teacher teacher = teacherMapper.selectByPrimaryKey(answerCustomer.getTid());
				answerCustomer.setDbTeacher(teacher);
			}else{
				Student student = studentMapper.selectByPrimaryKey(String.valueOf(answerCustomer.getSid()));
				answerCustomer.setDbStudent(student);
			}
		}
		return new PageInfo<AnswerCustomer>(listAnswer, Const.PAGE_COUNT);
	}

}
