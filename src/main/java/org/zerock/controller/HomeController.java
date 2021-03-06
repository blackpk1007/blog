package org.zerock.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.CriteriaFive;
import org.zerock.domain.CriteriaTen;
import org.zerock.domain.PageDTOT;
import org.zerock.service.BlogService;
import org.zerock.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@AllArgsConstructor
public class HomeController {
	
	private BlogService bservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, CriteriaTen cri) {

		model.addAttribute("blist", bservice.homeList());
		model.addAttribute("pageMaker", new PageDTOT(cri, 100));
		//int total = bservice.getTotal(cri);
		
		return "home";
	}
	/*private static final Logger logger = LoggerFactory.getLogger(HomeController.class);*/
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}*/
}
	

