package com.xawl.study.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.ResourceLogsMapper;
import com.xawl.study.service.ResourceLogsService;
@Service
public class ResourceLogsServiceImpl implements ResourceLogsService{
	@Autowired
	ResourceLogsMapper ResourceLogsMapper;
}
