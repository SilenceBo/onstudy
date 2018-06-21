package com.xawl.study.dao;

import com.xawl.study.model.ResourceClickLogs;
import com.xawl.study.model.ResourceClickLogsExample;
import com.xawl.study.model.Student;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ResourceClickLogsMapper {
    int countByExample(ResourceClickLogsExample example);

    int deleteByExample(ResourceClickLogsExample example);

    int deleteByPrimaryKey(Integer rclid);

    int insert(ResourceClickLogs record);

    int insertSelective(ResourceClickLogs record);

    List<ResourceClickLogs> selectByExample(ResourceClickLogsExample example);

    ResourceClickLogs selectByPrimaryKey(Integer rclid);

    int updateByExampleSelective(@Param("record") ResourceClickLogs record, @Param("example") ResourceClickLogsExample example);

    int updateByExample(@Param("record") ResourceClickLogs record, @Param("example") ResourceClickLogsExample example);

    int updateByPrimaryKeySelective(ResourceClickLogs record);

    int updateByPrimaryKey(ResourceClickLogs record);

	void updateSnameBysid(Student student);

	int selectSUMClickNum(Integer rid);

	void clcik(Integer rid);
}