package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BlogVO;
import org.zerock.domain.CriteriaFive;
import org.zerock.domain.CriteriaTen;

public interface BlogMapper {
	
	public List<BlogVO> getList();
	
	public void insert(BlogVO blog);
	
	public BlogVO read(Long bno);
	
	public int update(BlogVO blog);
	
	public int delete(Long bno);
	
	public List<BlogVO> getListWithPagingTen(CriteriaTen cri);
	
	//public List<BlogVO> getListWithPagingFive(CriteriaFive cri);

}
