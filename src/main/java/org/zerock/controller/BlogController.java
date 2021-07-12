package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
import org.zerock.service.GuestService;
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
	private GuestService gservice;
	
	@GetMapping("/main")
	public String homePage(Model model, CriteriaTen cri){

		int total = bservice.mainTotalCount(cri);
		
		model.addAttribute("blist", bservice.mainpage(cri));
		model.addAttribute("pageMaker", new PageDTOT(cri, total));
		
		return "homepage";
	}
	
	@GetMapping("/{boardwriter}")
	public String home(@PathVariable("boardwriter") String boardwriter, Model model) {
		
		log.info("home");
		
		model.addAttribute("test", uservice.test(boardwriter));
		model.addAttribute("list", bservice.getList(boardwriter));
		model.addAttribute("user", uservice.read(boardwriter));
		
		return "/blog/home";
	}
	
	@GetMapping("/{boardwriter}/list/{page}")
	public String list(@PathVariable("boardwriter") String boardwriter, 
						@PathVariable("page") int page, Model model){
		
		CriteriaTen cri = new CriteriaTen(page, 10);
		int total = bservice.listTotalCount(boardwriter);
		
		model.addAttribute("test", uservice.test(boardwriter));
		model.addAttribute("list", bservice.getListT(boardwriter, cri));
		model.addAttribute("pageMaker", new PageDTOT(cri, total));
		
		return "/blog/list";
	}
	
	@GetMapping("/{boardwriter}/register")
	public String register(@PathVariable("boardwriter") String boardwriter, Model model) {
		
		model.addAttribute("test", uservice.test(boardwriter));
		model.addAttribute("user", uservice.read(boardwriter));
				
		return "/blog/register";
	}
	
	@PostMapping("/{boardwriter}/register")
	public String register(@PathVariable("boardwriter") String boardwriter, BlogVO blog, RedirectAttributes rttr, Model model) {
		
		log.info("register : " + blog);
		
		bservice.register(blog);
		
		
		model.addAttribute("user", uservice.read(boardwriter));
		rttr.addFlashAttribute("result", blog.getBoardbno());
		
		return "redirect:/"+boardwriter+"/list/1";
	} 
	
	@GetMapping("/{boardwriter}/get/{boardbno}/{page}")
	public String get(@PathVariable("boardwriter") String boardwriter,
					@PathVariable("page") int page,
					@PathVariable("boardbno") Long boardbno, Model model) {
		CriteriaFive cri = new CriteriaFive(page, 5);
					
		log.info("get or modify");
		int total = bservice.listTotalCount(boardwriter);
		
		model.addAttribute("test", uservice.test(boardwriter));
		model.addAttribute("list", bservice.getListF(boardwriter, cri));
		model.addAttribute("blog", bservice.get(boardbno));
		model.addAttribute("pageMaker", new PageDTOF(cri, total));
		
		return "/blog/get";
		
	}
	
	@GetMapping("/{boardwriter}/modify/{boardbno}")
	public String modfiy(@PathVariable("boardwriter") String boardwriter,
					     @PathVariable("boardbno") Long boardbno, Model model) {
		log.info("get or modify");
		
		model.addAttribute("test", uservice.test(boardwriter));
		model.addAttribute("blog", bservice.get(boardbno));
		
		return "/blog/modify";
		
	}
	
	@PreAuthorize("principal.username == #blog.boardwriter")
	@PostMapping("/{boardwriter}/modify")
	public String modify(@PathVariable("boardwriter") String boardwriter, BlogVO blog, @RequestParam("boardbno") Long bno, RedirectAttributes rttr) {
		
		log.info("modify : " + blog);
		
		if(bservice.modify(blog)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/"+boardwriter+"/get/"+bno+"/1";
	}
	
	@PreAuthorize("principal.username == #boardwriter")
	@PostMapping("/{boardwriter}/remove")
	public String remove(@PathVariable("boardwriter") String boardwriter, @RequestParam("boardbno") Long bno, RedirectAttributes rttr) {
		
		log.info("remove : " + bno);
		
		if(bservice.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/"+boardwriter+"/list/1";
	}
	
	@GetMapping("/{boardwriter}/about")
	public String about(@PathVariable("boardwriter") String boardwriter, Model model) {
		
		log.info("about : " + boardwriter);
		model.addAttribute("test", uservice.test(boardwriter));
		model.addAttribute("user", uservice.read(boardwriter));
		
		return "blog/about";
	}
	
	@PreAuthorize("principal.username == #boardwriter")
	@GetMapping("/{boardwriter}/about/modify")
	public String aboutmodify(@PathVariable("boardwriter") String boardwriter, Model model) {
		
		log.info("about : " + boardwriter);
		model.addAttribute("test", uservice.test(boardwriter));
		model.addAttribute("about", uservice.read(boardwriter));
		
		return "blog/aboutmodify";
	}
	
	@PostMapping("/{boardwriter}/about/modify")
	public String aboutmodify(@PathVariable("boardwriter") String boardwriter, UserVO user, RedirectAttributes rttr, Model model) {
		
		//log.info("about : " + boardwriter);
		//model.addAttribute("about", uservice.user(boardwriter));
		model.addAttribute("test", uservice.test(boardwriter));
		if(uservice.modify(user)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/"+boardwriter+"/about";
	}
	
	@GetMapping("/{boardwriter}/guest/{page}")
	public String guest(@PathVariable("boardwriter") String boardwriter, 
					    @PathVariable("page") int page, Model model) {
		CriteriaTen cri = new  CriteriaTen(page, 10);
		int total = gservice.guestTotalCount(boardwriter);
		
		log.info("guest : " + boardwriter);
		
		model.addAttribute("test", uservice.test(boardwriter));
		model.addAttribute("guest", gservice.getListT(boardwriter, cri));
		//model.addAttribute("guest", gservice.getList(boardwriter));
		model.addAttribute("pageMaker", new PageDTOT(cri, total));
		
		return "blog/guest";
	}
	
	@PostMapping("/{boardwriter}/guest/register")
	public String guestRegister(@PathVariable("boardwriter") String boardwriter) {
		
		return "redirect:/"+boardwriter+"/guest/1";
	}
}






