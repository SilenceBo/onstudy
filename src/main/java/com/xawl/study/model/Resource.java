package com.xawl.study.model;

import java.util.Date;

public class Resource {
	@Override
	public String toString() {
		return "Resource [resourceName=" + resourceName + ", resume=" + resume
				+ ", iid=" + iid + ", date=" + date + ", resourceType="
				+ resourceType + ", okRead=" + okRead + ", tid=" + tid
				+ ", fid=" + fid + ", cid=" + cid + ", ordery=" + ordery
				+ ", image=" + image + ", rid=" + rid + ", src=" + src
				+ ", answerSrc=" + answerSrc + ", answerString=" + answerString
				+ "]";
	}

	private String resourceName;

	private String resume;

	private Integer iid;

	private String date;

	private Integer resourceType;

	private Byte okRead;

	private Integer tid;

	private Integer fid;

	private Integer cid;

	private Integer ordery;

	private String image;

	private Integer rid;

	private String src;

	private String answerSrc;

	private String answerString;

	private String clickNum;

	public String getClickNum() {
		return clickNum;
	}

	public void setClickNum(String clickNum) {
		this.clickNum = clickNum;
	}

	public String getAnswerSrc() {
		return answerSrc;
	}

	public void setAnswerSrc(String answerSrc) {
		this.answerSrc = answerSrc;
	}

	public String getAnswerString() {
		return answerString;
	}

	public void setAnswerString(String answerString) {
		this.answerString = answerString;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume == null ? null : resume.trim();
	}

	public Integer getIid() {
		return iid;
	}

	public void setIid(Integer iid) {
		this.iid = iid;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Integer getResourceType() {
		return resourceType;
	}

	public void setResourceType(Integer resourceType) {
		this.resourceType = resourceType;
	}

	public Byte getOkRead() {
		return okRead;
	}

	public void setOkRead(Byte okRead) {
		this.okRead = okRead;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public Integer getFid() {
		return fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image == null ? null : image.trim();
	}
}