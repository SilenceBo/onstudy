package com.xawl.study.dao;

import java.util.List;
import java.util.Map;

import com.xawl.study.model.CourseCustomer;
import com.xawl.study.model.Resource;

public interface ResourceMapper {
	int selectMinOrdery(Integer cid);

	int deleteByPrimaryKey(Integer rid);

	int insert(Resource record);

	int insertSelective(Resource record);

	Resource selectByPrimaryKey(Integer rid);

	int updateByPrimaryKeySelective(Resource record);

	int updateByPrimaryKey(Resource record);

	List<Resource> selectAll(Integer cid);

	int insertResource(Resource resource);

	String selectResourceNameBYRid(Integer rid);

	int selectCountVedioByCid(Integer cid);

	CourseCustomer selectCourseByCid(Integer cid);

	int selectMaxOrdery(Map<String, String> map);

	List<Resource> findByRTypeNo1(Integer cid);

	List<Resource> findByCidAndType(Integer cid);

	Integer selectMaxOrderyByCid(Integer cid);

	List<Resource> selectByCidAndOredry(Resource resource);

	void updateOrdery(Resource resource);

	Integer findResourceNumByCid(Integer cid);

	Integer findVoideoNumByCid(Integer cid);
}