package com.xawl.study.model;

import java.util.Date;

public class ResourceClickLogs {
    private Integer rclid;

    private Integer sid;

    private String sname;

    private Integer rid;

    private Integer cid;

    private Integer clicknum;

    private Date lastdata;

    public Integer getRclid() {
        return rclid;
    }

    public void setRclid(Integer rclid) {
        this.rclid = rclid;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getClicknum() {
        return clicknum;
    }

    public void setClicknum(Integer clicknum) {
        this.clicknum = clicknum;
    }

    public Date getLastdata() {
        return lastdata;
    }

    public void setLastdata(Date lastdata) {
        this.lastdata = lastdata;
    }
}