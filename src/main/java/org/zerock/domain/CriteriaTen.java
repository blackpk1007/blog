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
	
	private String type;
	private String keyword;
	
	public CriteriaTen() {
		this(1,10);
	}

	public CriteriaTen(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		
		return type == null? new String[] {}: type.split("");
	}
}
