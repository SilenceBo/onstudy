package com.xawl.study.dao;

import com.xawl.study.model.QAndA;
import com.xawl.study.model.QAndAExample;
import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface QAndAMapper {
	int countByExample(QAndAExample example);

    int deleteByExample(QAndAExample example);

    int insert(QAndA record);

    int insertSelective(QAndA record);

    List<QAndA> selectByExample(QAndAExample example);

    int updateByExampleSelective(@Param("record") QAndA record, @Param("example") QAndAExample example);

    int updateByExample(@Param("record") QAndA record, @Param("example") QAndAExample example);

	Integer selectCountByQid(Integer qid);

	void updateOsnameBySid(Student student);

	void updateTsnameBySid(Student student);

	void updateTnameByTid(Teacher teacher);
}