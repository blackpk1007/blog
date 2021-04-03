package org.zerock.domain;

public class CriteriaTen {
	
	private int pageNum;
	private int amount;
	
	public CriteriaTen() {
		this(1,10);
	}

	public CriteriaTen(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
