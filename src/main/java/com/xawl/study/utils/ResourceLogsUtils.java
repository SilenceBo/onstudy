package com.xawl.study.utils;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.xawl.study.dao.ResourceLogsMapper;
import com.xawl.study.dao.ResourceMapper;
import com.xawl.study.model.Resource;
import com.xawl.study.model.ResourceLogs;
import com.xawl.study.model.Student;
public class ResourceLogsUtils {
	public  boolean isPlay(ResourceLogs res,ResourceMapper resourceMapper, ResourceLogsMapper resourceLogsMapper, Student student) {
		Map<String, String> map = new HashMap<String, String>();
		//System.out.println(resourceMapper);
		Integer minO = resourceMapper.selectMinOrdery(res.getCid());
		if (minO == res.getOrdery()) {
			return true;
		}
		map.put("cid", res.getCid().toString());
		map.put("ordery", res.getOrdery().toString());
		minO = resourceMapper.selectMaxOrdery(map);
		map.clear();
		map.put("cid", res.getCid().toString());
		map.put("sid", student.getId());
		map.put("ordery", minO.toString());
		ResourceLogs resourceLogs = resourceLogsMapper
				.selectResByCidAndSidAndOrdery(map);
		if(resourceLogs==null){
			return false;
		}
		Resource resource = resourceMapper.selectByPrimaryKey(resourceLogs.getRid());
		if(resource.getAnswerString().length()==0||resource.getAnswerString()==null||resource.getAnswerString()==""){
			return true;
		}
		else if (resourceLogs != null && resourceLogs.getGrade() >=resource.getAnswerString().split("").length*6) {
			return true;
		}
		return false;
	}
}
