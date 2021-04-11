package org.zerock.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.zerock.domain.BlogVO;
import org.zerock.mapper.BlogMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})

@Log4j
public class BlogBoardController {
		
	@Setter(onMethod_ = {@Autowired})
	private BlogMapper mapper;
	
	@Test
	public void testgetList() throws Exception{

		//mapper.getList();
		
		log.info(mapper);
		
	}
	
	@Test
	public void testinsert() throws Exception{

		BlogVO blog = new BlogVO();
		blog.setBoardwriter("admin12");
		blog.setBoardtitle("테스트제목5");
		blog.setBoardcontent("테스트내용1");
		mapper.insert(blog);
		
		log.info(mapper);
		
	}
	
	@Test
	public void testread() throws Exception{

		BlogVO blog = mapper.read(5L);
		
		log.info(blog);
		
	}
	
	@Test
	public void testupdate() throws Exception{
		
		BlogVO blog = new BlogVO();
		blog.setBoardtitle("테스트수정제목");
		blog.setBoardcontent("테스트수정내용");
		blog.setBoardbno(3L);
		mapper.update(blog);
		
		log.info(mapper);
	}
}





