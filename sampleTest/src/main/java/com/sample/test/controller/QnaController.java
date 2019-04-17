package com.sample.test.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.test.VO.QnaBoard;
import com.sample.test.dao.QnaDAO;


@Controller
public class QnaController {

	@Autowired
	QnaDAO dao;
	
	@RequestMapping(value = "/personQList", method = RequestMethod.GET)
	public @ResponseBody List<QnaBoard> personQList(HttpSession session) { //글을 불러오는 메서드

		int loginFlag=(Integer)session.getAttribute("loginFlag");
		List<QnaBoard> qList=null;		
		
		
		if (loginFlag==2) {
			
			String personId=(String)session.getAttribute("personId");
			System.out.println("QnaController personId : "+personId);
			qList=dao.personQList(personId);
			System.out.println("QnaController qList : "+qList);
			
			
			
		}
		
		return qList;
	}

	@RequestMapping(value = "/hhQList", method = RequestMethod.GET)
	public @ResponseBody List<QnaBoard> hhQList(HttpSession session) { //글을 불러오는 메서드

		int loginFlag=(Integer)session.getAttribute("loginFlag");
		List<QnaBoard> qList=null;		
		
		
		if (loginFlag==2) {
			
			String personId=(String)session.getAttribute("personId");
			System.out.println("QnaController personId : "+personId);
			qList=dao.personQList(personId);
			System.out.println("QnaController qList : "+qList);
			
		} else if(loginFlag==1) {

			qList=dao.qList();
			System.out.println(qList);
		}
		
		return qList;
	}
	
	
}//class
