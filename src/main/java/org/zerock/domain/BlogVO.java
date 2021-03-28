package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BlogVO {
	
	private String boardwriter;
	private String boardcontent;
	private String boardtitle;
	private Date boardsysdate;
	private Long boardcount;
	private Long boardbno;
	
	
}
