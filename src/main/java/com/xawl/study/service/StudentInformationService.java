package com.xawl.study.service;

import com.xawl.study.model.Student;
import com.xawl.study.utils.Result;

public interface StudentInformationService {

	Result selectMyCourse(Student student);

	Result selectInformation(Student student);

}
