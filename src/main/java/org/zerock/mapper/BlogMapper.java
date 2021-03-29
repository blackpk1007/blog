package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BlogVO;

public interface BlogMapper {
	
	public List<BlogVO> getList();
	
	public void insert(BlogVO blog);
	
	public BlogVO read(Long bno);
	
	public void update(BlogVO blog);
	
	public int remove(Long bno);

}
