package com.xawl.study.model;

public class Teacher {
	private Integer tid;

	private String account;

	private String pwd;

	private String username;

	private String redesc;

	private String phone;

	private String email;

	private Integer qq;

	private Integer loginNum;

	private Integer CourseNum;

	private Integer reourceNum;

	public Integer getCourseNum() {
		return CourseNum;
	}

	public void setCourseNum(Integer courseNum) {
		CourseNum = courseNum;
	}

	public Integer getReourceNum() {
		return reourceNum;
	}

	public void setReourceNum(Integer reourceNum) {
		this.reourceNum = reourceNum;
	}

	public Integer getLoginNum() {
		return loginNum;
	}

	public void setLoginNum(Integer loginNum) {
		this.loginNum = loginNum;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account == null ? null : account.trim();
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd == null ? null : pwd.trim();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getRedesc() {
		return redesc;
	}

	public void setRedesc(String redesc) {
		this.redesc = redesc == null ? null : redesc.trim();
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public Integer getQq() {
		return qq;
	}

	public void setQq(Integer qq) {
		this.qq = qq;
	}

}