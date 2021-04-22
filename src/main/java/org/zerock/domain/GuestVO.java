package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GuestVO {
	   private String guestid;
	   private String guestwriter;
	   private String guestcontent;
	   private Date guestsysdate;
	   private Long guestbno;

}
