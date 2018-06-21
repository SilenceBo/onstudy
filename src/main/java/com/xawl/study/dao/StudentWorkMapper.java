package com.xawl.study.dao;

import com.xawl.study.model.Student;
import com.xawl.study.model.StudentWork;
import com.xawl.study.model.StudentWorkExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StudentWorkMapper {
    int countByExample(StudentWorkExample example);

    int deleteByExample(StudentWorkExample example);

    int deleteByPrimaryKey(Integer swid);

    int insert(StudentWork record);

    int insertSelective(StudentWork record);

    List<StudentWork> selectByExample(StudentWorkExample example);

    StudentWork selectByPrimaryKey(Integer swid);

    int updateByExampleSelective(@Param("record") StudentWork record, @Param("example") StudentWorkExample example);

    int updateByExample(@Param("record") StudentWork record, @Param("example") StudentWorkExample example);

    int updateByPrimaryKeySelective(StudentWork record);

    int updateByPrimaryKey(StudentWork record);

	void updatesnameBySid(Student student);
}