package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.BlogVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
public class BlogServiceImpl implements BlogService{

	@Override
	public List<BlogVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modify(BlogVO blog) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void register(BlogVO blog) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BlogVO get(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

}
