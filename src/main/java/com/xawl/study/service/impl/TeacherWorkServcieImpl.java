package com.xawl.study.service.impl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.xawl.study.dao.StudentWorkMapper;
import com.xawl.study.dao.TeacherWorkMapper;
import com.xawl.study.model.StudentWork;
import com.xawl.study.model.StudentWorkExample;
import com.xawl.study.model.TeacherWork;
import com.xawl.study.model.TeacherWorkExample;
import com.xawl.study.model.TeacherWorkVo;
import com.xawl.study.service.StudentWorkService;
import com.xawl.study.service.TeacherWorkServcie;
import com.xawl.study.utils.Result;
import com.xawl.study.utils.WorkUtils;

@Service
public class TeacherWorkServcieImpl implements TeacherWorkServcie {
	@Autowired
	TeacherWorkMapper teacherWorkMapper;
	@Autowired
	StudentWorkMapper studentWorkMapper;
	@Autowired
	StudentWorkService studentWorkService;

	public Result findByCid(Integer cid, String sid) {
		try {
			TeacherWorkExample example = new TeacherWorkExample();
			example.createCriteria().andCidEqualTo(cid);
			List<TeacherWork> list = teacherWorkMapper.selectByExample(example);
			List<TeacherWorkVo> tlist = new ArrayList<TeacherWorkVo>();
			for (TeacherWork teacherWork : list) {
				TeacherWorkVo teacherWorkVo = new TeacherWorkVo();
				teacherWorkVo.setTeacherWork(teacherWork);
				StudentWorkExample ex = new StudentWorkExample();
				ex.createCriteria().andTwidEqualTo(teacherWork.getTwid())
						.andSidEqualTo(Integer.parseInt(sid));
				List<StudentWork> stulist = studentWorkMapper
						.selectByExample(ex);
				if (stulist != null && stulist.size() > 0) {
					teacherWorkVo.setSubmit(true);
					teacherWorkVo.setStudentWork(stulist.get(0));
				} else {
					teacherWorkVo.setSubmit(false);
				}

				Date s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.parse(teacherWorkVo.getTeacherWork().getDeadline());
				teacherWorkVo.setOverdue(new Date().getTime() < s.getTime());
				tlist.add(teacherWorkVo);
			}
			return new Result(tlist);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "出错");
		}
	}

	public Result deleteWork(Integer twid, HttpServletRequest request) {
		Result result = studentWorkService.deleteByTwid(twid, request);
		if (result.getStatus() == 200) {
			TeacherWorkExample example = new TeacherWorkExample();
			example.createCriteria().andTwidEqualTo(twid);
			TeacherWork work = teacherWorkMapper.selectByPrimaryKey(twid);
			teacherWorkMapper.deleteByExample(example);
			WorkUtils.deleteWork(work.getFile(), request);
			return Result.ok();
		} else {
			return Result.build(405, "删除失败");
		}
	}

	public Result updateWork(HttpServletRequest request,
			MultipartFile multipartFile, TeacherWork teacherWork) {
		try {
			TeacherWork work = teacherWorkMapper.selectByPrimaryKey(teacherWork
					.getTwid());
			WorkUtils.deleteWork(work.getFile(), request);
			if (multipartFile.getSize() != 0) {
				teacherWork.setFile(WorkUtils.upload(request, multipartFile));
			}
			teacherWorkMapper.updateByPrimaryKeySelective(teacherWork);
			return new Result(teacherWork);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "出错");
		}
	}

	public Result insertWork(TeacherWork teacherWork) {
		try {
			teacherWorkMapper.insertSelective(teacherWork);
			return new Result(200, "上传成功", teacherWork);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "出错");
		}
	}

	public Result findByTidOrCid(Integer tid, Integer cid) {
		try {
			TeacherWorkExample example = new TeacherWorkExample();
			example.createCriteria().andTidEqualTo(tid).andCidEqualTo(cid);
			List<TeacherWork> list = teacherWorkMapper.selectByExample(example);
			return Result.ok(list);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "出错");
		}
	}

	public Result findByTwid(Integer twid) {
		try {
			TeacherWorkExample example = new TeacherWorkExample();
			example.createCriteria().andTwidEqualTo(twid);
			TeacherWork teacherWork = teacherWorkMapper
					.selectByPrimaryKey(twid);
			return Result.ok(teacherWork);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "查询失败");
		}
	}

	public Result addWork(TeacherWork teacherWork, HttpServletRequest request,
			MultipartFile files) {
		try {
			teacherWork.setFile(WorkUtils.upload(request, files));
			teacherWorkMapper.insertSelective(teacherWork);
			return Result.ok();
		} catch (IOException e) {
			e.printStackTrace();
			return Result.build(405, "上传失败");
		}
	}

}
