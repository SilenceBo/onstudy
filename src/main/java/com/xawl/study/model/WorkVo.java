package com.xawl.study.model;

import java.util.List;

public class WorkVo {
	private Integer cid;

	private List<ClassNameVo> classList;

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public List<ClassNameVo> getClassList() {
		return classList;
	}

	public void setClassList(List<ClassNameVo> classList) {
		this.classList = classList;
	}

}
