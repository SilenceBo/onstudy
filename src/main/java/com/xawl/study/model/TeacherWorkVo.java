package com.xawl.study.model;

public class TeacherWorkVo {
	private boolean isSubmit;
	private boolean overdue;
	private TeacherWork teacherWork;
	private StudentWork studentWork;

	public StudentWork getStudentWork() {
		return studentWork;
	}

	public void setStudentWork(StudentWork studentWork) {
		this.studentWork = studentWork;
	}

	public TeacherWork getTeacherWork() {
		return teacherWork;
	}

	public boolean isOverdue() {
		return overdue;
	}

	public void setOverdue(boolean overdue) {
		this.overdue = overdue;
	}

	public void setTeacherWork(TeacherWork teacherWork) {
		this.teacherWork = teacherWork;
	}

	public boolean isSubmit() {
		return isSubmit;
	}

	public void setSubmit(boolean isSubmit) {
		this.isSubmit = isSubmit;
	}

}
