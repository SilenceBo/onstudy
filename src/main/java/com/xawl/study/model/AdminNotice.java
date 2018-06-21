package com.xawl.study.model;

public class AdminNotice {
	private Integer anid;

	private String title;

	private String text;

	private Integer notivetype;

	private Boolean isittimed;

	private String time;

	private Boolean issendout;

	private Integer isBrowsed;

	public String toString() {
		return "AdminNotice [anid=" + anid + ", title=" + title + ", text="
				+ text + ", notivetype=" + notivetype + ", isittimed="
				+ isittimed + ", time=" + time + ", issendout=" + issendout
				+ ", isBrowsed=" + isBrowsed + "]";
	}

	public Integer getIsBrowsed() {
		return isBrowsed;
	}

	public void setIsBrowsed(Integer isBrowsed) {
		this.isBrowsed = isBrowsed;
	}

	public Integer getAnid() {
		return anid;
	}

	public void setAnid(Integer anid) {
		this.anid = anid;
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

	public Integer getNotivetype() {
		return notivetype;
	}

	public void setNotivetype(Integer notivetype) {
		this.notivetype = notivetype;
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