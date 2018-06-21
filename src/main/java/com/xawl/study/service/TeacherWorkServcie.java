package com.xawl.study.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.xawl.study.model.TeacherWork;
import com.xawl.study.utils.Result;

public interface TeacherWorkServcie {

	Result findByCid(Integer cid, String string);

	Result deleteWork(Integer twid, HttpServletRequest request);

	Result updateWork(HttpServletRequest request, MultipartFile multipartFile, TeacherWork teacherWork);

	Result insertWork(TeacherWork teacherWork);


	Result findByTidOrCid(Integer tid, Integer cid);

	Result findByTwid(Integer twid);

	Result addWork(TeacherWork teacherWork, HttpServletRequest request,
			MultipartFile files);

}
