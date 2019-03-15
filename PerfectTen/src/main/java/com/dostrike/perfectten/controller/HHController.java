package com.dostrike.perfectten.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dostrike.perfectten.DAO.HHDAO;
import com.dostrike.perfectten.VO.QnaBoard;

@Controller
public class HHController {

	@Autowired
	HHDAO dao;
	
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

	@RequestMapping(value = "/regOffer", method = RequestMethod.GET)
	public String regOffer() {
		return "hh/regOffer";
	}
	
	@RequestMapping(value = "/inputOffer", method = RequestMethod.POST)
	public String inputOffer() {
		return "hh/offerList";
	}

	
}// class
