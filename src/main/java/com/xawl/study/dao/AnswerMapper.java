package com.xawl.study.dao;

import java.util.List;

import com.xawl.study.model.Answer;
import com.xawl.study.model.AnswerCustomer;

/**
 * 回答的dao层接口
 * @author zb
 *
 */
public interface AnswerMapper {
    int deleteByPrimaryKey(Integer aid);

    int insert(Answer record);

    int insertSelective(Answer record);

    Answer selectByPrimaryKey(Integer aid);

    int updateByPrimaryKeySelective(Answer record);

    int updateByPrimaryKey(Answer record);

	List<AnswerCustomer> findByQid(Integer qid);

	void deleteAnswerByQid(String[] checkedNums);

	void deleteAnswer(String[] checkedNums);

	List<Answer> findAnswerBySid(Integer sid);

	List<Answer> findAnswerBytid(Integer tid);

}