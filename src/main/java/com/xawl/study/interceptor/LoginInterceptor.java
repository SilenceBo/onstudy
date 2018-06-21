package com.xawl.study.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;

public class LoginInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		System.out.println(request.getRequestURI() + "xxxxxxxxxxxxxxxxxx");
		if (request.getSession().getAttribute("admin") != null) {
			return true;
		}
		Student student = (Student) request.getSession().getAttribute(
				"user_student");
		Teacher teacher = (Teacher) request.getSession().getAttribute(
				"user_teacher");
		if (student == null && teacher == null) {
			request.setAttribute("msg", "请登录后进行学习");
			request.getRequestDispatcher("/front/index.jsp").forward(request,
					response);
			return false;
		}
		return true;

	}

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
