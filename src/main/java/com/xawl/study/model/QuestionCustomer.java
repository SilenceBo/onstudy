package com.xawl.study.model;

public class QuestionCustomer extends Question{
	
	private Teacher dbTeacher;
	
	private Student dbStudent;

	public Teacher getDbTeacher() {
		return dbTeacher;
	}

	public void setDbTeacher(Teacher dbTeacher) {
		this.dbTeacher = dbTeacher;
	}

	public Student getDbStudent() {
		return dbStudent;
	}

	public void setDbStudent(Student dbStudent) {
		this.dbStudent = dbStudent;
	}

	@Override
	public String toString() {
		return "QuestionCustomer [dbTeacher=" + dbTeacher + ", dbStudent="
				+ dbStudent + "]";
	}
	
}
