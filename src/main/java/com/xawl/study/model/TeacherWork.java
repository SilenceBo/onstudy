package com.xawl.study.model;

public class TeacherWork {
    private Integer twid;

    private Integer tid;

    private String cname;

    private Integer cid;

    private String title;

    private String jobRequires;

    private String file;

    private String date;

    private String deadline;

    public Integer getTwid() {
        return twid;
    }

    public void setTwid(Integer twid) {
        this.twid = twid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
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

    public String getJobRequires() {
        return jobRequires;
    }

    public void setJobRequires(String jobRequires) {
        this.jobRequires = jobRequires == null ? null : jobRequires.trim();
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file == null ? null : file.trim();
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline == null ? null : deadline.trim();
    }

	public String toString() {
		return "TeacherWork [twid=" + twid + ", tid=" + tid + ", cname="
				+ cname + ", cid=" + cid + ", title=" + title
				+ ", jobRequires=" + jobRequires + ", file=" + file + ", date="
				+ date + ", deadline=" + deadline + "]";
	}
    
}