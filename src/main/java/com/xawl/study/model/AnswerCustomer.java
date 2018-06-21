package com.xawl.study.model;

public class AnswerCustomer extends Answer{
	
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
		return "AnswerCustomer [dbTeacher=" + dbTeacher + ", dbStudent="
				+ dbStudent + "]";
	}
	
	
}
