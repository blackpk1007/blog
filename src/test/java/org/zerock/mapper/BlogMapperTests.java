package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.BlogVO;
import org.zerock.domain.CriteriaTen;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BlogMapperTests {
	
	@Setter(onMethod_ = {@Autowired})
	private BlogMapper mapper;
	
	@Test
	public void testmapper() {
		log.info(mapper);
		
	}
	@Test
	public void testList() {
		CriteriaTen cri = new CriteriaTen();
		
		List<BlogVO> blog = mapper.getListWithPagingTen("admin12", cri);
		
		blog.forEach(boardwriter -> log.info(boardwriter));
	}

}
