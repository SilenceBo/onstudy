package com.xawl.study.model;

/**
 * 课程扩展类
 * @author zb
 *
 */
public class CourseCustomer extends Course{
	
	private Teacher dbTeacher;
	
	private Fangxiang dbFangxiang;
	
	private Interest dbInterest;

	private Integer courseCount;
	
	private Major dbMajor;
	
	public Teacher getDbTeacher() {
		return dbTeacher;
	}

	public void setDbTeacher(Teacher dbTeacher) {
		this.dbTeacher = dbTeacher;
	}

	public Fangxiang getDbFangxiang() {
		return dbFangxiang;
	}

	public void setDbFangxiang(Fangxiang dbFangxiang) {
		this.dbFangxiang = dbFangxiang;
	}

	public Interest getDbInterest() {
		return dbInterest;
	}

	public void setDbInterest(Interest dbInterest) {
		this.dbInterest = dbInterest;
	}

	@Override
	public String toString() {
		return "CourseCustomer [dbTeacher=" + dbTeacher + ", dbFangxiang="
				+ dbFangxiang + ", dbInterest=" + dbInterest + "]";
	}

	public Integer getCourseCount() {
		return courseCount;
	}

	public void setCourseCount(Integer courseCount) {
		this.courseCount = courseCount;
	}

	public Major getDbMajor() {
		return dbMajor;
	}

	public void setDbMajor(Major dbMajor) {
		this.dbMajor = dbMajor;
	}
	
	
}
