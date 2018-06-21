package com.xawl.study.dao;

import com.xawl.study.model.Ip;
import com.xawl.study.model.IpExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface IpMapper {
    int countByExample(IpExample example);

    int deleteByExample(IpExample example);

    int deleteByPrimaryKey(Integer ipid);

    int insert(Ip record);

    int insertSelective(Ip record);

    List<Ip> selectByExample(IpExample example);

    Ip selectByPrimaryKey(Integer ipid);

    int updateByExampleSelective(@Param("record") Ip record, @Param("example") IpExample example);

    int updateByExample(@Param("record") Ip record, @Param("example") IpExample example);

    int updateByPrimaryKeySelective(Ip record);

    int updateByPrimaryKey(Ip record);
}