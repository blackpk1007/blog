package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BlogVO;
import org.zerock.domain.CriteriaFive;
import org.zerock.domain.CriteriaTen;
import org.zerock.domain.PageDTOF;
import org.zerock.domain.PageDTOT;
import org.zerock.service.BlogService;
import org.zerock.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class BlogController {
	
	private BlogService bservice;
	private UserService uservice;
	@GetMapping("/{boardwriter}")
	public String home(@PathVariable("boardwriter") String boardwriter, Model model) {
		
		log.info("home");
		
		model.addAttribute("list", bservice.getList(boardwriter));
		
		return "blog/home";
	}
	
	@GetMapping("/{boardwriter}/list/page/{cri}")
	public String list(@PathVariable("boardwriter") String boardwriter, 
					   @PathVariable("cri") CriteriaTen cri, Model model) {
		
		log.info("list");
		
		model.addAttribute("list", bservice.getListT(boardwriter, cri));
		model.addAttribute("pageMaker", new PageDTOT(cri, 123));
		
		return "/blog/list";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BlogVO blog, RedirectAttributes rttr) {
		
		log.info("register : " + blog);
		
		bservice.register(blog);
		
		rttr.addFlashAttribute("result", blog.getBoardbno());
		
		return "redirect:/blog/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(CriteriaFive cri, @RequestParam("boardbno") Long bno, @RequestParam("writer") String writer, Model model) {
		
		log.info("get or modify");
		
		model.addAttribute("list", bservice.getListF(writer, cri));
		model.addAttribute("blog", bservice.get(bno));
		model.addAttribute("pageMaker", new PageDTOF(cri, 123));
		
	}
	
	@PostMapping("/modify")
	public String modify(BlogVO blog, RedirectAttributes rttr) {
		
		log.info("modify : " + blog);
		
		if(bservice.modify(blog)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/blog/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("boardbno") Long bno, RedirectAttributes rttr) {
		
		log.info("remove : " + bno);
		
		if(bservice.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/blog/list";
	}
	
	@GetMapping("/about")
	public void about(@RequestParam("userid") String userid, Model model) {
		
		model.addAttribute("about", uservice.userList());
	}
}






