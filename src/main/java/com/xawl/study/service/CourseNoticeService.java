package com.xawl.study.service;

import com.xawl.study.model.CourseNotice;
import com.xawl.study.model.Student;
import com.xawl.study.utils.Result;

public interface CourseNoticeService {

	Result findCourseNoticeByCid(Student student);

	Result addCourseNotice(CourseNotice courseNotice);

	Result findAll();

	Result deleteByCnid(Integer cnid);

	Result findByCnid(Integer cnid);

	Result update(CourseNotice courseNotice);

	Result findByTid(Integer tid, Integer pn);

}
