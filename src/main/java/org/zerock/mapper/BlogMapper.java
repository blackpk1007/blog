package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BlogVO;
import org.zerock.domain.CriteriaFive;
import org.zerock.domain.CriteriaTen;

@Mapper
public interface BlogMapper {
	
	public List<BlogVO> homeList();
	
	public List<BlogVO> getList(String boardwriter);
	
	public void insert(BlogVO blog);
	
	public BlogVO read(Long bno);
	
	public int update(BlogVO blog);
	
	public int delete(Long bno);
	
	public List<BlogVO> getListWithPagingTen(String writer, CriteriaTen cri);
	
	public List<BlogVO> getListWithPagingFive(String writer, CriteriaFive cri);
	
	//public List<BlogVO> getListWithPagingTen(@Param("boardwriter") String boardwriter, CriteriaTen cri);
	
	//public List<BlogVO> getListWithPagingFive(@Param("boardwriter") String boardwriter, CriteriaFive cri);

}
