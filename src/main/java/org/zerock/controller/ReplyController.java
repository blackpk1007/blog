package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/reply")
public class ReplyController {

	private ReplyService rservice;
	
	@PostMapping("/register")
	public String ReplyRegister() {
		
		return "";
	}
}
