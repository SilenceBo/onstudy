package com.xawl.study.model;

import java.util.Date;

public class Ip {
    private Integer ipid;

    private String ip;

    private Integer num;

    private Date lastdate;

    public Integer getIpid() {
        return ipid;
    }

    public void setIpid(Integer ipid) {
        this.ipid = ipid;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Date getLastdate() {
        return lastdate;
    }

    public void setLastdate(Date lastdate) {
        this.lastdate = lastdate;
    }
}