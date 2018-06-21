package com.xawl.study.model;

public class CourseAndClass {
	
	private Integer ccid;
	
	private Integer courseId;
	
	private Integer classId;

	public Integer getCcid() {
		return ccid;
	}

	public void setCcid(Integer ccid) {
		this.ccid = ccid;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	@Override
	public String toString() {
		return "CourseAndClass [ccid=" + ccid + ", courseId=" + courseId
				+ ", classId=" + classId + "]";
	}
	
	
}
