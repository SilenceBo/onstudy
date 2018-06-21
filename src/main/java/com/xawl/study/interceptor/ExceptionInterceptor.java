package com.xawl.study.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.xawl.study.dao.ErrLogMapper;
import com.xawl.study.model.ErrLog;
import com.xawl.study.model.ErrLogWithBLOBs;
import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;

public class ExceptionInterceptor implements HandlerExceptionResolver {

	@Autowired
	ErrLogMapper errLogMapper;

	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		ErrLogWithBLOBs errLogWithBLOBs = new ErrLogWithBLOBs();
		errLogWithBLOBs.setDate(new Date());
		StackTraceElement[] trace = ex.getStackTrace();
		String message = "\tat " + ex.getMessage() + "\r\n";
		for (StackTraceElement s : trace) {
			message += "\tat " + s + "\r\n";
		}
		errLogWithBLOBs.setText1(message);
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		Teacher teacher = (Teacher) request.getSession().getAttribute(
				"user_teacher");
		if (student != null) {
			errLogWithBLOBs.setSid(Integer.parseInt(student.getId()));
		} else if (teacher != null) {
			errLogWithBLOBs.setTid(teacher.getTid());
		}
		errLogMapper.insertSelective(errLogWithBLOBs);

		return null;
	}
}
