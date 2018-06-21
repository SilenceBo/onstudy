package com.xawl.study.service;

import com.xawl.study.model.AdminNotice;
import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;
import com.xawl.study.utils.Result;

public interface AdminNoticeService {

	Result findStudentNotice(Student student);

	Result insertNotice(AdminNotice adminNotice);

	Result findAllNotice();

	Result deleteById(Integer anid);

	Result findByAnid(Integer anid);

	Result findTeacherNotice(Teacher teacher);

}
