package com.xawl.study.dao;

import java.util.List;
import java.util.Map;

import com.xawl.study.model.Question;
import com.xawl.study.model.QuestionCustomer;

/**
 * 问题的dao层接口
 * @author zb
 *
 */
public interface QuestionMapper {
    int deleteByPrimaryKey(Integer qid);

    int insert(Question record);

    int insertSelective(Question record);

    Question selectByPrimaryKey(Integer qid);

    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKey(Question record);

    List<QuestionCustomer> findAll();

	List<QuestionCustomer> findAllByTime();

	List<QuestionCustomer> findAllByClick();

	List<QuestionCustomer> findAllByReply();

	QuestionCustomer selectByQid(Integer qid);

	void deleteQuestion(String[] checkedNums);

	void upateReplyCount(Integer qid);

	void updateClickCount(Integer qid);

	List<Question> findByClickTop();

	List<QuestionCustomer> findQuestion(String text);

	void upateReplyCountDel(Map<String, Integer> map);

	List<Question> findQuestionByidJsonSid(Integer sid);

	List<Question> findQuestionByidJsonTid(Integer tid);
}