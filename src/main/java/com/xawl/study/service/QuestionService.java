package com.xawl.study.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.xawl.study.model.Question;
import com.xawl.study.model.QuestionCustomer;
import com.xawl.study.utils.ListPageUtil;

/**
 * 问题service层接口
 * @author zb
 *
 */
public interface QuestionService {

	List<QuestionCustomer> findAll();

	PageInfo<QuestionCustomer> findAllByTime(Integer page);

	PageInfo<QuestionCustomer> findAllByClick(Integer page);

	PageInfo<QuestionCustomer> findAllByReply(Integer page);

	QuestionCustomer selectByQid(Integer qid);

	void deleteQuestion(String ids);

	void insertQuestion(Question question);

	void updateClickCount(Integer qid);

	List<Question> findByClickTop();

	PageInfo<QuestionCustomer> findQuestion(String text, Integer page);

	PageInfo<Question> findQuestionByidJsonSid(Integer sid, Integer page);

	PageInfo<Question> findQuestionByidJsonTid(Integer tid, Integer page);

	void updateQuestion(Question question);

	ListPageUtil<Question>  findAboutQuestionByidJsonSid(Integer sid, Integer page);

	ListPageUtil<Question> findAboutQuestionByidJsonTid(Integer tid, Integer page);
}