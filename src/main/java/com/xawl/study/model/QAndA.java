package com.xawl.study.model;

public class QAndA {
	private Integer count;

	private Integer qid;

	private Integer type;

	private Integer fqid;

	private String title;

	private String text;

	private String time;

	private String osname;
	private String cname;
	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String toString() {
		return "QAndA [qid=" + qid + ", type=" + type + ", fqid=" + fqid
				+ ", title=" + title + ", text=" + text + ", time=" + time
				+ ", osname=" + osname + ", osid=" + osid + ", tsname="
				+ tsname + ", tsid=" + tsid + ", tname=" + tname + ", tid="
				+ tid + ", cid=" + cid + ", typea=" + typea + "]";
	}

	private Integer osid;

	private String tsname;

	private Integer tsid;

	private String tname;

	private Integer tid;

	private Integer cid;

	private Integer typea;

	public Integer getQid() {
		return qid;
	}

	public void setQid(Integer qid) {
		this.qid = qid;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getFqid() {
		return fqid;
	}

	public void setFqid(Integer fqid) {
		this.fqid = fqid;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time == null ? null : time.trim();
	}

	public String getOsname() {
		return osname;
	}

	public void setOsname(String osname) {
		this.osname = osname == null ? null : osname.trim();
	}

	public Integer getOsid() {
		return osid;
	}

	public void setOsid(Integer osid) {
		this.osid = osid;
	}

	public String getTsname() {
		return tsname;
	}

	public void setTsname(String tsname) {
		this.tsname = tsname == null ? null : tsname.trim();
	}

	public Integer getTsid() {
		return tsid;
	}

	public void setTsid(Integer tsid) {
		this.tsid = tsid;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname == null ? null : tname.trim();
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

	public Integer getTypea() {
		return typea;
	}

	public void setTypea(Integer typea) {
		this.typea = typea;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

}