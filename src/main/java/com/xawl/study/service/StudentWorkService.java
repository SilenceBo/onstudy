package com.xawl.study.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.xawl.study.model.StudentWork;
import com.xawl.study.utils.Result;

public interface StudentWorkService {

	Result addWork(StudentWork studentWork, HttpServletRequest request, MultipartFile files);

	Result findBuTwid(Integer twid);

	Result updateWork(StudentWork studentWork, HttpServletRequest request, MultipartFile files);

	Result deleteByTwid(Integer twid, HttpServletRequest request);

	Result deleteBySwid(Integer swid);

	Result findByTwidOrCid(Integer twid, Integer cid);

	Result findByTwidOrSid(Integer twid,Integer sid);

	StudentWork selectBySidOrTwid(Integer twid, String id);


	Result addMark(StudentWork studentWork);

	StudentWork findBySwid(Integer swid);

}
