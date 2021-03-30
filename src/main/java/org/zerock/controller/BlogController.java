package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BlogVO;
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
	public void list(Model model) {
		
		log.info("list");
		
		model.addAttribute("list", service.getList());
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
	
	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, Model model) {
		
		log.info("get");
		
		model.addAttribute("blog", service.get(bno));
	}
	
	@GetMapping("/modify")
	public String modify(BlogVO blog, RedirectAttributes rttr) {
		
		log.info("modify : " + blog);
		
		if(service.modify(blog)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/blog/list";
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		
		log.info("remove : " + bno);
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/blog/list";
	}
}






