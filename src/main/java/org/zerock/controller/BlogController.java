package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/blog/*")
@AllArgsConstructor
public class BlogController {
	
	private BlogService service;
	
	@GetMapping("/home")
	public void home(Model model) {
		
		log.info("home");
		
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/list")
	public void list(CriteriaTen cri, Model model) {
		
		log.info("list");
		
		model.addAttribute("list", service.getListT(cri));
		model.addAttribute("pageMaker", new PageDTOT(cri, 123));
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BlogVO blog, RedirectAttributes rttr) {
		
		log.info("register : " + blog);
		
		service.register(blog);
		
		rttr.addFlashAttribute("result", blog.getBoardbno());
		
		return "redirect:/blog/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(CriteriaFive cri, @RequestParam("boardbno") Long bno, Model model) {
		
		log.info("get or modify");
		
		model.addAttribute("list", service.getListF(cri));
		model.addAttribute("blog", service.get(bno));
		model.addAttribute("pageMaker", new PageDTOF(cri, 123));
		
	}
	
	@PostMapping("/modify")
	public String modify(BlogVO blog, RedirectAttributes rttr) {
		
		log.info("modify : " + blog);
		
		if(service.modify(blog)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/blog/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("boardbno") Long bno, RedirectAttributes rttr) {
		
		log.info("remove : " + bno);
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/blog/list";
	}
	
	@GetMapping("/about")
	public void about(Model model) {
		
		model.addAttribute("about", "");
	}
}






