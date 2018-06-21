package com.xawl.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xawl.study.model.Resource;
import com.xawl.study.model.ResourceLogs;
import com.xawl.study.model.Student;
import com.xawl.study.service.ResourceClickLogsService;
import com.xawl.study.service.ResourceLogsService;
import com.xawl.study.service.ResourceService;
import com.xawl.study.utils.StudyResult;

@Controller
@RequestMapping("resourceLogs")
public class ResourceLogsController {
	@Autowired
	ResourceLogsService resourceLogsService;
	@Autowired
	ResourceService resourceService;
	@Autowired
	ResourceClickLogsService resourceClickLogsService;

	@RequestMapping("play.action")
	@ResponseBody
	public StudyResult play(HttpServletRequest request,
			HttpServletResponse response, ResourceLogs resourceLogs) {
		StudyResult studyResult = null;
		Resource resource = resourceService.findByRid(resourceLogs.getRid());
		resourceLogs.setCid(resource.getCid());
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		if (student == null) {
			studyResult = resourceService.bofang(resourceLogs, request);
			return studyResult;
		}
		resourceLogs.setSid(Integer.parseInt(student.getId()));
		resourceLogs.setOrdery(resource.getOrdery());
		studyResult = resourceService.play(resourceLogs, request);
		if(studyResult.getStatus()==200){
			boolean b = resourceClickLogsService.Record(resource.getRid(), request);
		}
		return studyResult;
	}

	@RequestMapping("answer.action")
	@ResponseBody
	public StudyResult answer(HttpServletRequest request,
			HttpServletResponse response, String answer, Integer cid,
			Integer ordery) {
		StudyResult studyResult = null;
		/*System.out.println("answer=" + answer + "cid=" + cid + "ordery="
				+ ordery);*/
		String[] answers = answer.split(",");
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		if (student != null) {
			studyResult = resourceService.updateAnswer(answers, ordery, cid,
					Integer.parseInt(student.getId()));
		} else {
			studyResult = new StudyResult("身份错误", 200, null);
		}
		return studyResult;
	}
}
