package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CriteriaFive {
	
	private int pageNum;
	private int amount;
	
	public CriteriaFive() {
		this(1,5);
	}

	public CriteriaFive(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
