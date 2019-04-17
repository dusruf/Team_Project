package com.sample.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sample.test.dao.PersonDAO;

@Controller
public class PersonController {

	@Autowired
	PersonDAO dao;
	
	@RequestMapping(value = "/regResume", method = RequestMethod.GET)
	public String resumeReg() {
	
		return "person/resume";
	
	} 
	

	
	
	
}//class
