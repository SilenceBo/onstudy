package com.xawl.study.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.AdminNoticeMapper;
import com.xawl.study.dao.NoticeLogsMapper;
import com.xawl.study.model.AdminNotice;
import com.xawl.study.model.AdminNoticeExample;
import com.xawl.study.model.CourseNotice;
import com.xawl.study.model.NoticeLogs;
import com.xawl.study.model.NoticeLogsExample;
import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.AdminNoticeService;
import com.xawl.study.utils.Result;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {
	@Autowired
	AdminNoticeMapper adminNoticeMapper;
	@Autowired
	NoticeLogsMapper noticeLogsMapper;

	public Result findStudentNotice(Student student) {
		try {
			AdminNoticeExample example = new AdminNoticeExample();
			List<Integer> list = new ArrayList<Integer>();
			list.add(2);
			list.add(0);
			example.createCriteria().andNotivetypeIn(list)
					.andIssendoutEqualTo(true);
			example.setOrderByClause("time desc");
			List<AdminNotice> data = adminNoticeMapper.selectByExample(example);
			Iterator<AdminNotice> iterator = data.iterator();
			while (iterator.hasNext()) {
				AdminNotice adminNotice=iterator.next();
				NoticeLogsExample Nexample = new NoticeLogsExample();
				Nexample.createCriteria().andAnidEqualTo(adminNotice.getAnid())
						.andSidEqualTo(Integer.parseInt(student.getId()));
				List<NoticeLogs> NList = noticeLogsMapper
						.selectByExample(Nexample);
				if (!(NList != null && NList.size() > 0)) {
					adminNotice.setIsBrowsed(1);
				} else if (NList.get(0).getStatus() == 2) {
					iterator.remove();
				} else if (NList.get(0).getStatus() == 0) {
					adminNotice.setIsBrowsed(0);
				}
			}
			return Result.ok(data);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "查询失败");
		}

	}

	public Result insertNotice(AdminNotice adminNotice) {
		try {
			adminNoticeMapper.insertSelective(adminNotice);
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "插入失败");
		}

	}

	public Result findAllNotice() {
		try {
			AdminNoticeExample example = new AdminNoticeExample();
			example.createCriteria();
			List<AdminNotice> list = adminNoticeMapper.selectByExample(example);
			return Result.ok(list);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "查询失败");
		}

	}

	public Result deleteById(Integer anid) {
		try {
			adminNoticeMapper.deleteByPrimaryKey(anid);
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "删除失败");
		}
	}

	public Result findByAnid(Integer anid) {
		try {
			AdminNotice adminNotice = adminNoticeMapper.selectByPrimaryKey(anid);
			return Result.ok(adminNotice);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "失败");
		}
	}

	public Result findTeacherNotice(Teacher teacher) {
		try {
			AdminNoticeExample example = new AdminNoticeExample();
			List<Integer> list = new ArrayList<Integer>();
			list.add(2);
			list.add(1);
			example.createCriteria().andNotivetypeIn(list)
					.andIssendoutEqualTo(true);
			example.setOrderByClause("time desc");
			List<AdminNotice> data = adminNoticeMapper.selectByExample(example);

			for (AdminNotice adminNotice : data) {
				NoticeLogsExample Nexample = new NoticeLogsExample();
				Nexample.createCriteria().andAnidEqualTo(adminNotice.getAnid())
						.andTidEqualTo(teacher.getTid());
				List<NoticeLogs> NList = noticeLogsMapper
						.selectByExample(Nexample);
				if (NList == null || NList.size() <= 0) {
					adminNotice.setIsBrowsed(1);
				} else if (NList.get(0).getStatus() == 2) {
					data.remove(adminNotice);
				} else if (NList.get(0).getStatus() == 0) {
					adminNotice.setIsBrowsed(0);
				}
			}
			return Result.ok(data);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "查询失败");
		}
	}
}
