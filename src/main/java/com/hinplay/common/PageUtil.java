package com.hinplay.common;

public class PageUtil {
	public static final int PAGESIZE = 15;

	// 当前页
	private int page;
	// 显示多少数据
	private int size;
	// 总数据
	private long total;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page <= 1 ? 1 : page;
	}

	public int getSize() {
		return size > 0 ? size : PAGESIZE;
	}

	public void setSize(int size) {
		this.size = size > 0 ? size : PAGESIZE;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}
}
