package com.sample.test.controller;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CamController {
	
	@RequestMapping(value = "/CamStart", method = RequestMethod.GET)
	   public @ResponseBody String CamStart() {
	      String w = "https://perfectten.website:8888/#";
	      w = w + RandomStringUtils.random(12, true, true);
	      StringBuilder W = new StringBuilder(w);
	      W.setCharAt(41, '-');
	      System.out.println(W.toString());
	      return W.toString();
	   }
}
