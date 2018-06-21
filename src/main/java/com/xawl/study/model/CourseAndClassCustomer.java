package com.xawl.study.model;

public class CourseAndClassCustomer extends CourseAndClass{
	
	private Course dbCourse;
	
	private ClassName dbClassName;

	public Course getDbCourse() {
		return dbCourse;
	}

	public void setDbCourse(Course dbCourse) {
		this.dbCourse = dbCourse;
	}

	public ClassName getDbClassName() {
		return dbClassName;
	}

	public void setDbClassName(ClassName dbClassName) {
		this.dbClassName = dbClassName;
	}

	@Override
	public String toString() {
		return "CourseAndClassCustomer [dbCourse=" + dbCourse
				+ ", dbClassName=" + dbClassName + "]";
	}
		
}
