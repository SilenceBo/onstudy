package com.xawl.study.service.impl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.xawl.study.dao.StudentWorkMapper;
import com.xawl.study.model.StudentWork;
import com.xawl.study.model.StudentWorkExample;
import com.xawl.study.service.StudentWorkService;
import com.xawl.study.utils.Result;
import com.xawl.study.utils.WorkUtils;

@Service
public class StudentWorkServiceImpl implements StudentWorkService {
	@Autowired
	StudentWorkMapper studentWorkMapper;

	public Result addWork(StudentWork studentWork, HttpServletRequest request,
			MultipartFile files) {
		try {
			studentWork.setFile(WorkUtils.upload(request, files));
			studentWorkMapper.insertSelective(studentWork);
			return Result.ok();
		} catch (IOException e) {
			e.printStackTrace();
			return Result.build(405, "上传失败");
		}
	}

	public Result findBuTwid(Integer twid) {
		try {
			StudentWorkExample example = new StudentWorkExample();
			example.createCriteria().andTwidEqualTo(twid);
			List<StudentWork> list = studentWorkMapper.selectByExample(example);
			return new Result(list);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "出错");
		}
	}

	public Result updateWork(StudentWork studentWork,
			HttpServletRequest request, MultipartFile files) {
		try {
			@SuppressWarnings("unchecked")
			List<StudentWork> list = (List<StudentWork>) findByTwidOrSid(
					studentWork.getTwid(), studentWork.getSid()).getData();
			studentWork = list.get(0);
			WorkUtils.deleteWork(studentWork.getFile(), request);
			studentWork.setFile(WorkUtils.upload(request, files));
			studentWork.setFilename(files.getOriginalFilename());
			studentWorkMapper.updateByPrimaryKeySelective(studentWork);
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "出错");
		}
	}

	public Result deleteByTwid(Integer twid, HttpServletRequest request) {
		try {
			StudentWorkExample example = new StudentWorkExample();
			example.createCriteria().andTwidEqualTo(twid);
			List<StudentWork> list = studentWorkMapper.selectByExample(example);
			for (StudentWork studentWork : list) {
				WorkUtils.deleteWork(studentWork.getFile(), request);
			}
			studentWorkMapper.deleteByExample(example);
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "出错");
		}
	}

	public Result deleteBySwid(Integer swid) {
		try {
			studentWorkMapper.deleteByPrimaryKey(swid);
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "出错");
		}
	}

	public Result findByTwidOrCid(Integer twid, Integer cid) {
		try {
			StudentWorkExample example = new StudentWorkExample();
			example.createCriteria().andTwidEqualTo(twid).andCidEqualTo(cid);
			List<StudentWork> list = studentWorkMapper.selectByExample(example);
			return new Result(list);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "出错");
		}
	}

	public Result findByTwidOrSid(Integer twid, Integer sid) {
		try {
			StudentWorkExample example = new StudentWorkExample();
			example.createCriteria().andTwidEqualTo(twid).andSidEqualTo(sid);
			List<StudentWork> list = studentWorkMapper.selectByExample(example);
			return new Result(list);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "出错");
		}
	}

	public StudentWork selectBySidOrTwid(Integer twid, String id) {
		try {
			StudentWorkExample example = new StudentWorkExample();
			example.createCriteria().andTwidEqualTo(twid)
					.andSidEqualTo(Integer.parseInt(id));
			List<StudentWork> list = studentWorkMapper.selectByExample(example);
			if (list == null || list.size() <= 0) {
				return null;
			} else {
				return list.get(0);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Result addMark(StudentWork studentWork) {

		try {
			StudentWorkExample example = new StudentWorkExample();
			example.createCriteria().andTwidEqualTo(studentWork.getTwid())
					.andSidEqualTo(studentWork.getSid());
			List<StudentWork> list = studentWorkMapper.selectByExample(example);
			if (list == null || list.size() <= 0) {
				return Result.build(405, "他还没有提交作业");
			} else {
				StudentWork work = list.get(0);
				work.setMark(studentWork.getMark());
				studentWorkMapper.updateByPrimaryKey(work);
			}
			return new Result(200, "操作成功", null);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "操作失败");
		}

	}

	public StudentWork findBySwid(Integer swid) {
		try {
			StudentWork list = studentWorkMapper.selectByPrimaryKey(swid);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
