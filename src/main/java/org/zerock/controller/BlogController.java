package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BlogVO;
import org.zerock.domain.CriteriaFive;
import org.zerock.domain.CriteriaTen;
import org.zerock.domain.PageDTOF;
import org.zerock.domain.PageDTOT;
import org.zerock.domain.UserVO;
import org.zerock.service.BlogService;
import org.zerock.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//@RestController
@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class BlogController {
	
	private BlogService bservice;
	private UserService uservice;

	@GetMapping("/{boardwriter}")
	public String home(@PathVariable String boardwriter, Model model) {
		
		log.info("home");
		
		model.addAttribute("list", bservice.getList(boardwriter));
		
		return "/blog/home";
	}

//	@GetMapping("/{boardwriter}.json")
//	public ResponseEntity<List<BlogVO>> jsonhome(@PathVariable("boardwriter") String boardwriter, Model model) {
		
//		log.info("home");
		
//		model.addAttribute("list", bservice.getList(boardwriter));
		
//		return new ResponseEntity<>(bservice.getList(boardwriter), HttpStatus.OK);
//	}
	
	@GetMapping("/{boardwriter}/list/{page}")
	public String list(@PathVariable("boardwriter") String boardwriter, 
						@PathVariable("page") int page, Model model){
		
		CriteriaTen cri = new CriteriaTen(page, 10);
		
		model.addAttribute("list", bservice.getListT(boardwriter, cri));
		model.addAttribute("pageMaker", new PageDTOT(cri, 123));
		
		return "/blog/list";
	}
	
//	@GetMapping(value="/{boardwriter}/list/{page}.json")
//produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE}
//	public ResponseEntity<List<BlogVO>> jsonlist(@PathVariable("boardwriter") String boardwriter, @PathVariable("page") int page, Model model) {
		
//		log.info("list");
		
//		CriteriaTen cri = new CriteriaTen(page, 10);
		
//		model.addAttribute("list", bservice.getListT(boardwriter, cri));
//		model.addAttribute("pageMaker", new PageDTOT(cri));
		
//		return new ResponseEntity<>(bservice.getListT(boardwriter, cri), HttpStatus.OK);

//	}
	
	@GetMapping("/{boardwriter}/register")
	public String register(@PathVariable("boardwriter") String boardwriter, Model model) {
		
		model.addAttribute("user", uservice.user(boardwriter));
				
		return "/blog/register";
	}
	
	@PostMapping("/{boardwriter}/register")
	public String register(@PathVariable("boardwriter") String boardwriter, BlogVO blog, RedirectAttributes rttr, Model model) {
		
		log.info("register : " + blog);
		
		bservice.register(blog);
		
		model.addAttribute("user", uservice.user(boardwriter));
		rttr.addFlashAttribute("result", blog.getBoardbno());
		
		return "redirect:/"+boardwriter+"/list/1";
	} 
	
	@GetMapping("/{boardwriter}/get/{page}/{boardbno}")
	public String get(@PathVariable("boardwriter") String boardwriter,
					@PathVariable("page") int page,
					@PathVariable("boardbno") Long boardbno, Model model) {
		CriteriaFive cri = new CriteriaFive(page, 5);
					
		log.info("get or modify");
		
		model.addAttribute("list", bservice.getListF(boardwriter, cri));
		model.addAttribute("blog", bservice.get(boardbno));
		model.addAttribute("pageMaker", new PageDTOF(cri, 123));
		
		return "/blog/get";
		
	}
	
	@GetMapping("/{boardwriter}/modify/{page}/{boardbno}")
	public String modfiy(@PathVariable("boardwriter") String boardwriter,
					     @PathVariable("boardbno") Long boardbno, Model model) {
		log.info("get or modify");
		
		model.addAttribute("blog", bservice.get(boardbno));
		
		return "/blog/modify";
		
	}
	
	@PostMapping("/modify")
	public String modify(BlogVO blog, RedirectAttributes rttr) {
		
		log.info("modify : " + blog);
		
		if(bservice.modify(blog)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/{boardwriter}/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("boardbno") Long bno, RedirectAttributes rttr) {
		
		log.info("remove : " + bno);
		
		if(bservice.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/{boardwriter}/list";
	}
	
	@GetMapping("/{boardwriter}/about")
	public String about(@PathVariable("boardwriter") String boardwriter, Model model) {
		
		log.info("about : " + boardwriter);
		model.addAttribute("about", uservice.user(boardwriter));
		
		return "blog/about";
	}
}






