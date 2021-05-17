package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BlogVO;
import org.zerock.domain.CriteriaTen;
import org.zerock.domain.GuestVO;
import org.zerock.mapper.GuestMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class GuestServiceImpl implements GuestService{
	
	@Setter(onMethod_ = {@Autowired})
	private GuestMapper mapper;

	@Override
	public List<GuestVO> getList(String guestid) {
		
		log.info("guest getList : " + guestid);
		
		return mapper.getList(guestid);
	}

	@Override
	public List<GuestVO> getListT(String guestid, CriteriaTen cri) {
		
		log.info("getListTen");
		
		return mapper.getListWithPagingTen(guestid, cri);
	}

	@Override
	public void register(GuestVO guest) {
		
		log.info("guest insert");
		
		mapper.insert(guest);
		
	}
}
