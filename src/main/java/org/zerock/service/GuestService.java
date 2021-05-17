package org.zerock.service;

import java.util.List;

import org.zerock.domain.BlogVO;
import org.zerock.domain.CriteriaTen;
import org.zerock.domain.GuestVO;

public interface GuestService {
	
	public List<GuestVO> getList(String guestid);
	
	public List<GuestVO> getListT(String guestid, CriteriaTen cri);
	
	public void register(GuestVO guest);
}
