package com.hinplay.core.entity;

import java.util.Date;

public class MasterManage {
	private Integer wid;

	private String wname;

	private String wauthor;

	private Date wtime;

	private String wcentent;

	public Integer getWid() {
		return wid;
	}

	public void setWid(Integer wid) {
		this.wid = wid;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname == null ? null : wname.trim();
	}

	public String getWauthor() {
		return wauthor;
	}

	public void setWauthor(String wauthor) {
		this.wauthor = wauthor == null ? null : wauthor.trim();
	}

	public Date getWtime() {
		return wtime;
	}

	public void setWtime(Date wtime) {
		this.wtime = wtime;
	}

	public String getWcentent() {
		return wcentent;
	}

	public void setWcentent(String wcentent) {
		this.wcentent = wcentent == null ? null : wcentent.trim();
	}
}