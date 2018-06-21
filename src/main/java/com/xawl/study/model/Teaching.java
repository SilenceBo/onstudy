package com.xawl.study.model;

public class Teaching extends TeacherAndClass{
	
	private ClassName dbClassName;
	
    private Teacher dbTeacher;

	public ClassName getDbClassName() {
		return dbClassName;
	}
	public void setDbClassName(ClassName dbClassName) {
		this.dbClassName = dbClassName;
	}
	public Teacher getDbTeacher() {
		return dbTeacher;
	}
	public void setDbTeacher(Teacher dbTeacher) {
		this.dbTeacher = dbTeacher;
	}
	@Override
	public String toString() {
		return "Teaching [dbClassName=" + dbClassName + ", dbTeacher="
				+ dbTeacher + "]";
	}
	

}