package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BlogVO;
import org.zerock.mapper.BlogMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
public class BlogServiceImpl implements BlogService{

	@Setter(onMethod_ = {@Autowired})
	private BlogMapper mapper;
	
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

	@Override
	public List<BlogVO> getList() {
		log.info("getList");
		
		return mapper.getList();
	}

}
