package com.dostrike.perfectten.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dostrike.perfectten.DAO.QnaDAO;
import com.dostrike.perfectten.VO.QnaComment;
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
	public @ResponseBody List<QnaBoard> qList() { //글을 불러오는 메서드

		List<QnaBoard> qList;		
		qList=dao.qList();
		
		return qList;
	}

	@RequestMapping(value = "/writeQna", method = RequestMethod.GET)
	public String writeQna() { //글쓰기 페이지로 이동하는 메서드
	
		return "qna/writeQna";
	
	}
	
	@RequestMapping(value = "/inputQna", method = RequestMethod.POST)
	public String inputQna(QnaBoard qna, HttpSession session) { //글 등록하는 메서드
	
		String loginId=(String) session.getAttribute("loginId");
		qna.setPersonId(loginId);

		int result;
		
		//비밀글 설정 수정 필요
		
		result=dao.inputQna(qna);
		
		return "redirect:/qnaBoard";
	
	}
	
	@RequestMapping(value = "/qnaDetail", method = RequestMethod.GET)
	public String qnaDetail(int qBoardSeq, Model model, HttpSession session) { //글 상세보기로 페이지 이동

		String loginId=(String)session.getAttribute("loginId");
		int loginFlag=Integer.parseInt(session.getAttribute("loginFlag").toString());
		String hhId=(String) session.getAttribute("hhId");
		String hhName=(String) session.getAttribute("hhName");
		
		ArrayList<HashMap<String, Object>> qna=dao.selectQna(qBoardSeq);
		String id=(String)qna.get(0).get("PERSONID");
	
		model.addAttribute("qBoardSeq", qBoardSeq);
		
		boolean flag=id.equals(loginId);
		
		if(loginFlag==2&&!flag) {			
			
			model.addAttribute("message","본인 이외의 글은 볼 수 없습니다.");
			return "redirect:/qna/qnaBoard";
	
		} else if (loginFlag==1){
			
			model.addAttribute("hhId", hhId); 
			model.addAttribute("hhName", hhName); 
			return "qna/qnaDetail";			
		
		} else {
		
			return "qna/qnaDetail";			
		
		}
			
		
	}

	@RequestMapping(value = "/selectQna", method = RequestMethod.GET)
	public @ResponseBody ArrayList<HashMap<String, Object>> selectQna(int qBoardSeq) { //게시글과 댓글을 같이 불러오는 ajax
		
		ArrayList<HashMap<String, Object>> qna=dao.selectQna(qBoardSeq);
//		System.out.println(qna);
		
		return qna;
		
	}

	@RequestMapping(value = "/insertComment", method = RequestMethod.POST)
	public @ResponseBody int insertComment(QnaComment comment) { //댓글 등록  ajax
	
//		System.out.println(comment);
		
		int result=0;
		result=dao.insertComment(comment);
		
		return result;
	}
	
	
	
}//class
