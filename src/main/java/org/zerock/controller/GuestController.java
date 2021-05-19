package org.zerock.controller;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.GuestVO;
import org.zerock.service.GuestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/reply")
@Log4j
@RestController
public class GuestController {

	private GuestService gservice;
	
	@PostMapping(value = "/register", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> GuestRegister(@RequestBody GuestVO vo) {
		
		log.info("GuestVO : " + vo);
		
		int insertCount = gservice.register(vo);
		
		return return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
