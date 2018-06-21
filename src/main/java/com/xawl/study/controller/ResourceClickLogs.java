package com.xawl.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xawl.study.service.ResourceClickLogsService;
import com.xawl.study.utils.Result;

@Controller
@RequestMapping("/ResourceClickLogs")
public class ResourceClickLogs {
	@Autowired
	ResourceClickLogsService resourceClickLogsService;

	@RequestMapping("/findByRid.action")
	@ResponseBody
	public Result findByRid(Integer rid, Integer pn) {
		if (pn == null) {
			pn = 1;
		}
		Result result = resourceClickLogsService.findByRid(rid, pn);
		return result;
	}
}
