package com.xawl.study.dao;

import com.xawl.study.model.TeacherWork;
import com.xawl.study.model.TeacherWorkExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TeacherWorkMapper {
    int countByExample(TeacherWorkExample example);

    int deleteByExample(TeacherWorkExample example);

    int deleteByPrimaryKey(Integer twid);

    int insert(TeacherWork record);

    int insertSelective(TeacherWork record);

    List<TeacherWork> selectByExample(TeacherWorkExample example);

    TeacherWork selectByPrimaryKey(Integer twid);

    int updateByExampleSelective(@Param("record") TeacherWork record, @Param("example") TeacherWorkExample example);

    int updateByExample(@Param("record") TeacherWork record, @Param("example") TeacherWorkExample example);

    int updateByPrimaryKeySelective(TeacherWork record);

    int updateByPrimaryKey(TeacherWork record);

	Integer findCountByCid(Integer cid);
}