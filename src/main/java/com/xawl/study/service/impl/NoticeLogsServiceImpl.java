package com.xawl.study.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.NoticeLogsMapper;
import com.xawl.study.model.NoticeLogs;
import com.xawl.study.model.NoticeLogsExample;
import com.xawl.study.service.NoticeLogsService;
import com.xawl.study.utils.Result;

@Service
public class NoticeLogsServiceImpl implements NoticeLogsService {
	@Autowired
	NoticeLogsMapper noticeLogsMapper;

	public Result deleteByAnidOrSid(String id, Integer anid) {
		try {
			NoticeLogsExample example = new NoticeLogsExample();
			example.createCriteria().andAnidEqualTo(anid)
					.andSidEqualTo(Integer.parseInt(id));
			List<NoticeLogs> list = noticeLogsMapper.selectByExample(example);
			if (list == null || list.size() <= 0) {
				NoticeLogs noticeLogs = new NoticeLogs();
				noticeLogs.setAnid(anid);
				noticeLogs.setSid(Integer.parseInt(id));
				noticeLogs.setStatus(2);
				noticeLogsMapper.insertSelective(noticeLogs);
			} else {
				NoticeLogs noticeLogs = list.get(0);
				noticeLogs.setStatus(2);
				noticeLogsMapper.updateByPrimaryKeySelective(noticeLogs);
			}

			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "删除失败");
		}
	}

	public Result deleteByCnidOrSid(String id, Integer cnid) {
		try {
			NoticeLogsExample example = new NoticeLogsExample();
			example.createCriteria().andCnidEqualTo(cnid)
					.andSidEqualTo(Integer.parseInt(id));
			List<NoticeLogs> list = noticeLogsMapper.selectByExample(example);
			if (list == null || list.size() <= 0) {
				NoticeLogs noticeLogs = new NoticeLogs();
				noticeLogs.setCnid(cnid);
				noticeLogs.setSid(Integer.parseInt(id));
				noticeLogs.setStatus(2);
				noticeLogsMapper.insertSelective(noticeLogs);
			} else {
				NoticeLogs noticeLogs = list.get(0);
				noticeLogs.setStatus(2);
				noticeLogsMapper.updateByPrimaryKeySelective(noticeLogs);
			}
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "删除失败");
		}
	}

	public Result deleteByAnidOrTid(Integer tid, Integer anid) {
		try {
			NoticeLogsExample example = new NoticeLogsExample();
			example.createCriteria().andAnidEqualTo(anid).andTidEqualTo(tid);
			List<NoticeLogs> list = noticeLogsMapper.selectByExample(example);
			if (list == null || list.size() <= 0) {
				NoticeLogs noticeLogs = new NoticeLogs();
				noticeLogs.setAnid(anid);
				noticeLogs.setSid(tid);
				noticeLogs.setStatus(2);
				noticeLogsMapper.insertSelective(noticeLogs);
			} else {
				NoticeLogs noticeLogs = list.get(0);
				noticeLogs.setStatus(2);
				noticeLogsMapper.updateByPrimaryKeySelective(noticeLogs);
			}
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "删除失败");
		}
	}

	public void insertStudent(String id, Integer anid) {
		NoticeLogsExample example = new NoticeLogsExample();
		example.createCriteria().andAnidEqualTo(anid)
				.andSidEqualTo(Integer.parseInt(id));
		List<NoticeLogs> list = noticeLogsMapper.selectByExample(example);
		if (list == null || list.size() <= 0) {
			NoticeLogs noticeLogs = new NoticeLogs();
			noticeLogs.setAnid(anid);
			noticeLogs.setSid(Integer.parseInt(id));
			noticeLogs.setStatus(1);
			noticeLogsMapper.insertSelective(noticeLogs);
		} else {
			NoticeLogs noticeLogs = list.get(0);
			noticeLogs.setStatus(1);
			noticeLogsMapper.updateByPrimaryKey(noticeLogs);
		}
	}

	public void insertTeacher(Integer tid, Integer anid) {
		NoticeLogsExample example = new NoticeLogsExample();
		example.createCriteria().andAnidEqualTo(anid).andTidEqualTo(tid);
		List<NoticeLogs> list = noticeLogsMapper.selectByExample(example);
		if (list == null || list.size() <= 0) {
			NoticeLogs noticeLogs = new NoticeLogs();
			noticeLogs.setAnid(anid);
			noticeLogs.setTid(tid);
			noticeLogs.setStatus(1);
			noticeLogsMapper.insertSelective(noticeLogs);
		} else {
			NoticeLogs noticeLogs = list.get(0);
			noticeLogs.setStatus(1);
			noticeLogsMapper.updateByPrimaryKey(noticeLogs);
		}
	}

	public void insertCourseStudent(String id, Integer cnid) {
		NoticeLogsExample example = new NoticeLogsExample();
		example.createCriteria().andCnidEqualTo(cnid)
				.andSidEqualTo(Integer.parseInt(id));
		List<NoticeLogs> list = noticeLogsMapper.selectByExample(example);
		if (list == null || list.size() <= 0) {
			NoticeLogs noticeLogs = new NoticeLogs();
			noticeLogs.setCnid(cnid);
			noticeLogs.setSid(Integer.parseInt(id));
			noticeLogs.setStatus(1);
			noticeLogsMapper.insertSelective(noticeLogs);
		} else {
			NoticeLogs noticeLogs = list.get(0);
			noticeLogs.setStatus(1);
			noticeLogsMapper.updateByPrimaryKey(noticeLogs);
		}
	}
}
