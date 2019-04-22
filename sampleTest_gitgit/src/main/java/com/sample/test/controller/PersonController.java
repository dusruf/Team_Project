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
import com.sample.test.dao.PersonDAO;

@Controller
public class PersonController {

	@Autowired
	PersonDAO dao;
	
	@RequestMapping(value="/selectChatSequence", method=RequestMethod.POST)
	public @ResponseBody int selectChatSequence() {
		int chatSequence = dao.selectChatSeq();
		return chatSequence;
	}
	
	@RequestMapping(value="/selectChat", method=RequestMethod.GET)
	public @ResponseBody ArrayList<Chat> selectChat(String roomSeq, int chatSeq, HttpSession session) {
		
		String userId = null;
		
		
		if((Integer)session.getAttribute("loginFlag") == 1) {//headHunterLogin
			userId = (String)session.getAttribute("hhId");
		}else if((Integer)session.getAttribute("loginFlag") == 2) {//personLogin
			userId = (String)session.getAttribute("personId");
		}else if((Integer)session.getAttribute("loginFlag") == 3){//googleLogin
			userId = (String) session.getAttribute("googleId");
		}else {
			System.out.println("경고!!!!");
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

		if ((Integer) session.getAttribute("loginFlag") == 1) { //HeadHunterLogin
			userId = (String) session.getAttribute("hhId");
			
		} else if ((Integer) session.getAttribute("loginFlag") == 2) { //PersonLogin
			userId = (String) session.getAttribute("personId");
			
		} else if((Integer) session.getAttribute("loginFlag") == 3){ //googleLogin
			userId = (String) session.getAttribute("googleId");			
		} else {
			System.out.println("경고!!!!!!!!!!");
		}
		System.out.println(userId);
		chat.setUserId(userId);
		dao.insertChat(chat);
	}
	
	@RequestMapping(value = "/regResume", method = RequestMethod.GET)
	public String resumeReg() {
	
		return "person/resume";
	
	} 
	

	
	
	
}//class
