package com.sample.test.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.sample.test.VO.HeadHunter;
import com.sample.test.VO.Login;
import com.sample.test.VO.Person;
import com.sample.test.dao.UserDAO;



@Controller
public class UserController {

	@Autowired
	UserDAO dao;
	
	@RequestMapping(value = "/goReg", method = RequestMethod.GET)
	public String goReg() {
		return "register";
	}
	
	
	@RequestMapping(value = "/hhReg", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String hhReg(HeadHunter hh) {
				
		//중복 검사 시에 HH 테이블과 PERSON 테이블 전부 갔다 와야 함
		
		String idCheck = hh.getHhId();
		Person personIdCheck = dao.selectPerson(idCheck);
		HeadHunter headHunterIdCheck = dao.selectHeadHunter(idCheck);
		int result=0;
		
		if(personIdCheck != null || headHunterIdCheck != null) {
			return "중복된 아이디 입니다.";
		}else {
			result=dao.hhReg(hh);
			if(result==1) return "success";
			else return "fail";
		}		
	}
	
	@RequestMapping(value = "/personReg", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String personReg(Person person) {

		//중복 검사 시에 HH 테이블과 PERSON 테이블 전부 갔다 와야 함
		
		String idCheck = person.getPersonId();
		Person personIdCheck = dao.selectPerson(idCheck);
		HeadHunter headHunterIdCheck = dao.selectHeadHunter(idCheck);
		int result=0;
		
		if(personIdCheck != null || headHunterIdCheck != null) {
			return "중복된 아이디 입니다.";
		}else {
			result=dao.personReg(person);
			if(result==1)return "success";
			else return "failure";
		}		

	}
	
	//일단 사이트 흐름을 만들기 위해 로그인 기능을 넣지 않았음
	//나중에 수정할 것
	
	
	//googleLogin
	@RequestMapping(value="/googleLogin", method=RequestMethod.GET)
	public String googleLogin() {
		
		return "person/personMain";
	}
	
	@RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
	public String login(Login login, HttpSession session) {
		
		
		
		//관리자 로그인 수정 요망. 일단 급한 대로 해놨음.
		/*
		if (login.getLoginId().equals("admin")&&login.getLoginPw().equals("admin")) {
			login.setLoginFlag(3);
		}
		*/
		
		if(login.getLoginFlag() != 0) {			
			session.setAttribute("loginId", login.getLoginId());
			session.setAttribute("loginPw", login.getLoginPw());
			session.setAttribute("loginFlag", login.getLoginFlag());
		}else {			
			login.setLoginId((String)session.getAttribute("loginId"));
			login.setLoginPw((String)session.getAttribute("loginPw"));
			login.setLoginFlag((Integer)session.getAttribute("loginFlag"));
		}
		
		
		
		System.out.println("컨트롤러 /login : "+login);
				
		if (login.getLoginFlag()==1) { //HH 로그인
			
			HeadHunter hh;			
			hh=dao.loginHH(login);
			
			if (hh!=null) {
				
				int loginFlag=hh.getLoginFlag();
				String hhId=hh.getHhId();
				String hhName=hh.getHhName();
				
				
				session.setAttribute("loginFlag", loginFlag);
				session.setAttribute("hhId", hhId);
				session.setAttribute("hhName", hhName);
				
				return "Head/HeadHunter";				
			} else {
				return "Main/Main";
			}
			
		} else if(login.getLoginFlag()==2) { //person 로그인

			Person person;
			person=dao.loginPerson(login);
			
			
			if (person!=null) {
				
				
				String personId=person.getPersonId();
				String personName=person.getPersonName();
				String personEmail=person.getPersonEmail();
				int loginFlag=person.getLoginFlag();
				
//				System.out.println("personName 확인 : "+personName);
				
				session.setAttribute("personId", personId);
				session.setAttribute("personName", personName);
				session.setAttribute("personEmail", personEmail);
				session.setAttribute("loginFlag", loginFlag);
												
				return "person/personMain";
			} else {
				return "Main/MainPage";
			}
						
		} else if(login.getLoginFlag()==3) {			
			return "admin/adminMain";		
		} else {			
			return "Main/MainPage";			
		}
	
	}//login
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		if(session != null) {
			session.invalidate();
		}
		
		return "Main/MainPage";
	}
	
	// 구글로그인
	@RequestMapping(value = "/tokensignin", method = RequestMethod.POST)
	public String tokenSignIn(String id_token, HttpServletResponse response, HttpSession session) throws GeneralSecurityException, IOException {
	    final NetHttpTransport transport = GoogleNetHttpTransport.newTrustedTransport();
	    final JacksonFactory jsonFactory = JacksonFactory.getDefaultInstance();
	    GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
	    		.setAudience(Collections.singletonList("8468277188-blbc1ofh6q6i0ot0t70o52ph8488qekr.apps.googleusercontent.com"))
	    		.build();

	    GoogleIdToken idToken = verifier.verify(id_token);
	    System.out.println(idToken);
		if (idToken != null) {
		  Payload payload = idToken.getPayload();

		  // Print user identifier
		  String userId = payload.getSubject();
		  System.out.println("User ID: " + userId);

		  // Get profile information from payload
		  String email = payload.getEmail();
		  boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
		  String name = (String) payload.get("name");
		  String pictureUrl = (String) payload.get("picture");
		  String locale = (String) payload.get("locale");
		  String familyName = (String) payload.get("family_name");
		  String givenName = (String) payload.get("given_name");
		  String aud = (String)payload.get("aud");
		  String iss = (String)payload.get("iss");
		  
		  session.setAttribute("googleId", email);
		  session.setAttribute("loginFlag", 3);

		  // Use or store profile information
		  // ...

		} else {
		  System.out.println("Invalid ID token.");
		}
		return "person/personMain";
	}
	
}//class
