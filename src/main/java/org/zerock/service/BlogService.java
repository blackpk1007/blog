package org.zerock.service;

import java.util.List;

import org.zerock.domain.BlogVO;
import org.zerock.domain.CriteriaFive;
import org.zerock.domain.CriteriaTen;

public interface BlogService {
	
	public List<BlogVO> homeList();
	
	public List<BlogVO> getList(String boardwriter);
	
	public List<BlogVO> getListT(String boardwriter, CriteriaTen cri);
	
	public List<BlogVO> getListF(String boardwriter, CriteriaFive cri);
	
	public boolean remove(Long bno); 
	
	public boolean modify(BlogVO blog);
	
	public void register(BlogVO blog);
	
	public BlogVO get(Long bno);

}
