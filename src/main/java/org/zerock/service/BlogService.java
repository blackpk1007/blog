package org.zerock.service;

import java.util.List;

import org.zerock.domain.BlogVO;
import org.zerock.domain.CriteriaFive;
import org.zerock.domain.CriteriaTen;

public interface BlogService {
	
	public List<BlogVO> getList();
	
	public List<BlogVO> getListT(CriteriaTen cri);
	
	public List<BlogVO> getListF(CriteriaFive cri);
	
	public boolean remove(Long bno);
	
	public boolean modify(BlogVO blog);
	
	public void register(BlogVO blog);
	
	public BlogVO get(Long bno);

}
