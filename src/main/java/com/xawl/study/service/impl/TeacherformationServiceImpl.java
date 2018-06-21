package com.xawl.study.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.CourseAndClassMapper;
import com.xawl.study.dao.StudentMapper;
import com.xawl.study.model.AdminNotice;
import com.xawl.study.model.ClassName;
import com.xawl.study.model.ClassNameVo;
import com.xawl.study.model.ClassVo;
import com.xawl.study.model.CourseAndClassCustomer;
import com.xawl.study.model.PlDownload;
import com.xawl.study.model.StudentVo;
import com.xawl.study.model.StudentWork;
import com.xawl.study.model.Teacher;
import com.xawl.study.model.TeacherWork;
import com.xawl.study.service.AdminNoticeService;
import com.xawl.study.service.ClassNameService;
import com.xawl.study.service.CourseAndClassservice;
import com.xawl.study.service.StudentService;
import com.xawl.study.service.StudentWorkService;
import com.xawl.study.service.TeacherWorkServcie;
import com.xawl.study.service.TeacherformationService;
import com.xawl.study.utils.Result;

@Service
public class TeacherformationServiceImpl implements TeacherformationService {

	@Autowired
	AdminNoticeService adminNoticeService;
	@Autowired
	TeacherWorkServcie teacherWorkServcie;
	@Autowired
	CourseAndClassservice courseAndClassservice;
	@Autowired
	StudentService studentService;
	@Autowired
	StudentWorkService studentWorkService;
	@Autowired
	ClassNameService classNameService;
	@Autowired
	CourseAndClassMapper courseAndClassMapper;
	@Autowired
	StudentMapper studentMapper;

	@SuppressWarnings("unchecked")
	public Result selectInformation(Teacher teacher) {
		Integer num = 0;
		List<AdminNotice> data = (List<AdminNotice>) adminNoticeService
				.findTeacherNotice(teacher).getData();
		if (data != null && data.size() > 0) {
			for (AdminNotice adminNotice : data) {
				if (adminNotice.getIsBrowsed() != null
						&& adminNotice.getIsBrowsed() == 1) {
					num++;
				}
			}
		}
		return Result.ok(num);
	}

	public Result showWOrkInformation(TeacherWork teacherWork) {
		try {
			Result result = teacherWorkServcie
					.findByTwid(teacherWork.getTwid());
			teacherWork = (TeacherWork) result.getData();
			List<CourseAndClassCustomer> course = courseAndClassservice
					.findByCourseId(teacherWork.getCid());
			List<ClassNameVo> ClassList = new ArrayList<ClassNameVo>();
			for (CourseAndClassCustomer CourseAndClassCustomer : course) {
				ClassName className = classNameService
						.selectByclassId(CourseAndClassCustomer.getClassId());
				ClassNameVo classNameVo = new ClassNameVo();
				classNameVo.setClassName(className);
				ClassList.add(classNameVo);
			}
			for (ClassNameVo classNamevo : ClassList) {
				List<StudentVo> list = studentService
						.selectByClassId(classNamevo.getClassName()
								.getClassId());
				Integer num = 0;
				if (list != null & list.size() > 0) {
					List<StudentVo> listVo = list;
					classNamevo.setTotalNumber(listVo.size());
					for (StudentVo studentVo : listVo) {
						StudentWork studentWork = studentWorkService
								.selectBySidOrTwid(teacherWork.getTwid(),
										studentVo.getId());

						if (studentWork == null) {
							studentVo.setSubmitWork(false);
						} else {
							num++;
							// System.out.println(studentWork);
							studentVo.setSubmitWork(true);
							studentVo.setWork(studentWork);
						}
					}
					classNamevo.setStudentLst(listVo);
					classNamevo.setSbumitNumber(num);
				}
			}
			return Result.ok(ClassList);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "查询失败");
		}

	}

	public Result showWOrkInformation(Integer classId) {
		ClassVo classVo = new ClassVo();
		List<StudentVo> Class = studentMapper.selectByClassId(classId);
		classVo.setList(Class);
		classVo.setTotleNum(Class.size());
		ClassName s = classNameService.selectByclassId(classId);
		classVo.setClassName(s.getName());
		return new Result(200, "ok", classVo);
	}

	public Result plShowWOrkInformation(TeacherWork teacherWork) {
		try {
			Result result = teacherWorkServcie
					.findByTwid(teacherWork.getTwid());
			teacherWork = (TeacherWork) result.getData();
			List<CourseAndClassCustomer> course = courseAndClassservice
					.findByCourseId(teacherWork.getCid());
			List<ClassNameVo> ClassList = new ArrayList<ClassNameVo>();
			for (CourseAndClassCustomer CourseAndClassCustomer : course) {
				ClassName className = classNameService
						.selectByclassId(CourseAndClassCustomer.getClassId());
				ClassNameVo classNameVo = new ClassNameVo();
				classNameVo.setClassName(className);
				ClassList.add(classNameVo);
			}
			for (ClassNameVo classNamevo : ClassList) {
				List<StudentVo> list = studentService
						.selectByClassId(classNamevo.getClassName()
								.getClassId());
				Integer num = 0;
				if (list != null & list.size() > 0) {
					List<StudentVo> listVo = list;
					classNamevo.setTotalNumber(listVo.size());
					for (StudentVo studentVo : listVo) {
						StudentWork studentWork = studentWorkService
								.selectBySidOrTwid(teacherWork.getTwid(),
										studentVo.getId());

						if (studentWork == null) {
							studentVo.setSubmitWork(false);
						} else {
							num++;
							// System.out.println(studentWork);
							studentVo.setSubmitWork(true);
							studentVo.setWork(studentWork);
						}
					}
					classNamevo.setStudentLst(listVo);
					classNamevo.setSbumitNumber(num);
				}
			}

			return Result.ok(ClassList);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "查询失败");
		}
	}
}
