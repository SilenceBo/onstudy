package com.xawl.study.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xawl.study.dao.ResourceClickLogsMapper;
import com.xawl.study.model.Resource;
import com.xawl.study.model.ResourceClickLogs;
import com.xawl.study.model.ResourceClickLogsExample;
import com.xawl.study.model.Student;
import com.xawl.study.service.ResourceClickLogsService;
import com.xawl.study.service.ResourceService;
import com.xawl.study.utils.Result;

@Service
public class ResourceClickLogsServiceImpl implements ResourceClickLogsService {
	@Autowired
	ResourceClickLogsMapper resourceClickLogsMapper;
	@Autowired
	ResourceService resourceService;

	public boolean Record(Integer rid, HttpServletRequest request) {
		try {
			Resource resource = resourceService.findByRid(rid);
			Student student = (Student) request.getSession().getAttribute(
					"user_student");
			if (student != null) {
				resourceClickLogsMapper.clcik(rid);
				ResourceClickLogsExample example = new ResourceClickLogsExample();
				example.createCriteria()
						.andSidEqualTo(Integer.parseInt(student.getId()))
						.andRidEqualTo(rid);
				List<ResourceClickLogs> list = resourceClickLogsMapper
						.selectByExample(example);
				if (list != null && list.size() > 0) {
					list.get(0).setClicknum(list.get(0).getClicknum() + 1);
					list.get(0).setLastdata(new Date());
					resourceClickLogsMapper.updateByPrimaryKeySelective(list
							.get(0));
				} else {
					ResourceClickLogs resourceClickLogs = new ResourceClickLogs();
					resourceClickLogs.setCid(resource.getCid());
					resourceClickLogs.setRid(rid);
					resourceClickLogs.setSid(Integer.parseInt(student.getId()));
					resourceClickLogs.setSname(student.getSname());
					resourceClickLogs.setLastdata(new Date());
					resourceClickLogsMapper.insertSelective(resourceClickLogs);
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public Result findByRid(Integer rid, Integer pn) {
		ResourceClickLogsExample example = new ResourceClickLogsExample();
		example.createCriteria().andRidEqualTo(rid);
		PageHelper.startPage(pn, 8);
		List<ResourceClickLogs> list = resourceClickLogsMapper
				.selectByExample(example);
		PageInfo pageInfo = new PageInfo(list, 5);
		int sum = resourceClickLogsMapper.selectSUMClickNum(rid);
		Result result = new Result();
		result.setMsg("ok");
		result.setStatus(200);
		result.setData(pageInfo);
		result.setData2(sum);
		return result;
	}
}
