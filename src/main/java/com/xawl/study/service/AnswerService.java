package com.xawl.study.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.xawl.study.model.Answer;
import com.xawl.study.model.AnswerCustomer;

/**
 * 回答service层接口
 * @author zb
 *
 */
public interface AnswerService {
	List<AnswerCustomer> findByQid(Integer qid);

	int deleteAnswer(String ids);

	void insertQuestion(Answer answer);

	PageInfo<AnswerCustomer> findByQidFront(Integer qid, Integer page);
}