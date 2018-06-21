package com.xawl.study.model;


public class ClassName {
	public String toString() {
		return "ClassName [classId=" + classId + ", name=" + name + "]";
	}

	private Integer classId;

    private String name;
    
   private Integer snum;
    
	public Integer getSnum() {
		return snum;
	}

	public void setSnum(Integer snum) {
		this.snum = snum;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		//this.name = name;
		this.name = name == null?null:name.trim();
	}

    
}