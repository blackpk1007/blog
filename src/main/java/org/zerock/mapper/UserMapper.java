package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.UserVO;

public interface UserMapper {
	
	public List<UserVO> userList();
	
	public List<UserVO> read(String userid);
	
	public void update(UserVO user);
	
	public UserVO test(String userid);
	
}
