package com.hinplay.core.entity;

public class GiftbagKeys {
	private Integer kid;

	private String kkey;

	private Integer bid;

	private Integer uid;

	private Integer isused;

	private GameGiftbag giftbag;

	public Integer getKid() {
		return kid;
	}

	public void setKid(Integer kid) {
		this.kid = kid;
	}

	public String getKkey() {
		return kkey;
	}

	public void setKkey(String kkey) {
		this.kkey = kkey == null ? null : kkey.trim();
	}

	public Integer getBid() {
		return bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getIsused() {
		return isused;
	}

	public void setIsused(Integer isused) {
		this.isused = isused;
	}

	public GameGiftbag getGiftbag() {
		return giftbag;
	}

	public void setGiftbag(GameGiftbag giftbag) {
		this.giftbag = giftbag;
	}

}