package com.dostrike.perfectten.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PersonController {

	@RequestMapping(value = "/resumeReg", method = RequestMethod.GET)
	public String resumeReg() {
	
		return "person/resume";
	
	}
	
	@RequestMapping(value = "/resumeUpdate", method = RequestMethod.GET)
	public String resumeUpdate() {
	
		return "person/resume";
	
	}
	
	@RequestMapping(value = "/qnaBoard", method = RequestMethod.GET)
	public String qnaBoard() {
	
		return "qnaBoard";
	
	}
	
}//class
