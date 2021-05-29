package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.GuestVO;
import org.zerock.service.GuestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/guestreply")
@Log4j
@RestController
public class GuestController {

	private GuestService gservice;
	
	@PostMapping(value = "/register", consumes = "application/json", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> GuestRegister(@RequestBody GuestVO vo) {
		
		log.info("GuestVO : " + vo);
		
		int insertCount = gservice.register(vo);
		
		log.info("Guest INSERT COUNT : " + insertCount);
		
		return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, 
			value = "/{guestbno}", consumes = "application/json")
	public ResponseEntity<String> modify(@RequestBody GuestVO vo, @PathVariable("guestbno") Long guestbno){

		//	vo.setRno(rno);


		log.info("rno : " + guestbno);
		log.info("modify : " + vo);

		return gservice.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping("/{guestbno}")
	public ResponseEntity<String> remove(@RequestBody GuestVO vo, @PathVariable("guestbno") Long guestbno){
		
		log.info("remove : " + guestbno);
		
		log.info("guestwriter : " + vo.getGuestwriter());
		
		return gservice.remove(guestbno) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				
	}
	
	@GetMapping(value = "/{guestbno}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<GuestVO> get(@PathVariable("guestbno") Long guestbno){
		
		log.info("get : " + guestbno);
		
		return new ResponseEntity<>(gservice.get(guestbno), HttpStatus.OK);
	}

}
