package com.hinplay.core.entity;

public class GameGiftbag {
	private Integer bid;

	private Integer gid;

	private String bname;

	private String bdesc;

	private String bexplain;

	private Integer blast;

	private GamesManage game;

	public Integer getBid() {
		return bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname == null ? null : bname.trim();
	}

	public String getBdesc() {
		return bdesc;
	}

	public void setBdesc(String bdesc) {
		this.bdesc = bdesc == null ? null : bdesc.trim();
	}

	public String getBexplain() {
		return bexplain;
	}

	public void setBexplain(String bexplain) {
		this.bexplain = bexplain == null ? null : bexplain.trim();
	}

	public Integer getBlast() {
		return blast;
	}

	public void setBlast(Integer blast) {
		this.blast = blast;
	}

	public GamesManage getGame() {
		return game;
	}

	public void setGame(GamesManage game) {
		this.game = game;
	}

}