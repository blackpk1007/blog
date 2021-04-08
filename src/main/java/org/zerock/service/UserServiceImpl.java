package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.UserVO;
import org.zerock.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class UserServiceImpl implements UserService{
	
	@Setter(onMethod_ = {@Autowired})
	private UserMapper mapper;
	
	@Override
	public List<UserVO> userList(){
		log.info("userList : ");
		
		return mapper.userList();
	}

}
