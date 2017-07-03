package com.hinplay.core.entity;

import java.util.Date;

public class GamesManage {
	private Integer gid;

	private Integer cid;

	private String gname;

	private String gdesc;

	private String glogo;

	private String gpictures;

	private Integer gpaytype;

	private Integer gscreen;

	private Integer gplayed;

	private Integer gstate;

	private String gurl;

	private String gruntimeurl;

	private Integer gfirm;

	private Date gcreate;

	private GameClass gClass;

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname == null ? null : gname.trim();
	}

	public String getGdesc() {
		return gdesc;
	}

	public void setGdesc(String gdesc) {
		this.gdesc = gdesc == null ? null : gdesc.trim();
	}

	public String getGlogo() {
		return glogo;
	}

	public void setGlogo(String glogo) {
		this.glogo = glogo == null ? null : glogo.trim();
	}

	public String getGpictures() {
		return gpictures;
	}

	public void setGpictures(String gpictures) {
		this.gpictures = gpictures == null ? null : gpictures.trim();
	}

	public Integer getGpaytype() {
		return gpaytype;
	}

	public void setGpaytype(Integer gpaytype) {
		this.gpaytype = gpaytype;
	}

	public Integer getGscreen() {
		return gscreen;
	}

	public void setGscreen(Integer gscreen) {
		this.gscreen = gscreen;
	}

	public Integer getGplayed() {
		return gplayed;
	}

	public void setGplayed(Integer gplayed) {
		this.gplayed = gplayed;
	}

	public Integer getGstate() {
		return gstate;
	}

	public void setGstate(Integer gstate) {
		this.gstate = gstate;
	}

	public String getGurl() {
		return gurl;
	}

	public void setGurl(String gurl) {
		this.gurl = gurl == null ? null : gurl.trim();
	}

	public String getGruntimeurl() {
		return gruntimeurl;
	}

	public void setGruntimeurl(String gruntimeurl) {
		this.gruntimeurl = gruntimeurl == null ? null : gruntimeurl.trim();
	}

	public Integer getGfirm() {
		return gfirm;
	}

	public void setGfirm(Integer gfirm) {
		this.gfirm = gfirm;
	}

	public Date getGcreate() {
		return gcreate;
	}

	public void setGcreate(Date gcreate) {
		this.gcreate = gcreate;
	}

	public GameClass getgClass() {
		return gClass;
	}

	public void setgClass(GameClass gClass) {
		this.gClass = gClass;
	}

}