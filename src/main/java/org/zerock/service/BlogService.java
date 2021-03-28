package org.zerock.service;

import java.util.List;

import org.zerock.domain.BlogVO;

public interface BlogService {
	
	public void getList(BlogVO blog);
	
	public boolean remove(Long bno);
	
	public boolean modify(BlogVO blog);
	
	public void register(BlogVO blog);
	
	public BlogVO get(Long bno);
}
