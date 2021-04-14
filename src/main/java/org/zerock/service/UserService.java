package org.zerock.service;


import java.util.List;

import org.zerock.domain.UserVO;

public interface UserService {
	
	public List<UserVO> userList();
	
	public List<UserVO> user(String userid);
}
