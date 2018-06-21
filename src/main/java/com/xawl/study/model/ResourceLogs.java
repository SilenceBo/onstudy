package com.xawl.study.model;

public class ResourceLogs {
	private Integer rlid;
	private Integer sid;
	private Integer rid;
	private double grade;
	private Integer cid;
	private Integer ordery;

	public Integer getRlid() {
		return rlid;
	}

	public void setRlid(Integer rlid) {
		this.rlid = rlid;
	}

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getOrdery() {
		return ordery;
	}

	public void setOrdery(Integer ordery) {
		this.ordery = ordery;
	}

	@Override
	public String toString() {
		return "ResourceLogs [rlid=" + rlid + ", sid=" + sid + ", rid=" + rid
				+ ", grade=" + grade + ", cid=" + cid + ", ordery=" + ordery
				+ "]";
	}

}
