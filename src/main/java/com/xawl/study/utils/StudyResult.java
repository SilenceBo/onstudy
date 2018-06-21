package com.xawl.study.utils;

import java.util.List;

public class StudyResult {
	private String msg;
	private Integer status;
	private Object data;

	public StudyResult(String msg, Integer status, Object data) {
		this.msg = msg;
		this.status = status;
		this.data = data;
	}

	public StudyResult() {
		super();
	}

	public StudyResult(List<Object> data) {
		this.data = data;
		this.msg = "ok";
		this.status = 200;

	}

	public static StudyResult ok(List<Object> data) {
		StudyResult sr = new StudyResult();
		sr.msg = "ok";
		sr.status = 200;
		return sr;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
