package com.dostrike.perfectten.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dostrike.perfectten.VO.Login;

@Controller
public class UserController {

	@RequestMapping(value = "/goReg", method = RequestMethod.GET)
	public String goReg() {
		return "register";
	}
	
	@RequestMapping(value = "/hhReg", method = RequestMethod.POST)
	public String hhReg() {
		return "home";
	}
	
	@RequestMapping(value = "/personReg", method = RequestMethod.POST)
	public String personReg() {
		return "home";
	}
	
	//일단 사이트 흐름을 만들기 위해 로그인 기능을 넣지 않았음
	//나중에 수정할 것
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Login login) {
		
		//관리자 로그인 수정 요망. 일단 급한 대로 해놨음.
		if (login.getLoginId().equals("admin")&&login.getLoginPw().equals("admin")) {
			login.setLoginFlag(3);
			
		}
				
		if (login.getLoginFlag()==1) {
			
			return "hh/hhMain";
			
		} else if(login.getLoginFlag()==2) {

			return "person/personMain";
			
		} else if(login.getLoginFlag()==3) {
			
			return "admin/adminMain";
			
		} else {
			
			return "home";
			
		}
	
	}
	
	
}//class
