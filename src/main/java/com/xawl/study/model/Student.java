package com.xawl.study.model;


public class Student {
   
	private String id;

    private String account;
    
    private String sname;

    private String sex;

    private String pwd;
    
    private String repwd;

    private String e_mail;

    private String date;

    private Integer classId;
    
    private String code;
    
    private Integer state;
    
    //班级名
    private String name;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }
    
    
    public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd == null ? null : pwd.trim();
    } 
     
    public String getRepwd() {
		return repwd;
	}

	public void setRepwd(String repwd) {
		this.repwd = repwd;
	}

	public String getE_mail() {
		return e_mail;
	}

	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
    
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", account=" + account + ", sname="
				+ sname + ", sex=" + sex + ", pwd=" + pwd + ", repwd=" + repwd
				+ ", e_mail=" + e_mail + ", date=" + date + ", classId="
				+ classId + ", code=" + code + ", state=" + state + ", name="
				+ name + "]";
	}

}