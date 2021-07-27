package com.project.vo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Criteria {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchCriteria.class);

	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	private int rStart;
	
	public Criteria() {
		
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = rStart - (perPageNum * (page - 1));
		/* logger.info("" + rowStart); */
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart - perPageNum + 1;
		/* logger.info("" + rowEnd); */
		return rowEnd;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}

	public int getrStart() {
		return rStart;
	}

	public void setrStart(int rStart) {
		this.rStart = rStart;
	}
	
	
}