package com.xawl.study.service;

import com.xawl.study.model.Teacher;
import com.xawl.study.model.TeacherWork;
import com.xawl.study.utils.Result;

public interface TeacherformationService {

	Result selectInformation(Teacher teacher);

	Result showWOrkInformation(TeacherWork teacherWork);

	Result showWOrkInformation(Integer classId);

	Result plShowWOrkInformation(TeacherWork teacherWork);

}
