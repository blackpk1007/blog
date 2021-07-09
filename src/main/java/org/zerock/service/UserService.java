package org.zerock.service;


import java.util.List;

import org.zerock.domain.UserVO;

public interface UserService {
	
	public List<UserVO> userList();
	
	public List<UserVO> read(String userid);
	
	public void update(UserVO user);
	
	public UserVO test(String userid);
	
	public boolean modify(UserVO user);
}
