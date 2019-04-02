package com.dostrike.perfectten.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dostrike.perfectten.DAO.UserDAO;
import com.dostrike.perfectten.VO.HeadHunter;
import com.dostrike.perfectten.VO.Login;
import com.dostrike.perfectten.VO.Person;

@Controller
public class UserController {

	@Autowired
	UserDAO dao;
	
	@RequestMapping(value = "/goReg", method = RequestMethod.GET)
	public String goReg() {
		return "register";
	}
	
	@RequestMapping(value = "/hhReg", method = RequestMethod.POST)
	public String hhReg(HeadHunter hh) {
				
		//중복 검사 시에 HH 테이블과 PERSON 테이블 전부 갔다 와야 함
		
		int result=0;
		result=dao.hhReg(hh);
		
		return "home";
	}
	
	@RequestMapping(value = "/personReg", method = RequestMethod.POST)
	public String personReg(Person person) {

		//중복 검사 시에 HH 테이블과 PERSON 테이블 전부 갔다 와야 함
		
		int result=0;
		result=dao.personReg(person);
	
		return "home";
	}
	
	//일단 사이트 흐름을 만들기 위해 로그인 기능을 넣지 않았음
	//나중에 수정할 것
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Login login, HttpSession session) {
		
		//관리자 로그인 수정 요망. 일단 급한 대로 해놨음.
		if (login.getLoginId().equals("admin")&&login.getLoginPw().equals("admin")) {
			login.setLoginFlag(3);
			
		}
				
		if (login.getLoginFlag()==1) { //HH 로그인
			
			HeadHunter hh;			
			hh=dao.loginHH(login);
			
			if (hh!=null) {
				
	//			String loginId=hh.getHhId();
				int loginFlag=hh.getLoginFlag();
				String hhId=hh.getHhId();
				String hhName=hh.getHhName();
				
				
//				session.setAttribute("loginId", loginId);
				session.setAttribute("loginFlag", loginFlag);
				session.setAttribute("hhId", hhId);
				session.setAttribute("hhName", hhName);
				
				return "hh/hhMain";				
			} else {
				return "home";
			}
			
		} else if(login.getLoginFlag()==2) { //person 로그인

			Person person;
			person=dao.loginPerson(login);
			
			if (person!=null) {
				
				String loginId=person.getPersonId();
				String personName=person.getPersonName();
				String personEmail=person.getPersonEmail();
				int loginFlag=person.getLoginFlag();
				
//				System.out.println("personName 확인 : "+personName);
				
				session.setAttribute("loginId", loginId);
				session.setAttribute("personName", personName);
				session.setAttribute("personEmail", personEmail);
				session.setAttribute("loginFlag", loginFlag);
				
				return "person/personMain";
			} else {
				return "home";
			}
						
		} else if(login.getLoginFlag()==3) {			
			return "admin/adminMain";		
		} else {			
			return "home";			
		}
	
	}
	
	
}//class
