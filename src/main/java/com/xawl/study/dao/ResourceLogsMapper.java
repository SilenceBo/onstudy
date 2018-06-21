package com.xawl.study.dao;

import java.util.Map;

import com.xawl.study.model.Resource;
import com.xawl.study.model.ResourceLogs;

public interface ResourceLogsMapper {

	ResourceLogs selectResByRidAndOrdery(Map<String, String> map);

	int insertResourceLogs(ResourceLogs resourceLogs);

	ResourceLogs selectResByCidAndSidAndOrdery(Map<String, String> map);

	int updateGrade(Map<String, String> map);

	void updateOredery(Resource resource);

	void deleteByCidAndRid(Resource resource);

	
}
