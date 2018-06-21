package com.xawl.study.model;
/**
 * 轮播图类
 * @author zb
 *
 */
public class Carousel {
	
	private Integer caid;
	
	private String name;
	
	private String value;//图片放地址
	
	private Integer type;//类型，0图片
	
	private Integer cid;//所属课程

	private Integer status;//是否启用
	
	public Integer getCaid() {
		return caid;
	}

	public void setCaid(Integer caid) {
		this.caid = caid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	@Override
	public String toString() {
		return "Carousel [caid=" + caid + ", name=" + name + ", value=" + value
				+ ", type=" + type + ", cid=" + cid + "]";
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
