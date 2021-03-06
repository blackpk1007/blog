package org.zerock.service;

import java.util.List;

import org.zerock.domain.BlogVO;
import org.zerock.domain.CriteriaTen;
import org.zerock.domain.GuestVO;

public interface GuestService {
	
	public List<GuestVO> getList(String guestid);
	
	public List<GuestVO> getListT(String guestid, CriteriaTen cri);
	
	public int register(GuestVO guest);
	
	public int remove(Long bno);
	
	public int modify(GuestVO guset);
	
	public GuestVO get(Long bno);
	
	public int guestTotalCount(String guestid);
}
