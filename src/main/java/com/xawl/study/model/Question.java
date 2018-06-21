package com.xawl.study.model;

public class Question {
    private Integer qid;

    private Integer tid;

    private Integer sid;

    private String topic;

    private String contents;

    private Integer replycount;

    private Integer clickcount;

    private String creattime;

    private Integer usertype;

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic == null ? null : topic.trim();
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents == null ? null : contents.trim();
    }

    public Integer getReplycount() {
        return replycount;
    }

    public void setReplycount(Integer replycount) {
        this.replycount = replycount;
    }

    public Integer getClickcount() {
        return clickcount;
    }

    public void setClickcount(Integer clickcount) {
        this.clickcount = clickcount;
    }

    public String getCreattime() {
        return creattime;
    }

    public void setCreattime(String creattime) {
        this.creattime = creattime == null ? null : creattime.trim();
    }

    public Integer getUsertype() {
        return usertype;
    }

    public void setUsertype(Integer usertype) {
        this.usertype = usertype;
    }

	@Override
	public String toString() {
		return "Question [qid=" + qid + ", tid=" + tid + ", sid=" + sid
				+ ", topic=" + topic + ", contents=" + contents
				+ ", replycount=" + replycount + ", clickcount=" + clickcount
				+ ", creattime=" + creattime + ", usertype=" + usertype + "]";
	}
    
    
}