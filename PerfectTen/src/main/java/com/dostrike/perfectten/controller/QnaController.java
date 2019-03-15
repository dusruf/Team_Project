package com.dostrike.perfectten.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dostrike.perfectten.DAO.QnaDAO;
import com.dostrike.perfectten.VO.QnaBoard;

@Controller
public class QnaController {

	@Autowired
	QnaDAO dao;
	
	@RequestMapping(value = "/qnaBoard", method = RequestMethod.GET)
	public String qnaBoard() {
		return "qna/qnaBoard";
	}
	
	@RequestMapping(value = "/qList", method = RequestMethod.GET)
	public @ResponseBody List<QnaBoard> qList() {

		List<QnaBoard> qList;		
		qList=dao.qList();
		
		return qList;
	}

	@RequestMapping(value = "/writeQna", method = RequestMethod.GET)
	public String writeQna() { //글쓰기 페이지로 이동하는 메서드
	
		return "qna/writeQna";
	
	}
	
	@RequestMapping(value = "/inputQna", method = RequestMethod.GET)
	public String inputQna(QnaBoard qna, HttpSession session) { //글 등록하는 메서드
	
		String loginId=(String) session.getAttribute("loginId");
		qna.setPersonId(loginId);
		System.out.println(qna);

		int result;
		
		//조회수, 비밀글 설정 수정 필요
		
		result=dao.inputQna(qna);
		
		return "qna/qnaBoard";
	
	}
	
	
}//class
