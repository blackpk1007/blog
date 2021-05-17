package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BlogVO;
import org.zerock.domain.CriteriaFive;
import org.zerock.domain.CriteriaTen;
import org.zerock.domain.GuestVO;

@Mapper
public interface GuestMapper {
	
	public List<GuestVO> getList(String guestid);
	
	public List<GuestVO> getListWithPagingTen(@Param("guestid") String guestid, @Param("cri") CriteriaTen cri);
	
	public void insert(GuestVO guest);
}
