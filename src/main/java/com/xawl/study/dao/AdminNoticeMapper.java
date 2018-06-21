package com.xawl.study.dao;

import com.xawl.study.model.AdminNotice;
import com.xawl.study.model.AdminNoticeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AdminNoticeMapper {
    int countByExample(AdminNoticeExample example);

    int deleteByExample(AdminNoticeExample example);

    int deleteByPrimaryKey(Integer anid);

    int insert(AdminNotice record);

    int insertSelective(AdminNotice record);

    List<AdminNotice> selectByExample(AdminNoticeExample example);

    AdminNotice selectByPrimaryKey(Integer anid);

    int updateByExampleSelective(@Param("record") AdminNotice record, @Param("example") AdminNoticeExample example);

    int updateByExample(@Param("record") AdminNotice record, @Param("example") AdminNoticeExample example);

    int updateByPrimaryKeySelective(AdminNotice record);

    int updateByPrimaryKey(AdminNotice record);
}