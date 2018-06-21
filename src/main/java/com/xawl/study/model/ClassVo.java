package com.xawl.study.model;

import java.util.List;

public class ClassVo {
	private List<StudentVo> list;
	private String className;
	private Integer totleNum;

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public Integer getTotleNum() {
		return totleNum;
	}

	public void setTotleNum(Integer totleNum) {
		this.totleNum = totleNum;
	}

	public List<StudentVo> getList() {
		return list;
	}

	public void setList(List<StudentVo> list) {
		this.list = list;
	}
}
