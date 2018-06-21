package com.xawl.study.service;

import com.github.pagehelper.PageInfo;
import com.xawl.study.model.CourseClickLogs;
import com.xawl.study.model.Student;

public interface CourseLogsService {

	CourseClickLogs findBycid(Integer cid, Integer sid);

	void updateClickCount(Integer id);

	void updateCourseLogs(CourseClickLogs clickLog);

	void insertCourseLogs(CourseClickLogs clickLog);

	void updateSnameBysid(Student student);

	PageInfo<CourseClickLogs> findAll(Integer page, Integer courseId);

}
