package com.xawl.study.dao;

import com.xawl.study.model.Course;
import com.xawl.study.model.CourseNotice;
import com.xawl.study.model.CourseNoticeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CourseNoticeMapper {
    int countByExample(CourseNoticeExample example);

    int deleteByExample(CourseNoticeExample example);

    int deleteByPrimaryKey(Integer cnid);

    int insert(CourseNotice record);

    int insertSelective(CourseNotice record);

    List<CourseNotice> selectByExample(CourseNoticeExample example);

    CourseNotice selectByPrimaryKey(Integer cnid);

    int updateByExampleSelective(@Param("record") CourseNotice record, @Param("example") CourseNoticeExample example);

    int updateByExample(@Param("record") CourseNotice record, @Param("example") CourseNoticeExample example);

    int updateByPrimaryKeySelective(CourseNotice record);

    int updateByPrimaryKey(CourseNotice record);

	void updateCnameByCid(Course course);
}