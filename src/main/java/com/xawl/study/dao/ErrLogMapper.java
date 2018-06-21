package com.xawl.study.dao;

import com.xawl.study.model.ErrLog;
import com.xawl.study.model.ErrLogExample;
import com.xawl.study.model.ErrLogWithBLOBs;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ErrLogMapper {
    int countByExample(ErrLogExample example);

    int deleteByExample(ErrLogExample example);

    int insert(ErrLogWithBLOBs record);

    int insertSelective(ErrLogWithBLOBs record);

    List<ErrLogWithBLOBs> selectByExampleWithBLOBs(ErrLogExample example);

    List<ErrLog> selectByExample(ErrLogExample example);

    int updateByExampleSelective(@Param("record") ErrLogWithBLOBs record, @Param("example") ErrLogExample example);

    int updateByExampleWithBLOBs(@Param("record") ErrLogWithBLOBs record, @Param("example") ErrLogExample example);

    int updateByExample(@Param("record") ErrLog record, @Param("example") ErrLogExample example);
}