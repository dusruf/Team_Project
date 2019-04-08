package com.dostrike.perfectten.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dostrike.perfectten.DAO.PersonDAO;
import com.dostrike.perfectten.VO.ContactMessage;

@Controller
public class PersonController {

	@Autowired
	PersonDAO dao;
	
	@RequestMapping(value = "/regResume", method = RequestMethod.GET)
	public String resumeReg() {
	
		return "person/resume";
	
	} 
	
	@RequestMapping(value = "/showResume", method = RequestMethod.GET)
	public String resumeUpdate() {
	
		return "person/showResume";
	
	}
	/*
	@RequestMapping(value = "/showResume", method = RequestMethod.GET)
	public String resumeUpdate() {
	
		return "person/showResume";
	
	}
	*/
	
	@RequestMapping(value = "/goStatus", method = RequestMethod.GET)
	public String goStatus() {
	
		return "person/status";
	
	}
	
	@RequestMapping(value = "/rePersonMain", method = RequestMethod.GET)
	public String rePersonMain() {
	
		return "person/personMain";
	
	}
	
	@RequestMapping(value = "/showMessage", method = RequestMethod.GET)
	public @ResponseBody ArrayList<ContactMessage> showMessage(HttpSession session){
		
		ArrayList<ContactMessage> cmList=new ArrayList<ContactMessage>();
		String personId=(String)session.getAttribute("loginId");
		int loginFlag=(Integer)session.getAttribute("loginFlag");
		
		System.out.println(personId);
		System.out.println(loginFlag);
		
	//	if (loginFlag==2) {
			cmList=dao.showMessage(personId);			
	//	}
		
		System.out.println(cmList);
		
		return cmList;
		
	}
	
	@RequestMapping(value = "/cmDetail", method = RequestMethod.GET)
	public @ResponseBody ContactMessage cmDetail(int cmSeq){
	
		ContactMessage cm=new ContactMessage();
		cm=dao.cmDetail(cmSeq);
		
		return cm;
	}
	
	@RequestMapping(value = "/cmAnswer", method = RequestMethod.POST)
	public @ResponseBody int cmAnswer(int cmSeq, String cmAnswer, String personId){
		
		HashMap<String, Object> changeStatus = new HashMap<String, Object>();
		int result=0;
			
		if (cmAnswer.equals("cmYes")) {
			
			int test=2;
			
			changeStatus.put("changedStatus", test);
			changeStatus.put("personId",personId);
			
			
		} else if(cmAnswer.equals("cmNo")) {
			
			int test=0;
			
			changeStatus.put("changedStatus", test);
			changeStatus.put("personId",personId);
		
			
		} else {
			
			System.out.println("메세지 송신 이상");
			
		}
		
		result=dao.goSecondStatus(changeStatus);		
		int finalResult=0;
		
		if (result==1) {
			finalResult=dao.updateCmStatus(cmSeq);
		}
		
		return finalResult;
	}
	
}//class
