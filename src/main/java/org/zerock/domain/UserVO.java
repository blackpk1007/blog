package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	
	private String userid;
	private String userpassword;
	private String userinformation;
	private String userhobby;
	private Long userbno;
	private Date usersysdate;
	private List<AuthVO> authList;
}
