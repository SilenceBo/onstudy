package com.xawl.study.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.xawl.study.model.CourseCustomer;
import com.xawl.study.model.Resource;
import com.xawl.study.model.ResourceLogs;
import com.xawl.study.utils.Result;
import com.xawl.study.utils.StudyResult;

public interface ResourceService {

	List<Resource> findAll(Integer cid);

	boolean deleteByRid(Integer rid, HttpServletRequest request);

	void insertResource(Resource resource);

	Resource findByRid(Integer rid);

	Result updateResource(Resource resource);

	String selectResourceNameBYRid(Integer rid);

	CourseCustomer selectCourseByCid(Integer cid);

	int selectCountVedioByCid(Integer cid);

	StudyResult play(ResourceLogs resourceLogs, HttpServletRequest requset);

	StudyResult updateAnswer(String[] answers, Integer ordery, Integer cid, Integer sid);

	List<Resource> findByRTypeNo1(Integer cid);

	StudyResult bofang(ResourceLogs resourceLogs, HttpServletRequest request);

	Result findByCidAndType(Integer cid);

	void insertResource2(Resource resource);

	boolean deleteByRids(String rids, HttpServletRequest request);

}
