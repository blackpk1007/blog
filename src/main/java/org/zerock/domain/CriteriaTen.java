package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
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
