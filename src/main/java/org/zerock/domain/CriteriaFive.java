package org.zerock.domain;

public class CriteriaFive {
	
	private int pageNum;
	private int amount;
	
	public CriteriaFive() {
		this(1,10);
	}

	public CriteriaFive(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
