package com.xawl.study.model;

public class TeacherAndClass {

	private Integer tcid;

	private Integer tid;

	private Integer classId;

	public Integer getTcid() {
		return tcid;
	}

	public void setTcid(Integer tcid) {
		this.tcid = tcid;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}
	
	@Override
	public String toString() {
		return "TeacherAndClass [tcid=" + tcid + ", tid=" + tid + ", classId="
				+ classId + "]";
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	
}