package com.xawl.study.model;

public class Course {
    private Integer cid;

    private String cname;

    private String date;

    private Integer tid;

    private Integer fid;

    private String redesc;

    private Integer iid;

    private Integer linknum;

    private Boolean iorder;

    private String image;

    private Integer grade;
    
    private Integer mid;
    
    private Integer logclick;
    
    private Integer unlogclick;
    
    public Integer getLogclick() {
		return logclick;
	}


	public void setLogclick(Integer logclick) {
		this.logclick = logclick;
	}


	public Integer getUnlogclick() {
		return unlogclick;
	}


	public void setUnlogclick(Integer unlogclick) {
		this.unlogclick = unlogclick;
	}
    
	public Integer getCid() {
		return cid;
	}


	public void setCid(Integer cid) {
		this.cid = cid;
	}


	public String getCname() {
		return cname;
	}


	public void setCname(String cname) {
		this.cname = cname;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
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


	public String getRedesc() {
		return redesc;
	}


	public void setRedesc(String redesc) {
		this.redesc = redesc;
	}


	public Integer getIid() {
		return iid;
	}


	public void setIid(Integer iid) {
		this.iid = iid;
	}


	public Integer getLinknum() {
		return linknum;
	}


	public void setLinknum(Integer linknum) {
		this.linknum = linknum;
	}


	public Boolean getIorder() {
		return iorder;
	}


	public void setIorder(Boolean iorder) {
		this.iorder = iorder;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	@Override
	public String toString() {
		return "Course [cid=" + cid + ", cname=" + cname + ", date=" + date
				+ ", tid=" + tid + ", fid=" + fid + ", redesc=" + redesc
				+ ", iid=" + iid + ", linknum=" + linknum + ", iorder="
				+ iorder + ", image=" + image + "]";
	}


	public Integer getGrade() {
		return grade;
	}


	public void setGrade(Integer grade) {
		this.grade = grade;
	}


	public Integer getMid() {
		return mid;
	}


	public void setMid(Integer mid) {
		this.mid = mid;
	}
    
    
}