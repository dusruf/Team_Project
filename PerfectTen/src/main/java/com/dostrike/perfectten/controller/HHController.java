package com.dostrike.perfectten.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HHController {

	@RequestMapping(value = "/offerList", method = RequestMethod.GET)
	public String offerList() {
		return "hh/offerList";
	}

	@RequestMapping(value = "/searchPerson", method = RequestMethod.GET)
	public String searchPerson() {
		return "hh/searchPerson";
	}

	@RequestMapping(value = "/statusCheck", method = RequestMethod.GET)
	public String statusCheck() {
		return "hh/statusCheck";
	}

	@RequestMapping(value = "/personList", method = RequestMethod.GET)
	public String personList() {
		return "hh/personList";
	}

	@RequestMapping(value = "/goQnaBoard", method = RequestMethod.GET)
	public String qnaBoard() {
		return "qnaBoard";
	}

}// class
