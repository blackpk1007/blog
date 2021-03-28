package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BlogVO;

public interface BlogMapper {
	
	public void getList(BlogVO blog);
	
	public void insert(BlogVO blog);
	
	public BlogVO read(Long bno);
}
