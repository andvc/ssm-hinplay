package com.hinplay.core.entity;

public class SlideManage {
	private Integer sid;

	private String sname;

	private String simage;

	private String surl;

	private Integer sorder;

	private Integer stype;

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

	public String getSimage() {
		return simage;
	}

	public void setSimage(String simage) {
		this.simage = simage == null ? null : simage.trim();
	}

	public String getSurl() {
		return surl;
	}

	public void setSurl(String surl) {
		this.surl = surl == null ? null : surl.trim();
	}

	public Integer getSorder() {
		return sorder;
	}

	public void setSorder(Integer sorder) {
		this.sorder = sorder;
	}

	public Integer getStype() {
		return stype;
	}

	public void setStype(Integer stype) {
		this.stype = stype;
	}
}