package com.xawl.study.dao;

import java.util.List;

import com.xawl.study.model.CourseClickLogs;
import com.xawl.study.model.Student;

public interface CourseClickLogsMapper {

    int insertSelective(CourseClickLogs record);

    int updateByPrimaryKeySelective(CourseClickLogs record);

	CourseClickLogs findBycid(CourseClickLogs clickLogs);

	void updateClickCount(Integer id);

	void updateSnameBysid(Student student);

	List<CourseClickLogs> findAll(Integer cid);
}