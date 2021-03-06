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

	@Override
	public List<UserVO> read(String userid) {
		log.info("user : " +userid);
		
		return mapper.read(userid);
	}

	@Override
	public void update(UserVO user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserVO test(String userid) {
		
		log.info("test");
		
		return mapper.test(userid);
	}

	@Override
	public boolean modify(UserVO user) {
		
		log.info("modify");
		
		return mapper.modify(user) == 1;
	}

}
