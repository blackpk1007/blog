package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BlogVO;
import org.zerock.domain.CriteriaFive;
import org.zerock.domain.CriteriaTen;
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
		log.info("delete : " + bno);
		
		return mapper.delete(bno) == 1;
	}

	@Override
	public boolean modify(BlogVO blog) {
		log.info("modify : " + blog);
		
		return mapper.update(blog) == 1;
	}

	@Override
	public void register(BlogVO blog) {
		log.info("register");
		
		mapper.insert(blog);
		
	}

	@Override
	public BlogVO get(Long bno) {
		log.info("get : " + bno);
		
		return mapper.read(bno);
	}

	@Override
	public List<BlogVO> getList(){
		
		log.info("getList");
		
		return mapper.getList();
	}
	@Override
	public List<BlogVO> getListT(CriteriaTen cri) {
		log.info("getListTen");
		
		return mapper.getListWithPagingTen(cri);
	}
	
	@Override
	public List<BlogVO> getListF(CriteriaFive cri) {
		log.info("getListFive");
		
		return mapper.getListWithPagingFive(cri);
	}


}
