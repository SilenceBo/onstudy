package com.xawl.study.service;

import com.xawl.study.utils.Result;

public interface NoticeLogsService {

	Result deleteByAnidOrSid(String id, Integer anid);

	Result deleteByCnidOrSid(String id, Integer cnid);

	Result deleteByAnidOrTid(Integer tid, Integer anid);

	void insertStudent(String id, Integer anid);

	void insertTeacher(Integer tid, Integer anid);

	void insertCourseStudent(String id, Integer cnid);

}
