package com.xawl.study.model;

import java.util.List;

public class ClassNameVo {
	private ClassName className;
	private Integer TotalNumber;
	private Integer SbumitNumber;
	private List<StudentVo> studentLst;

	public Integer getSbumitNumber() {
		return SbumitNumber;
	}

	public void setSbumitNumber(Integer sbumitNumber) {
		SbumitNumber = sbumitNumber;
	}

	public Integer getTotalNumber() {
		return TotalNumber;
	}

	public void setTotalNumber(Integer totalNumber) {
		TotalNumber = totalNumber;
	}

	public ClassName getClassName() {
		return className;
	}

	public void setClassName(ClassName className) {
		this.className = className;
	}

	public List<StudentVo> getStudentLst() {
		return studentLst;
	}

	public void setStudentLst(List<StudentVo> studentLst) {
		this.studentLst = studentLst;
	}
}
