package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.UserVO;

public interface UserMapper {
	
	public List<UserVO> userList();
	
	public List<UserVO> user(String userid);
}
