package com.sample.test.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.test.VO.Chat;
import com.sample.test.VO.ContactMessage;
import com.sample.test.dao.PersonDAO;

@Controller
public class PersonController {

	@Autowired
	PersonDAO dao;
	
	@RequestMapping(value = "/goStatus", method = RequestMethod.GET)
	public String goStatus() {
	
		return "person/status";
	
	}	
	
	//추가 시작
	

	@RequestMapping(value = "/showMessage", method = RequestMethod.GET)
	public @ResponseBody ArrayList<ContactMessage> showMessage(HttpSession session){
		
		ArrayList<ContactMessage> cmList=new ArrayList<ContactMessage>();
		String personId=(String)session.getAttribute("personId");
		int loginFlag=(Integer)session.getAttribute("loginFlag");
		
		System.out.println(personId);
		System.out.println(loginFlag);
		
		if (loginFlag==2) {
			cmList=dao.showMessage(personId);			
		}
		
		System.out.println(cmList);
		
		return cmList;
		
	}
	
	@RequestMapping(value = "/cmDetail", method = RequestMethod.GET)
	public @ResponseBody ContactMessage cmDetail(int cmSeq){
	
		ContactMessage cm=new ContactMessage();
		cm=dao.cmDetail(cmSeq);
		System.out.println("cmDetail Controller : "+cm);
		
		return cm;
	}
	
	@RequestMapping(value = "/cmAnswer", method = RequestMethod.POST)
	public @ResponseBody int cmAnswer(int cmSeq, String cmAnswer, String personId){
		HashMap<String, Object> changeStatus = new HashMap<String, Object>();
		HashMap<String, Object> changeCmAnswer = new HashMap<String, Object>();
		
		
		int result=0;
			
		if (cmAnswer.equals("cmYes")) {
			
			int test=2;
			
			changeStatus.put("changedStatus", test);
			changeStatus.put("personId",personId);
			
			changeCmAnswer.put("changedStatus", test);
			changeCmAnswer.put("cmSeq", cmSeq);
			
			
		} else if(cmAnswer.equals("cmNo")) {
			
			int test=0;
			
			changeStatus.put("changedStatus", test);
			changeStatus.put("personId",personId);
			
			changeCmAnswer.put("changedStatus", test);
			changeCmAnswer.put("cmSeq", cmSeq);
		
			
		} else {
			
			System.out.println("메세지 송신 이상");
			
		}
		
		System.out.println();
		
		result=dao.goSecondStatus(changeStatus);
		
		System.out.println("status 바꾸는 것 : "+result);
		
		result=dao.changeCmAnswer(changeCmAnswer);
			
		System.out.println("CmAnswer 바꾸는 것 : "+result);
		
		int finalResult=0;
		
		if (result==1) {
			finalResult=dao.updateCmStatus(cmSeq);
		}
		
		System.out.println("0422 finalResult : "+finalResult);
		
		return finalResult;

	}	
	
	@RequestMapping(value = "/cmDelete", method = RequestMethod.POST)
	public @ResponseBody int cmDelete(int cmSeq){
		int result=0;
		
		result=dao.cmDelete(cmSeq);
		
		return result;
	}
	
	//추가 끝 
	
	@RequestMapping(value="/selectChatSequence", method=RequestMethod.POST)
	public @ResponseBody int selectChatSequence() {
		int chatSequence = dao.selectChatSeq();
		return chatSequence;
	}
	
	@RequestMapping(value="/selectChat", method=RequestMethod.GET)
	public @ResponseBody ArrayList<Chat> selectChat(String roomSeq, int chatSeq, HttpSession session) {
		
		String userId = null;
		
		
		if((Integer)session.getAttribute("loginFlag") == 1) {
			userId = (String)session.getAttribute("hhId");
		}else if((Integer)session.getAttribute("loginFlag") == 2) {
			userId = (String)session.getAttribute("personId");
		}else {
			System.out.println("경고!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		}
		
		HashMap<String, Object> parameter  = new HashMap<String, Object>();
		
		parameter.put("roomSeq", roomSeq);
		parameter.put("userId", userId);
		parameter.put("chatSeq", chatSeq);
		
		ArrayList<Chat> chatList=dao.selectChat(parameter);
		
		return chatList;
	}
	
	@RequestMapping(value="insertChat", method=RequestMethod.POST)
	public @ResponseBody void insertChat(Chat chat, HttpSession session) {
		
		String userId = null;

		if ((Integer) session.getAttribute("loginFlag") == 1) {
			userId = (String) session.getAttribute("hhId");
		} else if ((Integer) session.getAttribute("loginFlag") == 2) {
			userId = (String) session.getAttribute("personId");
		} else {
			System.out.println("경고!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		}
		chat.setUserId(userId);
		dao.insertChat(chat);
	}
	
	@RequestMapping(value = "/regResume", method = RequestMethod.GET)
	public String resumeReg() {
	
		return "person/resume";
	
	} 
	

	
	
	
	
}//class
