package com.xawl.study.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xawl.study.dao.CourseNoticeMapper;
import com.xawl.study.dao.NoticeLogsMapper;
import com.xawl.study.model.AdminNotice;
import com.xawl.study.model.CourseAndTeacher;
import com.xawl.study.model.CourseNotice;
import com.xawl.study.model.CourseNoticeExample;
import com.xawl.study.model.NoticeLogs;
import com.xawl.study.model.NoticeLogsExample;
import com.xawl.study.model.CourseNoticeExample.Criteria;
import com.xawl.study.model.Student;
import com.xawl.study.service.CourseNoticeService;
import com.xawl.study.service.StudentInformationService;
import com.xawl.study.utils.Result;

@Service
public class CourseNoticeServiceImpl implements CourseNoticeService {

	@Autowired
	CourseNoticeMapper courseNoticeMapper;
	@Autowired
	StudentInformationService studentInformationService;
	@Autowired
	NoticeLogsMapper noticeLogsMapper;

	public Result findCourseNoticeByCid(Student student) {
		Result result = studentInformationService.selectMyCourse(student);
		List<CourseAndTeacher> list = (List<CourseAndTeacher>) result.getData();
		if (list != null && list.size() > 0) {
			CourseNoticeExample example = new CourseNoticeExample();
			Criteria createCriteria = example.createCriteria();
			List<Integer> values = new ArrayList<Integer>();
			for (CourseAndTeacher courseAndTeacher : list) {
				values.add(courseAndTeacher.getCid());
			}
			createCriteria.andCidIn(values);
			createCriteria.andIssendoutEqualTo(true);
			example.setOrderByClause("time");
			List<CourseNotice> listCourseNotice = courseNoticeMapper
					.selectByExample(example);
			Iterator<CourseNotice> iterator = listCourseNotice.iterator();
			while (iterator.hasNext()) {
				NoticeLogsExample Nexample = new NoticeLogsExample();
				CourseNotice courseNotice = iterator.next();
				Nexample.createCriteria()
						.andCnidEqualTo(courseNotice.getCnid())
						.andSidEqualTo(Integer.parseInt(student.getId()));
				List<NoticeLogs> NList = noticeLogsMapper
						.selectByExample(Nexample);
				if (NList == null || NList.size() <= 0) {
					courseNotice.setIsBrowsed(1);
				} else if (NList.get(0).getStatus() == 2) {
					iterator.remove();
				} else if (NList.get(0).getStatus() == 0) {
					courseNotice.setIsBrowsed(0);
				}
			}
			return Result.ok(listCourseNotice);
		}
		return Result.ok();
	}

	public Result addCourseNotice(CourseNotice courseNotice) {
		try {
			courseNoticeMapper.insertSelective(courseNotice);
			return Result.ok();
		} catch (Exception e) {
			return Result.build(405, "发布失败");
		}
	}

	public Result findAll() {
		CourseNoticeExample example = new CourseNoticeExample();
		example.setOrderByClause("time");
		List<CourseNotice> list = courseNoticeMapper.selectByExample(example);
		return Result.ok(list);
	}

	public Result deleteByCnid(Integer cnid) {
		try {
			courseNoticeMapper.deleteByPrimaryKey(cnid);
			return Result.ok();
		} catch (Exception e) {
			return Result.build(405, "删除失败");
		}
	}

	public Result findByCnid(Integer cnid) {
		try {
			CourseNotice cnotice = courseNoticeMapper.selectByPrimaryKey(cnid);
			return Result.ok(cnotice);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "失败");
		}
	}

	public Result update(CourseNotice courseNotice) {
		try {
			courseNoticeMapper.updateByPrimaryKeySelective(courseNotice);
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "失败");
		}
	}

	public Result findByTid(Integer tid, Integer pn) {
		try {
			PageHelper.startPage(pn, 5);
			CourseNoticeExample example = new CourseNoticeExample();
			example.setOrderByClause("time");
			example.createCriteria().andTidEqualTo(tid);
			List<CourseNotice> list = courseNoticeMapper
					.selectByExample(example);
			PageInfo page=new PageInfo(list,5); 
			return Result.ok(page);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "失败");
		}

	}
}
