package com.xawl.study.model;

public class CourseNotice {
	private Integer cnid;

	private String cname;

	private Integer tid;

	private Integer cid;

	private String title;

	private String text;

	private Boolean isittimed;

	private String time;

	private Boolean issendout;

	private Integer isBrowsed;

	public Integer getIsBrowsed() {
		return isBrowsed;
	}

	public void setIsBrowsed(Integer isBrowsed) {
		this.isBrowsed = isBrowsed;
	}

	public Integer getCnid() {
		return cnid;
	}

	public void setCnid(Integer cnid) {
		this.cnid = cnid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname == null ? null : cname.trim();
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text == null ? null : text.trim();
	}

	public Boolean getIsittimed() {
		return isittimed;
	}

	public void setIsittimed(Boolean isittimed) {
		this.isittimed = isittimed;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time == null ? null : time.trim();
	}

	public Boolean getIssendout() {
		return issendout;
	}

	public void setIssendout(Boolean issendout) {
		this.issendout = issendout;
	}
}