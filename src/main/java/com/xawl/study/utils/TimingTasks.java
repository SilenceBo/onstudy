package com.xawl.study.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.xawl.study.dao.AdminNoticeMapper;
import com.xawl.study.dao.CourseNoticeMapper;
import com.xawl.study.model.AdminNotice;
import com.xawl.study.model.AdminNoticeExample;
import com.xawl.study.model.CourseNotice;
import com.xawl.study.model.CourseNoticeExample;

@Component("timingTasks")
public class TimingTasks {
	Date date;
	SimpleDateFormat sf;
	@Autowired
	CourseNoticeMapper courseNoticeMapper;
	@Autowired
	AdminNoticeMapper adminNoticeMapper;

	public void excute() {
		date = new Date();
		sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		detectTeacher();
		detectAdmin();
	}

	private void detectAdmin() {
		CourseNoticeExample example = new CourseNoticeExample();
		example.createCriteria().andIsittimedEqualTo(true);
		List<CourseNotice> list = courseNoticeMapper.selectByExample(example);
		for (CourseNotice courseNotice : list) {
			try {
				Date parse = sf.parse(courseNotice.getTime());
				if (date.getTime() >= parse.getTime()) {
					courseNotice.setIssendout(true);
					courseNotice.setIsittimed(false);
					courseNoticeMapper
							.updateByPrimaryKeySelective(courseNotice);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}

		}
	}

	private void detectTeacher() {
		AdminNoticeExample example = new AdminNoticeExample();
		example.createCriteria().andIsittimedEqualTo(true);
		List<AdminNotice> list = adminNoticeMapper.selectByExample(example);
		for (AdminNotice adminNotice : list) {
			try {
				Date parse = sf.parse(adminNotice.getTime());
				if (date.getTime() >= parse.getTime()) {
					adminNotice.setIssendout(true);
					adminNotice.setIsittimed(false);
					adminNoticeMapper.updateByPrimaryKeySelective(adminNotice);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
	}
}
