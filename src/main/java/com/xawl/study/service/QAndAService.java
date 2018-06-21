package com.xawl.study.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xawl.study.model.QAndA;
import com.xawl.study.utils.Result;

public interface QAndAService {

	Result selectAll(Integer page, Integer cid);

	Result add(QAndA qAndA);

	List<QAndA> findAll(Integer cid);

	Result findAllAnswerByfqid(Integer qid);

	Result findByQid(Integer qid);

	Result addReply(Integer beAnsweredQid, QAndA qanda, String text, HttpServletRequest request,
			HttpServletResponse response);

	Result addQuestionsToTeacher(QAndA qAndA);

	Result findByTid(Integer tid, Integer page);

	Result deleteByqid(Integer qid);

	Result findBySid(Integer parseInt);

	Result addTeacherReply(QAndA qanda);

	Result addStudentReply(QAndA qanda);

	Result deleteByListQid(List<Integer> list);

	Result addTeacherReply(Integer fqid, Integer qid, String text, HttpServletRequest request, Integer typea);

	Result addReply(Integer fqid, Integer qid, String text,
			HttpServletRequest request, Integer typea);

}
