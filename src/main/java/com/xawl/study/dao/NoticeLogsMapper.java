package com.xawl.study.dao;

import com.xawl.study.model.NoticeLogs;
import com.xawl.study.model.NoticeLogsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NoticeLogsMapper {
    int countByExample(NoticeLogsExample example);

    int deleteByExample(NoticeLogsExample example);

    int deleteByPrimaryKey(Integer nlid);

    int insert(NoticeLogs record);

    int insertSelective(NoticeLogs record);

    List<NoticeLogs> selectByExample(NoticeLogsExample example);

    NoticeLogs selectByPrimaryKey(Integer nlid);

    int updateByExampleSelective(@Param("record") NoticeLogs record, @Param("example") NoticeLogsExample example);

    int updateByExample(@Param("record") NoticeLogs record, @Param("example") NoticeLogsExample example);

    int updateByPrimaryKeySelective(NoticeLogs record);

    int updateByPrimaryKey(NoticeLogs record);
}