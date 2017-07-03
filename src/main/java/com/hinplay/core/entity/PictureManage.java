package com.hinplay.core.entity;

import java.util.Date;

public class PictureManage {
	private Integer pid;

	private String pname;

	private Long psize;

	private Integer isshow;

	private String urlpath;

	private String osskey;

	private String ptype;

	private Date createtime;

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname == null ? null : pname.trim();
	}

	public Long getPsize() {
		return psize;
	}

	public void setPsize(Long psize) {
		this.psize = psize;
	}

	public Integer getIsshow() {
		return isshow;
	}

	public void setIsshow(Integer isshow) {
		this.isshow = isshow;
	}

	public String getUrlpath() {
		return urlpath;
	}

	public void setUrlpath(String urlpath) {
		this.urlpath = urlpath == null ? null : urlpath.trim();
	}

	public String getOsskey() {
		return osskey;
	}

	public void setOsskey(String osskey) {
		this.osskey = osskey == null ? null : osskey.trim();
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype == null ? null : ptype.trim();
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
}