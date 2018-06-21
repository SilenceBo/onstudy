package com.xawl.study.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ResponseBody;

import com.xawl.study.utils.Result;

public interface ResourceClickLogsService {

	boolean Record(Integer rid, HttpServletRequest request);

	Result findByRid(Integer rid, Integer pn);
}
